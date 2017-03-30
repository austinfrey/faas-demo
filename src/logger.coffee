Chain = require './faas-chain'
getStdin = require 'get-stdin'


submitToAirtable = new Chain 'http://45.63.7.154:8080/function/faas_submitentry'
updateGithubIssue = new Chain 'http://45.63.7.154:8080/faas_updategithubissue'

getStdin()
.then (incomingPayload) ->
  airtableEntry =
    'Issue': incomingPayload.issue.id
    'Title': incomingPayload.issue.title
    'Labels': incomingPayload.issue.labels[0].name
    'Repo': incomingPayload.repository.full_name
    'Priority': 'High'
    'Status': 'Backlog'
    'Bug Source': 'Github Issue'
    'Description': incomingPayload.issue.body
    'Notified Users?': true
.then (airtableEntry) -> submitToAirtable.post(airtableEntry)
.then (response) -> updateGithubIssue.post(response)
.then console.log.bind console
