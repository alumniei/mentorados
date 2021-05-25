#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails
rm -f /app/tmp/pids/server.pid

sleep 5 # wait until the db is ready

rails db:create db:migrate

# Then exec the container's main process (what's set on the CMD of the Dockerfile)
exec "$@"