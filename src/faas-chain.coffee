rp = require 'request-promise'
async = require 'async'

class FaaS
  constructor: (url) ->
    @options =
      json: true
      url: url
      method: 'POST'

    @get = (body) =>
      @options.method = 'GET'
      @options.body = body
      rp(@options)

    @post = (body) =>
      @options.method = 'POST'
      @options.body = body
      rp(@options)
