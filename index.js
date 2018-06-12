const ApiBuilder = require('claudia-api-builder')

const api = new ApiBuilder({requestFormat: 'AWS_PROXY'})

api.get('/plural/apple', () => 'apples')

exports.handler = (event, context, callback) => {
  /* eslint-disable-next-line */
  console.log(JSON.stringify({
    path: event.path,
    resource: event.resource,
    requestContext: {
      path: event.requestContext.path,
      resourcePath: event.requestContext.resourcePath,
    }
  }, null, 2))
  return api.proxyRouter(event, context, callback)
}
