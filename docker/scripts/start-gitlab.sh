#!/bin/bash

# Start gitlab
docker compose -f gitlab/compose.yml --env-file gitlab/.env up -d
