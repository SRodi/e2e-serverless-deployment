#!/bin/bash

WORKSPACE_ID="$SCHEMATICS_WS_ID"

function ws_status() {
    RCVAR=255
    TRYCOUNT=0
    while [[ $RCVAR != 0 ]] && [[ $TRYCOUNT -le 10 ]]; do
        printf $(ibmcloud schematics ws action --id "$WORKSPACE_ID" --output json | jq -r '.jobs[0].status.workspace_job_status.commands[].outcome') && RCVAR=$? || RCVAR=$?
        if [ $RCVAR != 0 ]; then sleep 10; fi
        TRYCOUNT=$((TRYCOUNT+1))
    done
}

function job_status(){
    action_id="$1"
    RCVAR=255
    TRYCOUNT=0
    while [[ $RCVAR != 0 ]] && [[ $TRYCOUNT -le 10 ]]; do
        printf $(ibmcloud schematics job get --id "$action_id" --output json | jq -r '.status.workspace_job_status.status_code') && RCVAR=$? || RCVAR=$?
        if [ $RCVAR != 0 ]; then sleep 10; fi
        TRYCOUNT=$((TRYCOUNT+1))
    done
}

function ws_update() {
    ibmcloud schematics ws update --id "$SCHEMATICS_WS_ID" --pull-latest
    action_status=$(ws_status)
    while [[ "$action_status" != "COMPLETED" ]]; do echo "The Schematics WS Status is $action_status"; action_status=$(ws_status); sleep 5; done
    echo "Schematics WS update done"
}

function plan(){
    action_id=$(ibmcloud schematics plan --id "$WORKSPACE_ID" --output json | jq -r .activityid)
    while [[ ! $(ibmcloud schematics job get --id "$action_id") ]]; do job_status=$(job_status "$action_id"); done
    while [[ "$job_status" == "job_pending" && "$job_status" != "job_finished" ]]; do
        job_status=$(job_status "$action_id")
        echo "Schematics plan status for WS $WORKSPACE_ID: $job_status"
        if [[ "$job_status" == "job_failed" ]]; then exit 2; fi
    done
}