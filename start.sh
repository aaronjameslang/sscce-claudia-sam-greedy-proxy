#! /bin/sh
set -eux

set +u
. venv/bin/activate
set -u
exec sam local start-api
