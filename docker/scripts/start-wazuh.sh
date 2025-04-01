#!/bin/bash

# Start wazuh
docker compose -f wazuh/compose.yml --env-file wazuh/.env up -d
