GitHub = require 'github'
getStdin = require 'get-stdin'

getStdin()
.then (assignee) ->
  assignees = JSON.parse assignee
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

  github.issues.addAssigneesToIssue
    owner: 'aafrey'
    repo: process.env.GITHUB_REPO
    number: assignee.number
    assignees: assignee.githubUser
.then console.log
.catch console.log.bind console
