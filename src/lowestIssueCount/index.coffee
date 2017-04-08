getStdin = require 'get-stdin'
Airtable = require 'airtable'
base = new Airtable(
  apiKey: process.env.AIRTABLE_API_TOKEN
).base(process.env.AIRTABLE_BASE)

getStdin()
.then ->
  base('Team Members').select(
    maxRecords: 10
    view: 'Main View'
  ).eachPage page = (records, fetchNextPage) ->
    leastIssues = records[0]
    compare = (user) ->
      if user.get('In-progress Issues') < leastIssues.get('In-progress Issues')
        leastIssues = user
    compare user for user in records
    console.log JSON.stringify
      user: leastIssues
    fetchNextPage()
  , done = (err) -> if err then console.err err
.catch console.log.bind console
