getStdin = require 'get-stdin'
FaaS = require './faas-chain'

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
  data = JSON.parse data
  funcToLoop = new FaaS baseUrl + data.func
  incrementor = ->
    counter++
    funcToLoop.post(data.body)
    if counter is data.count
      clearInterval looper
      console.log 'all done'
  looper = setInterval ( -> incrementor()), data.time
.catch console.log.bind console
