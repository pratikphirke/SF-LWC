global class createMemberInbound implements Messaging.InboundEmailHandler
{
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope env)
    {
   
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
         
        String myPlainText= '';    
           
        myPlainText = email.plainTextBody; 
       
        List<PositionA1__c> posList = new List<PositionA1__c>();
           
        try {
            PositionA1__c pos = new PositionA1__c();
				pos.Name = email.Subject;
            	pos.Job_Description__c = myPlainText;
            	pos.Open_Date__c = Date.today();
            	pos.Status__c ='New Position';
           		pos.Type__c='Full Time';
                pos.Max_Pay__c =500000;
            	pos.Min_Pay__c= 10000;
                pos.Location__c ='Mumbai,India';
                posList.add(pos);
            System.debug('====> Created PositionA1__c '+pos.Id);
            
            insert posList;   
            
             System.debug(' List PositionA1__c ====> '+posList);
        }
           
        catch (Exception e) {
            System.debug('Error is: ' + e);
        }  
         
        result.success = true;
        
        return result;
    }
}