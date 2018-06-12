#! /bin/sh
set -eux

sam package \
  --template-file template.yml \
  --s3-bucket c5a1880c-9bdd-452b-aeca-bd6fb24408a3-sscce-claudia-sam-greedy-p \
  --output-template-file template-output.yml
sam deploy --template-file template-output.yml \
  --stack-name sscce-claudia-sam-greedy-proxy \
  --capabilities CAPABILITY_IAM
rm template-output.yml
