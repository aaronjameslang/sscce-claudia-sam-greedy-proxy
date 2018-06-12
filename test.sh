#! /bin/sh
set -eux

eslint . --fix

apples="$(curl -s http://localhost:3000/plural/apple)"
bananas="$(curl -s http://localhost:3000/plural/banana)"

test \"apples\" = "$apples"
test no\ data = "$bananas"
