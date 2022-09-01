/* Write a trigger to replicate the rollup summary field on lookup relation objects 
to count sum of amount  on account object From the opportunity amount field

Opportunity-->Account lookup /Ammount
Account-->Currency field--->SumOfOppAmount__c
*/
Trigger SF_RollupSummaryAcc on Opportunity(After insert, After update, After delete, After Undelete) {
    
    if(Trigger.isAfter){
            try{
                  Set <Id> accIds = new Set<Id>();
                 if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete){
                           for (Opportunity opp: trigger.New) {
                                if (opp.AccountId != null) {
                                    accIds.add(opp.AccountId);  
                                  }
                             }
                 }
                    if (trigger.isDelete ) {
                        for (Opportunity oppt: trigger.old) {
                            if (oppt.AccountId != null) {
                                accIds.add(oppt.AccountId); //add unique acc from current opp delete
                            }
                     }
                 }
               List<Account> accOfRelatedOpp = [SELECT id, SumOfOppAmount__c,(SELECT id, Amount, AccountId FROM Opportunities) FROM Account WHERE Id IN : accIds];

                    for(Account acc : accOfRelatedOpp){
                    Double oppAmount = 0;       
                        for(Opportunity op : acc.Opportunities){
                             System.debug('ops =>'+op);
                            if(op.Amount != null){
                                
                              oppAmount = oppAmount+ op.Amount;
                            }
                        } 
                    acc.SumOfOppAmount__c  = oppAmount;
                     }
                         if(accOfRelatedOpp.Size()>0){
                            update accOfRelatedOpp;
                             System.debug('Updated Accounts =>'+accOfRelatedOpp);
                          }   
               } catch(Exception e){
                   System.debug('updateAccIndustry Exception'+e);
                  
               }
         }
}