getStdin = require 'get-stdin'
FaaS = require './faas-chain'
fs = require 'fs'
async = require 'async'

baseUrl = 'http://gateway:8080/function/'
###
data object should look like this:
data =
  func: "stack_function"
  body: "whatever text or JSON
  count: numToLoop
  time: whateverTimeInterval
###

counter = 0

getStdin()
.then (data) ->
  fs = require('fs')
  request = require('request')
  async = require('async')
  async.whilst (->
    true
  ), (cb) ->
    payload = 'STRESS!'
    request.post {
      uri: 'http://localhost:8080/function/stack_coffee'
      json: true
      body: payload
    }, (err, res, data) ->
      if err != null
        console.error err
        return cb()
      console.error res.statusCode, res.body
      cb()
      return
    return
.catch console.log.bind console
