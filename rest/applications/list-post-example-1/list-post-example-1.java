// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.ApplicationFactory;
import com.twilio.sdk.resource.instance.Application;
import com.twilio.sdk.resource.list.ApplicationList;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the ApplicationList
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("FriendlyName", "Phone Me"));
    params.add(new BasicNameValuePair("VoiceUrl", "http://demo.twilio.com/docs/voice.xml"));
    params.add(new BasicNameValuePair("VoiceMethod", "GET"));
    
    
    ApplicationFactory appFactory = client.getAccount().getApplicationFactory();
    Application app = appFactory.create(params);
    System.out.println(app.getSid());
  }
}