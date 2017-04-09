FaaS = require './faas-FaaS'
getStdin = require 'get-stdin'
baseUrl = 'https://techlancasterdemo.us/function/'

submitToAirtable = new FaaS baseUrl + 'stack_submit_to_airtable'
lowestIssueCount = new FaaS  baseurl + 'stack_lowest_issue_count'
assignRecordTo = new FaaS baseUrl + 'stack_assign_record_to'
updateGithubIssue = new FaaS baseUrl + 'stack_update_github_issue'

issueNumber = null

getStdin()
.then (entry) ->
  entry = JSON.parse entry
  issueNumber = entry.issue.number.toString()
  Promise.all [
    submitToAirtable.post entry ,
    lowestIssueCount.post()
  ]
.then (data) -> assignRecordTo.post
  record: data[0].record
  assignTo: data[1].user.id
  githubUser: data[1].user._rawJson.fields["GitHub User"]
.then (userinfo) -> updateGithubIssue.post
  number: issueNumber
  githubUser: [userinfo.githubUser]
.then console.log
.catch console.log.bind console
# TODO implement assignement in github
