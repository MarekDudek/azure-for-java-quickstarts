#!/bin/bash

az group delete \
    --name "$AZ_RESOURCE_GROUP" \
    --yes
