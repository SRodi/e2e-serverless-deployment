#!/bin/bash

ibmcloud login --apikey $IC_API_KEY -r eu-de

ibmcloud schematics ws new --file ./config.json