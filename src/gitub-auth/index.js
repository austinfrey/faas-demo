var GitHub = require('github');
var github = new GitHub({
  debug: true,
  protocol: 'https',
  host: 'api.github.com',
  headers: {
    "user-agent": "aafrey"
  },
  Promise: require('bluebird'),
  followRedirects: false,
  timeout: 5000
});

github.authenticate({
  type: "oauth",
  token: '0759be96d17c163f9a1c6a690fa24b556944e732'
});

github.issues.addAssigneesToIssue({
  owner: 'aafrey',
  repo: 'faas-demo',
  number: 19,
  assignees: ['aafrey']
});
