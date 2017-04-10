# Github-Airtable integration using FaaS

The functions in this repository allow for the automatic update and assignment
of GitHub issues in a Bug and Issue Tracking template in Airtable.

#### Five included functions:
###### Logger
This function chains series of other function together using a lightweight
wrapper around the request-promise library, FaaS-Chain.

###### Submit To Airtable
Takes the request information from the github webhook and adds the item to the
Airtable sheet.

###### Lowest Issue Count
Grabs the team member with the lowest issue count

###### Assign Record To
Assigns the issue to a team member. In this instance, the team member with
the lowest issue count

###### Update Github Issue
Adds an assignee to the issue in GitHub

#### In action
![alt text](https://s3.amazonaws.com/aafrey-random/github-to-airtable.gif)
