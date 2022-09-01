Trigger SF_ContactStatusChange on Contact (Before Update)
   {    
    if(Trigger.isBefore)
    {
      if(Trigger.isUpdate)
       {
        try{
            for(Contact connew : trigger.new){
                for(Contact conold : trigger.old){
                   if(connew.Id == conold.Id && conold.Status__c == 'New' && connew.Status__c == 'Closed')
                      {
                          connew.addError('You cant changed status from new to closed');
                     }
                }
             }
        }catch(Exception e) {
            System.debug('Q4ErrorDisplyStatus Exception: ' + e.getMessage());
        }
     }  
   }        
 }