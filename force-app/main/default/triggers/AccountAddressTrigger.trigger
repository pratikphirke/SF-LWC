trigger AccountAddressTrigger on Account (before insert,before update) {
    if(trigger.isBefore){
        if(trigger.isInsert || trigger.isUpdate){
            for(Account acc : Trigger.new){
                if((acc.Match_Billing_Address__c == true) && (acc.BillingPostalCode != null))
                {
                    acc.ShippingPostalCode = acc.BillingPostalCode;
                }
                
            }
        }
    }
}