Airtable = require('airtable')
base = new Airtable(apiKey: 'keya5owBYIn0zRzxP').base('app2PLtM6KVLhzhrJ')
payload = require './payload.json'

base('Bugs & Issues').create
  'Issue': payload.issue.id.toString()
  'Title': payload.issue.title
  'Labels': payload.issue.labels[0].name
  'Repo': payload.repository.full_name
  'Priority': 'High'
  'Status': 'Backlog'
  'Associated Features': [ 'recOi30bSWUzmCzJP' ]
  'Bug Source': 'Github Issue'
  'Description': payload.issue.body
  'Notified Users?': true
, (err, record) ->
  if err then console.log err
  console.log record.getId()
