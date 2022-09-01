public class AnimalLocator {
 public static String getAnimalNameById(Integer id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        System.debug('>>>>>>>'+id);
        HttpResponse response = http.send(request);
      Object animals;
        String returnValue;
       
        // If the request is successful, parse the JSON response
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug('>>>>>'+response.getBody());
            animals = result.get('animal');
            System.debug(animals);
        }
        if (animals != NULL  ) {
            Map<String, Object> result1 = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(animals));
            returnValue =(String) result1.get('name');
        }
        return returnValue;
    }
    //--------------------------------POST------------------------------
 public static void sendAnimalName(String name){

        Http http = new Http();
        HttpRequest request = new HttpRequest();
   
      request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
      //  request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Set the body as a JSON object
        //request.setBody('{"name":"Dog"}');
		request.setBody('name='+EncodingUtil.urlEncode(name, 'UTF-8'));
        HttpResponse response = http.send(request);

        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
    response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
              
        }
    }
}