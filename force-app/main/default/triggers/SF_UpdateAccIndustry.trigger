/*
Write a trigger to update the account industry field with value "Banking". 
Note: Develop a trigger which will not run when user is perfoming data import

Prework:
Create Custom Field boolean IsfromDataloader=false
while insert or update data make this filed IsfromDataloader=true--IsfromDataloader__c
Trigger check if Trigger.new has IsfromDataloader=true then update account_industry field="Banking".
*/

Trigger SF_UpdateAccIndustry on Account (Before Insert, After Insert) {
    if(Trigger.isBefore ){
    if(Trigger.isInsert){
            try{
                    for(Account acc : Trigger.New)
                    { 
                        if(acc.IsfromDataloader__c = true) 
                        {
                            acc.Industry = 'Banking';
                        }                  
                    }
               } catch(Exception e){
                   System.debug('updateAccIndustry Exception'+e);
                  
               }
        }
    } 
}