getStdin = require 'get-stdin'
Airtable = require 'airtable'
base = new Airtable(apiKey: 'keya5owBYIn0zRzxP').base('app2PLtM6KVLhzhrJ')
#dataToUpdate =
#  record: 'recgSmBm2lBD8winm'
#  assignTo: ['recrtU2ZkfpflMPR8']
getStdin()
.then (dataToUpdate) ->
  base('Bugs & Issues').update(
    dataToUpdate.record,
    { 'Assigned to': dataToUpdate.assignTo },
    (err, record) ->
      if err
        console.error err
        return
      console.log record.get 'Assigned to'
  )
