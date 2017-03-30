Airtable = require('airtable')
base = new Airtable(apiKey: 'keya5owBYIn0zRzxP').base('app2PLtM6KVLhzhrJ')

base('Team Members').select(
  view: 'Main View').eachPage page = (records, fetchNextPage) ->
    #TODO who has lowest ticket count
    records.forEach (record) ->
      user =
        name: record.get 'Name'
        adminID: record.get 'Admin ID'
        tickets: record.get '# In-progress Issues'
      #TODO determine is current user has lest project then above
      console.log 'Retrieved', user
    fetchNextPage()
  done  = (err) ->
    if err then console.log err
