# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = '{{ account_sid }}'
auth_token = '{{ auth_token }}'
workspace_sid = '{{ workspace_sid }}'
worker_sid = '{{ worker_sid }}'
reservation_sid = '{{ reservation_sid }}'

client = Twilio::REST::TaskRouterClient.new account_sid, auth_token, workspace_sid

reservation = client.workspace.workers.get(worker_sid).reservations.get(reservation_sid)
reservation.update(reservationStatus: 'rejected')
puts reservation.reservation_status
puts reservation.worker_name