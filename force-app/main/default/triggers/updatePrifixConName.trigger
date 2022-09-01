Trigger updatePrifixConName on Contact (Before insert, Before Update ) {
 if(Trigger.isBefore)
    {
      if(Trigger.isinsert||Trigger.isUpdate)
       {
        try{
            for(Contact connew : trigger.new){
                
                   if(connew.Gender__c=='Male')
                      {
                          connew.Salutation = 'Mr';
                              }else{
                                  connew.Salutation = 'Mrs';
                              }
                
             }
        }catch(Exception e) {
            System.debug('updatePrifixConName Exception: ' + e.getMessage());
        }
     }  
   }        
}