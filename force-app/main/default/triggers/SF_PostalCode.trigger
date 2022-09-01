Trigger SF_PostalCode on Account (After insert ,After update) {
    
if(Trigger.isAfter){
               
    if(Trigger.isInsert || Trigger.isUpdate){
         for(Account acc:trigger.new){
             System.debug('Account------'+acc);
            SF_PostalCodeCallout.GetData(acc.BillingPostalCode);
             }
      }
    }
}