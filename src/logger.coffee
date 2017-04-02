Chain = require './faas-chain'
getStdin = require 'get-stdin'
details = null

submitToAirtable = new Chain 'http://45.63.7.154:8080/function/fs_submitentry'
lowestIssueCount = new Chain('http://45.63.7.154:8080/function/fs_lowestissuecount')
updateGithubIssue = new Chain 'http://45.63.7.154:8080/fs_updategithubissue'

getStdin()
.then (incomingPayload) ->
  details.githubIssue = incomingPayload.issue.number
  details.githubRepo = incomingPayload.repository.issues_url
  airtableEntry =
    'Issue': incomingPayload.issue.number
    'Title': incomingPayload.issue.title
    'Labels': incomingPayload.issue.labels[0].name
    'Repo': incomingPayload.repository.full_name
    'Priority': 'High'
    'Status': 'Backlog'
    'Bug Source': 'Github Issue'
    'Description': incomingPayload.issue.body
    'Notified Users?': true
.then (entry)->
  Promise.all [
    submitToAirtable.post(entry),
    lowestIssueCount.post()
  ]
.then (recordID, leastIssues) ->
  details.githubUserName = leastIssues.githubUserName
  dataToUpdate =
    record: recordID
    assignTo: leastIssues.id
  assignRecordTo.post dataToUpdate
.then (assignee)->
  data =
    githubIssue: details.githubIssue

  updateGithubIssue.post(data)
