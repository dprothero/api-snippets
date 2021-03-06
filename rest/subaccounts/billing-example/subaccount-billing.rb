# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Account Sid and Auth token for your new subaccount
sub_account_sid = '{{ subaccount_sid }}'
sub_auth_token = '{{ subaccount_auth_token }}'
@sub_account_client = Twilio::REST::Client.new sub_account_sid, sub_auth_token
@subaccount = @sub_account_client.account

# Place to store the billable usage
time_to_bill = 0

# 30 days ago
start_time = Time.now - ( 30 * 24 * 60 * 60 ) 

# Get all calls for the last 30 days
@subaccount.calls.list({:page => 0, :page_size => 1000, :start_time => ">#{start_time.strftime('%Y-%m-%d')}"}).each do |call|
  # Get time of call in minutes
  time_to_bill += (call.duration.to_f/60).ceil
end

puts "User {{@user.username}} used #{time_to_bill} minutes."