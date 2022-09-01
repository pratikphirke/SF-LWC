Trigger UpdateRelOppDesc on Account (After Update) {
//when account is updated, opportunity associated to it should be updated in there description field is same +add account name
   if(Trigger.isAfter){        
     if(Trigger.isUpdate){
               try{     
                   Set<ID> OppAcc = New Set<id>();
                   List<Opportunity> updateOppList = new List<Opportunity>();
                    for(Account acc : Trigger.new){
                        if(acc.Name!=NULL){
                              OppAcc.add(acc.Id);
                        }
                    }
                 List<Opportunity> mapOppty = new  List<Opportunity>([SELECT Id, Description,AccountId,Account.Name
                                                                       FROM Opportunity WHERE AccountId IN :OppAcc]);
                   for(Opportunity record: mapOppty)  {
                            Account accountRecord = Trigger.newMap.get(record.AccountId);
                            record.Description= 'Update-'+accountRecord.Name;
                                    updateOppList.add(record); 
                     }                  
                 if(updateOppList.size()>0){
                      update updateOppList;  
                   }          
               } catch(Exception e){
                   System.debug('UpdateRelOppDesc Exception'+e.getMessage());
               }
           } 
     }
}