getStdin = require 'get-stdin'
Airtable = require 'airtable'
base = new Airtable(
  apiKey: process.env.AIRTABLE_API_TOKEN
).base(process.env.AIRTABLE_BASE)

getStdin()
.then (updateData) ->
  updateData = JSON.parse updateData
  base('Bugs & Issues').update(
    updateData.record,
    { 'Assigned to': [updateData.assignTo] },
    (err, record) ->
      if err
        console.error err
        return
      console.log JSON.stringify
        assignedTo: record.get 'Assigned to'
        githubUser: updateData.githubUser
  )
