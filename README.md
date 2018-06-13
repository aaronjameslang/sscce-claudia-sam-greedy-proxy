# [SSCCE](http://sscce.org/): [Claudia](https://github.com/claudiajs/claudia-api-builder), [SAM](https://github.com/awslabs/aws-sam-cli), [Greedy Proxy](https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html)

Run `npm start &` before `npm t`

- [aws-sam-cli/issues/434](https://github.com/awslabs/aws-sam-cli/issues/434)

## Actual Behaviour

```
> sscce-claudia-sam-greedy-proxy@0.0.0 test /Users/aaronlang/sscce-claudia-sam-greedy-proxy
> ./test.sh

+ eslint . --fix
++ curl -s http://localhost:3000/plural/apple
2018-06-13 12:12:35 Invoking index.handler (nodejs6.10)
2018-06-13 12:12:35 Found credentials in shared credentials file: ~/.aws/credentials

Fetching lambci/lambda:nodejs6.10 Docker container image......
2018-06-13 12:12:41 Mounting /Users/aaronlang/sscce-claudia-sam-greedy-proxy as /var/task:ro inside runtime container
START RequestId: 8a3b3b7c-9b31-110c-89cf-05995b94b617 Version: $LATEST
2018-06-13T00:13:08.874Z        8a3b3b7c-9b31-110c-89cf-05995b94b617    {
  "path": "/plural/apple",
  "resource": "/{proxy+}",
  "requestContext": {
    "path": "/{proxy+}",
    "resourcePath": "/{proxy+}"
  }
}
2018-06-13T00:13:08.882Z        8a3b3b7c-9b31-110c-89cf-05995b94b617    {"errorMessage":"no handler for GET /{proxy+}"}
END RequestId: 8a3b3b7c-9b31-110c-89cf-05995b94b617
REPORT RequestId: 8a3b3b7c-9b31-110c-89cf-05995b94b617  Duration: 52.43 ms      Billed Duration: 100 ms Memory Size: 128 MB     Max Memory Used: 29 MB
2018-06-13 12:12:42 No Content-Type given. Defaulting to 'application/json'.
2018-06-13 12:12:42 127.0.0.1 - - [13/Jun/2018 12:12:42] "GET /plural/apple HTTP/1.1" 200 -
+ apples='no data'
++ curl -s http://localhost:3000/plural/banana
2018-06-13 12:12:42 Invoking index.handler (nodejs6.10)
2018-06-13 12:12:42 Found credentials in shared credentials file: ~/.aws/credentials

Fetching lambci/lambda:nodejs6.10 Docker container image......
2018-06-13 12:12:48 Mounting /Users/aaronlang/sscce-claudia-sam-greedy-proxy as /var/task:ro inside runtime container
START RequestId: 987f0e14-55d3-104c-ff6e-cb1f45dc3a4e Version: $LATEST
2018-06-13T00:13:15.818Z        987f0e14-55d3-104c-ff6e-cb1f45dc3a4e    {
  "path": "/plural/banana",
  "resource": "/{proxy+}",
  "requestContext": {
    "path": "/{proxy+}",
    "resourcePath": "/{proxy+}"
  }
}
2018-06-13T00:13:15.827Z        987f0e14-55d3-104c-ff6e-cb1f45dc3a4e    {"errorMessage":"no handler for GET /{proxy+}"}
END RequestId: 987f0e14-55d3-104c-ff6e-cb1f45dc3a4e
REPORT RequestId: 987f0e14-55d3-104c-ff6e-cb1f45dc3a4e  Duration: 53.37 ms      Billed Duration: 100 ms Memory Size: 128 MB     Max Memory Used: 29 MB
2018-06-13 12:12:49 No Content-Type given. Defaulting to 'application/json'.
2018-06-13 12:12:49 127.0.0.1 - - [13/Jun/2018 12:12:49] "GET /plural/banana HTTP/1.1" 200 -
+ bananas='no data'
+ test '"apples"' = 'no data'
npm ERR! Test failed.  See above for more details.
```

## Expected Behavior

```
> sscce-claudia-sam-greedy-proxy@0.0.0 test /Users/aaronlang/sscce-claudia-sam-greedy-proxy
> ./test.sh

+ eslint . --fix
++ curl -s http://localhost:3000/plural/apple
2018-06-13 12:01:13 Invoking index.handler (nodejs6.10)
2018-06-13 12:01:13 Found credentials in shared credentials file: ~/.aws/credentials

Fetching lambci/lambda:nodejs6.10 Docker container image......
2018-06-13 12:01:18 Mounting /Users/aaronlang/sscce-claudia-sam-greedy-proxy as /var/task:ro inside runtime container
START RequestId: 2aaef065-2cbf-1e20-1b32-623da3d844b6 Version: $LATEST
2018-06-13T00:01:45.290Z        2aaef065-2cbf-1e20-1b32-623da3d844b6    {
  "path": "/plural/apple",
  "resource": "/{proxy+}",
  "requestContext": {
    "path": "/{proxy+}",
    "resourcePath": "/{proxy+}"
  }
}
END RequestId: 2aaef065-2cbf-1e20-1b32-623da3d844b6
REPORT RequestId: 2aaef065-2cbf-1e20-1b32-623da3d844b6  Duration: 43.22 ms      Billed Duration: 100 ms Memory Size: 128 MB     Max Memory Used: 29 MB
2018-06-13 12:01:19 127.0.0.1 - - [13/Jun/2018 12:01:19] "GET /plural/apple HTTP/1.1" 200 -
+ apples='"apples"'
++ curl -s http://localhost:3000/plural/banana
2018-06-13 12:01:19 Invoking index.handler (nodejs6.10)
2018-06-13 12:01:19 Found credentials in shared credentials file: ~/.aws/credentials

Fetching lambci/lambda:nodejs6.10 Docker container image......
2018-06-13 12:01:24 Mounting /Users/aaronlang/sscce-claudia-sam-greedy-proxy as /var/task:ro inside runtime container
START RequestId: a06180ef-f37b-1066-4ebc-2bbb5e9f7696 Version: $LATEST
2018-06-13T00:01:51.629Z        a06180ef-f37b-1066-4ebc-2bbb5e9f7696    {
  "path": "/plural/banana",
  "resource": "/{proxy+}",
  "requestContext": {
    "path": "/{proxy+}",
    "resourcePath": "/{proxy+}"
  }
}
2018-06-13T00:01:51.635Z        a06180ef-f37b-1066-4ebc-2bbb5e9f7696    {"errorMessage":"no handler for GET /plural/banana"}
END RequestId: a06180ef-f37b-1066-4ebc-2bbb5e9f7696
REPORT RequestId: a06180ef-f37b-1066-4ebc-2bbb5e9f7696  Duration: 42.09 ms      Billed Duration: 100 ms Memory Size: 128 MB     Max Memory Used: 29 MB
2018-06-13 12:01:25 No Content-Type given. Defaulting to 'application/json'.
2018-06-13 12:01:25 127.0.0.1 - - [13/Jun/2018 12:01:25] "GET /plural/banana HTTP/1.1" 200 -
+ bananas='no data'
+ test '"apples"' = '"apples"'
+ test 'no data' = 'no data'
```
