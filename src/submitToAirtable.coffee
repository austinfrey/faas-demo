getStdin = require 'get-stdin'
Airtable = require('airtable')
base = new Airtable(apiKey: 'keya5owBYIn0zRzxP').base('app2PLtM6KVLhzhrJ')
payload = require './payload.json'

getStdin()
.then (payload) ->
  base('Bugs & Issues')
    .create payload
    , (err, record) ->
      if err then console.log err
      console.log record.getId()
  return
.then (issue) ->
  
