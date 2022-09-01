public class AssignmentTestUserHandler 
    {//GET data From API

      @future(callout=true)
      public static void GetData()
      {
          try{
            HttpRequest request = new HttpRequest();
            String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals';
          //'https://jsonplaceholder.typicode.com/posts/1';
            request.setEndPoint(endpoint);
            request.setMethod('GET');
            
                HttpResponse response = new HTTP().send(request);
                if (response.getStatusCode() == 200)
                {
                    System.debug(LoggingLevel.Info,'Successfull');
                    System.debug('GET DATA => '+response.getBody());
                    /*
                        {
                          "userId": 1,
                          "id": 1,
                          "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                          "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
                        }
                    */
                }
          } catch (Exception e) {
               System.debug('Exception occured '+e);
            }
        }
 //--------------------------------------------------------------------------------------------------------------------------------------------------------------
       //POst Data 
        
         //Future annotation to mark the method as async.
      @Future(callout=true)
      public static void PostData(String name) 
      {
          try{
                      	Http http = new Http();
                        HttpRequest request = new HttpRequest();
              
                        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
                        request.setMethod('POST');
                        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
                        request.setBody('{"name":"TestData" }');
                       // request.setBody('name='+EncodingUtil.urlEncode(name, 'UTF-8'));
                        HttpResponse response = http.send(request);
                        // Parse the JSON response
                        if (response.getStatusCode() != 201) {
                            System.debug('The status code returned was not expected: ' +
                                response.getStatusCode() + ' ' + response.getStatus());
                        } else {
                            System.debug('POST DATA=>  '+response.getBody());
                        }
                     
                        //check the response
                        if (response.getStatusCode() == 200) {
                    
                        System.debug(LoggingLevel.Info,'Successfull');
                        System.debug(LoggingLevel.Info,response.getBody());
                        
                        } else {
                          System.debug('Callout failed: ' + response);
                        } 
                          
                	  } catch (Exception e) {
                       System.debug('Exception occured '+e);
                    }
              }
   //--------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    }