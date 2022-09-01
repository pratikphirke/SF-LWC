/*
1.	Create ‘Account’ object record based on email sent to the Salesforce.
         Email will contain the account details. [Hint: Use Email Services]
          	Email sample-
         	Name: Acme Industries
        	Type: Prospect
       		Phone: (212) 555-5555
      		Employees: 680	
        	 etc…

**STEP**
1-->setup-->email service name --assign class-->CreateAccountViaEmail
	accept email from --pratik.phirke@vyomlabs.com
2-->add email address-->service name --Create Account
	salesforce id--create_account@1nbw8ihtjjxe1cdq4jtac0s4qxf35zfnoi9l7o7fgqx6pyixen.5g-4pll7eag.ap24.apex.salesforce.com
*/

global class CreateAccountViaEmail  implements Messaging.InboundEmailHandler
{

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope env)
    {
   
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
          System.debug('====>    Messaging.InboundEmailResult '+result);
       try {
            Account acc = new Account();
				acc.Name = email.Subject;
            	acc.AnnualRevenue = 250000.00;
            	acc.Description = email.plainTextBody;
            	acc.Industry ='Agriculture';
           		acc.Website='www.google.com';
                acc.Fax = '02550';
           		acc.Phone ='(098) 765-4321';
           		acc.Type ='Other';
             
            System.debug('====> Created Account '+acc);
            insert acc;
      
            
             //System.debug(' List Account ====> '+posList);
        } catch (Exception e) {
            System.debug('Error is: ' + e);
        }  
         
        result.success = true;
        result.message ='Create Account Sucessfully';
        
        return result;
    }
}
/*
 //case2:f that end user reply back to that email it should not create new record.
                  String searchString ='%' + email.Subject + '%';	  
  			List<Account> acclist = [SELECT Id,Name FROM Account WHERE Name LIKE :searchString];
                      if(acclist.size()>0 && !acclist.isEmpty())
			{
                             System.debug('Not Created Account=>  '+ acclist );
               		 }else{
                     
                        if(email.inReplyTo==Null)
			{
                         	 insert acc;
                            	System.debug('====> Created Account'+acc);
                         }else{
                           	 System.debug('Not Created Account=>  ');                        
                          }

*/