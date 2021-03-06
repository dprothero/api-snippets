# NOTE: This example uses the next generation Twilio helper library - for more
# information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '{{ auth_token }}'
client = Twilio::REST::Client.new account_sid, auth_token

# Retrieve a valid notification service
service = client.notifications.v1.services('ISxxx')

# Create a detailed notification
notification = service.notifications.create(
  identity: 'Bob',
  title: 'Generic loooooooong title for all Bindings',
  body: 'This is the body for all Bindings',
  gcm: '{"notification":{"tag":"MyTag"}}',
  apn: '{"aps":{"title":"Short title for Watch."}}'
)

puts notification
