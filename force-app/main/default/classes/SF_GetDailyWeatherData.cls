global  class SF_GetDailyWeatherData implements schedulable {
 //-------------------Schedulable  Execute()-------------------------------------- 
 global void execute(SchedulableContext sc) {
  GetWeatherData();
 }
//--------------------Get Weather Data--------------------------------------    
  @future(callout=true)
  public static void GetWeatherData() {
      	String cityName,CloudDesc ;
		Decimal temperature,pressure,humidity;
      
        HttpRequest req = new HttpRequest();
     	 String url='https://api.openweathermap.org/data/2.5/weather?q=pune&APPID=cf93adffe7ee4f3a0bd6eba300464f59';
      	req.setEndpoint(url);
        req.setMethod('GET');
      
        Http http = new Http();
        HTTPResponse res = http.send(req);
      
        JSONParser parser = JSON.createParser(res.getBody());
        while (parser.nextToken() != null) {
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                parser.nextValue();
                if (parser.getCurrentName() == 'name') {
                   cityName = parser.getText();
                     System.debug('City Name => '+ cityName);
                    
                } else if (parser.getCurrentName() == 'temp') {
                      temperature = Decimal.valueOf(parser.getText());
                    System.debug('City Temperature =>'+ temperature);
                    
                } else if (parser.getCurrentName() == 'description') {
                  CloudDesc = parser.getText();
                    System.debug('Cloud Description => '+ CloudDesc);
                    
                } else if (parser.getCurrentName() == 'pressure') {
                     pressure = Decimal.valueOf(parser.getText());
                    System.debug('Wind Pressure => '+pressure);
                    
                } else if (parser.getCurrentName() == 'humidity') {
                    humidity = Decimal.valueOf(parser.getText());
                     System.debug('Humidity => '+ humidity); 
                }
                
            }
        }
      send_emailAlert(cityName,temperature,CloudDesc,pressure,humidity);	
    }
//--------------------Email Alert--------------------------------------
public static void send_emailAlert(String City,Decimal temp,String Cloud,Decimal pressure,Decimal humidity){
    
   List<Messaging.SingleEmailMessage> mails =   new List<Messaging.SingleEmailMessage>();  
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      List<String> sendTo = new List<String>();
      sendTo.add('pratik.phirke@vyomlabs.com');//Userinfo.getUserEmail()
      mail.setToAddresses(sendTo);
         
      mail.setreplyto(Userinfo.getUserEmail());
      mail.setSenderDisplayName('Daily Weather Data');
         
      mail.setSubject('Daily Weather Data of '+City+' City'); 
     
      String body = 'Hi User '+  ', '+'<br/>'; 
  	  body += 'Today (' +Datetime.now()  +') Weather Data of '+ City +'  City'+'<br/>';
   	  body += '--------------------------------' +'<br/>';
      body += 'Clouds = '+ Cloud +' <br/>';
      body += 'Temperature = '+ temp +'<br/>';
      body += 'Pressure = '+ pressure +'<br/>';
      body += 'Humidity = '+ humidity +'<br/>';
      body += '--------------------------------' +'<br/>';
      body += ' Regards '+'<br/>'; 
      body += ' Salesforce Team '+'<br/>'; 
      mail.setHtmlBody(body);
   
      mails.add(mail);

       Messaging.sendEmail(mails);
  }
  
}