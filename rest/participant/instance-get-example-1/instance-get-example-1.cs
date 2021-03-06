// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var participant = twilio.GetConferenceParticipant("CFbbe4632a3c49700934481addd5ce1659", "CA386025c9bf5d6052a1d1ea42b4d16662");
    
    Console.WriteLine(participant.StartConferenceOnEnter);
  }
}