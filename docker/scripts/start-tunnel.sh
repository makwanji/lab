#!/bin/bash

# Start tunnel
docker compose -f tunnel/compose.yml --env-file tunnel/.env up cloudflaretunnel nginx -d
