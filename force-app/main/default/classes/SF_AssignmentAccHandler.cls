public class SF_AssignmentAccHandler {
 public static void preventDuplicateAcc(List<Account> newlist)
           { //Q2. Write a Triger to Prevent the users to create Duplicate Accounts
               try{
                    for(Account acc : newlist)
                    { 
                        System.debug('Account new ==>  '+acc);
                        List<Account> accList =[Select id from Account where Name=:acc.Name];
                        if(accList.size()>0)
                          {
                             acc.Name.addError(' Cannot Create the Duplicate Account');
                          }else{
                              System.debug('Duplicate Record Created');
                          }                       
                    }
    
               } catch(Exception e){
                   System.debug('Duplicate Account Created Exception'+e);
                  
               }
           } 
    //-------------------------------------------------------------------------------------------------------------------------------------------------
    public static void updateAccIndustry(List<Account> newlist)
           { //Write a trigger to update the account industry field with value "Banking".
               //While Insert data using external tool use IsfromDataloader=true
               try{
                    for(Account acc : newlist)
                    { 
                        System.debug('Account new ==>  '+acc); 
                        if(acc.IsfromDataloader__c = true) 
                        {
                            acc.Industry = 'Banking';
                        }                  
                    }
    
               } catch(Exception e){
                   System.debug('updateAccIndustry Exception'+e);
                  
               }
           } 
   
//-------------------------------------------------------------------------------------------------------------------------------------------------   
    public static void CreateAccNumberOfContact(List<Account> newlist)
           { //Q5. creates the number of contacts which are equal to the number which 
          		 // we will enter in the Number of Contacts field on the Account
               try{
                    	list<contact> listContact = new list<contact>();
                        map<id,decimal> mapAcc=new map<id,decimal>();
                    
                        for(Account acc: newlist){
                            mapAcc.put(acc.id,acc.Number_of_Contact__c);//(accId,Numberofcontact)--new account 
                        }
                   
                        if(mapAcc.size()>0 && mapAcc!=null){
                            for(Id accId:mapAcc.keyset()){//unique key set for each Account ID
                                
                                for(integer i=0;i<mapAcc.get(accId);i++){ //loop executed in 2 times to make 2 contact
                                    
                                    contact newContact 	 = 	new contact();
                                    newContact.accountid =	accId;  //link AccID 
                                    newContact.lastname =   'contact ' +i; //To Make it unique +i
                                    
                                    listContact.add(newContact);
                                }
                            }
                        }
                    
                   if(listContact.size()>0 && listContact!=null){
                         insert listContact;                        
         			 System.debug('List Contact ==> '+ listContact);
                   }
                        
                        
                    
                   if(listContact.size()>0 && listContact!=null){
                         insert listContact;                        
         			 System.debug('List Contact ==> '+ listContact);
                   }
                          
                  
               } catch(Exception e){
                   System.debug('CreateAccNumberOfContact Exception'+e);
                  
               }
           } 
    //-------------------------------------------------------------------------------------------------------------------------------------------------

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
                          //Description = response.getBody();
                         Map<String,Object> results=(Map<String,Object>)JSON.deserializeUntyped(response.getBody());
                          
               			String  result = String.valueOf(results.get('animals'));
                         System.debug('result=>----'+result);
               			
                    }
               }catch(System.CalloutException e){
                System.debug('Error-' + e.getMessage());   
          	  }
           } 
    @future(callout=true)   
    public static void  POSTData(string animal)
           {
               try{
                    	 Http http = new Http();
                        HttpRequest request = new HttpRequest();
                   
                      request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
                        request.setMethod('POST');
                       // request.setHeader('Content-Type', 'application/json;charset=UTF-8');
                        // Set the body as a JSON object
                       // request.setBody('{"name":"Dog"}');
                   		request.setBody('name='+EncodingUtil.urlEncode(animal, 'UTF-8'));
                        HttpResponse response = http.send(request);

        // Parse the JSON response
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
    //-------------------------------------------------------------------------------------------------------------------------------------------------   
    public static void updateContactAddress(List<Account> newlist, Map<Id,Account> oldMap,Map<Id,Account> newMap)
           { /// when account address is changed contact address should be changed.
               try{
                   
                       Set<Id> accountIds = new Set<Id>();
                        for (Account a : newlist) {
                            Account old = oldMap.get(a.Id);
                            if (a.BillingStreet != old.BillingStreet) {
                                accountIds.add(a.Id);
                            }
                        }
                    if (accountIds.size() > 0) {
                             List<Contact> conList = [SELECT Id, AccountId, mailingstreet FROM Contact WHERE AccountId IN :accountIds];
              
                            for (Contact c : conList) {
                               Account a = newMap.get(c.AccountId);       
           		                  c.mailingstreet = a.billingstreet;
								conList.add(c);
                            }
                            update conList;
                    }
                  
               } catch(Exception e){
                   System.debug('updateContactAddress Exception'+e);
                  
               }
           } 
}