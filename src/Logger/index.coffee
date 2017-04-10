FaaS = require './faas-chain'
getStdin = require 'get-stdin'
baseUrl = "http://gateway:8080/function/"

submitToAirtable = new FaaS baseUrl + 'stack_submit_to_airtable'
lowestIssueCount = new FaaS  baseUrl + 'stack_lowest_issue_count'
assignRecordTo = new FaaS baseUrl + 'stack_assign_record_to'
updateGithubIssue = new FaaS baseUrl + 'stack_update_github_issue'

issueNumber = null
airtableRecord = null

getStdin()
.then (entry) ->
  entry = JSON.parse entry
  issueNumber = entry.issue.number.toString()
  if entry.action is "opened" then submitToAirtable.post entry
  else Promise.reject(new Error('already assigned'))
.then (record) ->
  airtableRecord = record.record
  lowestIssueCount.post()
.then (lowestIssuesHolder) -> assignRecordTo.post
  record: airtableRecord
  assignTo: lowestIssuesHolder.user.id
  githubUser: lowestIssuesHolder.user._rawJson.fields["GitHub User"]
.then (userinfo) -> updateGithubIssue.post
  number: issueNumber
  githubUser: [userinfo.githubUser]
.then console.log
.catch console.log.bind console
