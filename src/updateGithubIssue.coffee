getStdin = require 'get-stdin'
rp = require 'request-promise'

payload =
  headers:
    'User-Agent': 'aafrey'
  method: 'POST'
  json: true

data =
  issue: '1'
  githubuserName: 'aafrey'

#getStdin()
#.then (data) ->
payload.url = "https://api.github.com/repos/aafrey/faas-demo/#{data.issue}/assignees?client_id=aafrey&client_secret=ce1d665a2f8a4d2ca2e92def3f4c98b82c91db98"
payload.body =
  assignees: [data.githubUserName]
rp(payload)
.then (response) -> console.log response
.catch console.log.bind console

###
payload =
  method: 'POST'
  json: true
  url: 'https://api.github.com/repos/aafrey/faas-demo/{/number}/assignees'
  body: ['githubUserName']
###
