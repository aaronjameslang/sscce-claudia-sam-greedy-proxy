#! /bin/sh
set -eux

virtualenv venv
set +u
. venv/bin/activate
set -u
pip install aws-sam-cli==0.3.0
