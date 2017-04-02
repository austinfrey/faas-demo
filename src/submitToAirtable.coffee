getStdin = require 'get-stdin'
Airtable = require('airtable')
base = new Airtable(apiKey: 'keya5owBYIn0zRzxP').base('app2PLtM6KVLhzhrJ')
payload = require './payload.json'

getStdin()
.then (entry) ->
  base('Bugs & Issues')
    .create entry
    , (err, record) ->
      if err
        console.log err
        return
      console.log record.getId()
  return
.catch console.log.bind console
