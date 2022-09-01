/*
 Create a record for custom object via incoming email. End user will send email to salesforce, salesforce
should understand incoming new email and should create new record. Once record gets created send
email to end user to inform him your record has created. If that end user reply back to that email it
should not create new record.

*/
global class CreatePositionViaEmail implements Messaging.InboundEmailHandler
{

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope env)
    {
   	     Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();

        try { 	
            				PositionA1__c pos = new PositionA1__c();
   	                        pos.Name = email.Subject; 
                            pos.Job_Description__c = email.plainTextBody;// myPlainText;
                            pos.Open_Date__c = Date.today();
                            pos.Travel_Required__c = true;
                            pos.Status__c ='New Position';
                            pos.Type__c='Full Time';
                            pos.Max_Pay__c =500000;
                            pos.Min_Pay__c= 10000;
                            pos.Functional_Area__c='Information Technology';
                            pos.Job_Level__c='IT-100';
                            pos.Location__c ='Mumbai, India';
                            pos.Responsibilities__c='Dedicated, CleanCode Structure';
                            pos.Skills_Required__c='logical skills,'+' good Conversation skills ';
                            pos.Educational_Requirement__c=' ME / '+' MTech / '+' Mcs /'+' Mca ';
                            pos.JavaScript__c = true;
                            pos.Apex__c = true;
      
                  String searchString ='%' + email.Subject + '%';// LIKE 're:%'---xobj
                 // String searchString2 = 'Re%' + email.Subject; //+ '%';
                   //  List<PositionA1__c> poslist2 = [SELECT Id,Name FROM PositionA1__c WHERE Name LIKE :searchString2];
    	
                      	  
  				List<PositionA1__c> poslist = [SELECT Id,Name FROM PositionA1__c WHERE Name LIKE :searchString];
                      if(poslist.size()>0 && !poslist.isEmpty()){
                             System.debug('Not Created Position=>  '+ poslist);
                }else{
                     
                        if(email.inReplyTo==Null){
                          insert pos;
                            System.debug('====> Created PositionA1__c '+pos);
                         }else{
                            System.debug('Not Created Position=>  ');                        
                          }
  
                    //System.debug('Messaging.InboundEmail email====>     '+email);
                    //System.debug('Messaging.InboundEnvelope env====>     '+env);
     		  }
        } catch (Exception e) {
            System.debug('Exception is: ' + e);
        }  
        
       result.success = true;
        result.message ='Create Position Sucessfully';
        
        
       return result;
    }
}