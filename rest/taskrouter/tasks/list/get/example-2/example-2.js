// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = "{{ account_sid }}";
var authToken = "{{ auth_token }}";
var workspaceSid = "{{ workspace_sid }}";

var client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

client.workspace.tasks.get({"TaskQueueSid":"WQf855e98ad280d0a0a325628e24ca9627"}, function(err, data) {
    if(!err) {
        data.tasks.forEach(function(task) {
            console.log(task.attributes);
        })
    }
});

client.workspace.tasks.get({"AssignmentStatus":"pending"}, function(err, data) {
    if(!err) {
        data.tasks.forEach(function(task) {
            console.log(task.attributes);
        })
    }
});