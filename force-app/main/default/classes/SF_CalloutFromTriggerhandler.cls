public class SF_CalloutFromTriggerhandler {
//Get data from API    
 @future(callout=true)   
    public static void GetData()
           {
               try{
                    HttpRequest request = new HttpRequest();
                    String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals';
                    request.setEndPoint(endpoint);
                    request.setMethod('GET');
                    request.setCompressed(true); // otherwise we hit a limit of 32000
                    HttpResponse response = new HTTP().send(request);
                    if (response.getStatusCode() == 200)
                    {
                    
                        System.debug(LoggingLevel.Info,'Successfull'); 
                         Map<String,Object> results=(Map<String,Object>)JSON.deserializeUntyped(response.getBody());
                          
               			String  result = String.valueOf(results.get('animals'));
                         System.debug('result=>----'+result);
               			
                    }
               }catch(System.CalloutException e){
                System.debug('Error-' + e.getMessage());   
          	  }
           } 
 //-----------------------------------------------------------------------------------------------------------------------------------------------   
   //Get data TO API  
    @future(callout=true)   
    public static void  POSTData(string animal)
           {
               try{
                    	 Http http = new Http();
                        HttpRequest request = new HttpRequest();
                   
                      request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
                        request.setMethod('POST');
                   		request.setBody('name='+EncodingUtil.urlEncode(animal, 'UTF-8'));
                        HttpResponse response = http.send(request);

                if (response.getStatusCode() != 201) {
                    System.debug('The status code returned was not expected: ' +
            		response.getStatusCode() + ' ' + response.getStatus());
                } else {
                    System.debug(response.getBody());
                      
                }
               }catch(System.CalloutException e){
                System.debug('Error-' + e.getMessage());   
          	  }
           } 
}