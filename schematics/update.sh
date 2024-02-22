#!/bin/bash

WORKSPACE_ID="$1"

schematics_ws_status() {
    RCVAR=255
    TRYCOUNT=0
    while [[ $RCVAR != 0 ]] && [[ $TRYCOUNT -le 10 ]]; do
        printf $(ibmcloud schematics ws action --id "$WORKSPACE_ID" --output json | jq -r '.jobs[0].status.workspace_job_status.commands[].outcome') && RCVAR=$? || RCVAR=$?
        if [ $RCVAR != 0 ]; then sleep 10; fi
        TRYCOUNT=$((TRYCOUNT+1))
    done
}
ibmcloud schematics ws update --id "$SCHEMATICS_WS_ID" --pull-latest
action_status=$(schematics_ws_status)
while [[ "$action_status" != "COMPLETED" ]]; do echo "The Schematics Status is $action_status"; action_status=$(schematics_ws_status); sleep 5; done
echo "Schematics update done"