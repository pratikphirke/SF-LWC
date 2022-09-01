Public class SF_PostalCodeCallout {
    @future(callout=true)
         Public static void GetData(string pincode){
         String url='https://api.postalpincode.in/pincode/'+pincode;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            System.debug('Result :'+response.getBody());
             JSONParser parser = JSON.createParser(response.getBody());
        while (parser.nextToken() != null) {	
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                parser.nextValue();
                    if (parser.getCurrentName() == 'Name') {
                     String   Name = parser.getText();
                         System.debug('List Of City => '+ Name);
                    } 
                }
      		  }
      	  }
       } 
}