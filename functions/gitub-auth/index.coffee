GitHub = require 'github'
getStdin = require 'get-stdin'

getStdin()
.then (assignees) ->
  assignees = JSON.parse assignees
  github = new GitHub
    debug: true
    protocol: 'https'
    host: 'api.github.com'
    headers:
      "user-agent": 'any-user'
    Promise: require 'bluebird'
    followRedirects: false
    timeout: 5000

  github.authenticate
    type: 'oauth'
    token: process.env.GITHUB_API_TOKEN
    #token = process.env.GITHUB_API_TOKEN

  github.issues.addAssigneesToIssue
    owner: 'aafrey'
    repo: 'faas-demo'
    number: '17'
    assignees: assignees
.then console.log
.catch console.log.bind console
