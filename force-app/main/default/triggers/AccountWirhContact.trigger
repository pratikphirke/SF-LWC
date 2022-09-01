trigger AccountWirhContact on Account (After insert,After update,before delete) {

    if(Trigger.isAfter){
        
        if(Trigger.isInsert){
            //create related contact when acc is created
        try{
             List<Contact> conList = new List<Contact>(); 
                    for(Account acc : Trigger.New)
                    {
    
                        System.debug('Account new =>'+ acc); 
                        Contact c = new Contact();
                        c.AccountId = acc.id;
                        c.firstName ='abc';
                        c.lastName ='xyz';//acc.name;
                        c.Phone = acc.Phone;
                        conList.add(c);
                    }
                        Insert conList;
                        System.debug('Insert sucessfully contact =>'+ conList); 
             
    
               } catch(Exception e){
                     System.debug('Account and contact not created'  +e);
                    //addError('Account and contact not created');
                   
               } 
        }
    }//else
    
    
    
    
 /*  
  * 
  * else if(Trigger.isUpdate){
            // update field city in opportunity when BillingCity  update in account
              try{
                    set<Id> AccIds = new Set<Id>(); 
                    for(Account acc : Trigger.New)
                    {
                        System.debug('Account new =>'+ acc); 
                        
                        if(acc.BillingCity  != trigger.oldMap.get(acc.Id).BillingCity )
                            {//new Acc.BillingCity  not equal previous acc.BillingCity 
                                AccIds.add(acc.Id);
                            }
                      }
                    List<Opportunity> oppList =[SELECT AccountId,city__c,Id FROM Opportunity 
                                                WHERE AccountId IN: AccIds];
                         for(Opportunity opp : oppList)
                            {
                                System.debug('Opportunity Record =>'+ opp); //Opportunity:{AccountId=0015g00000AFWpJAAX, Id=0065g000001vBJjAAM}
                                opp.city__c = trigger.newMap.get(opp.AccountId).BillingCity;    
                                 System.debug('Opportunity  city =>'+ opp.city__c); //Opportunity  city =>Mumbai
                         
                            }
                 Update oppList;
                
               } catch(Exception e){
                     System.debug('Account and contact not created'  +e);
                    //addError('Account and contact not created');
    
            }
        }
  * 
  * 
  * 
  * 
  * if(Trigger.isBefore){
         if(Trigger.isDelete){ //before delete -->
             //show error if Active account is delete
             //show error if Account Have 2/More Contacts 
             Set<Id> accId = new Set<Id>();
             Map<Id,Account> accMap = new Map<Id,Account>();
              For(Account acc : trigger.New)
                {
                    accId.add(acc.Id);
                }
                System.debug('Unique Account ID=> '+accId);
              for(Account accQueryResult :[SELECT Id,Name,(SELECT id, firstName,lastName FROM Contacts)
                                             FROM Account WHERE Id IN : accId ])
                {
                     accMap.put(accQueryResult.Id,accQueryResult);            
                }
            System.debug('Id AND ACCOUNT QUERY RESULT=> '+accMap);
            for(Account acc: Trigger.old){
                
                    if(acc !=null && acc.Active__c == 'Yes')
                    {
                        acc.addError('Can NOT Delete Active Account  ' +acc.Name);
                        
                    }else if(accMap.get(acc.Id).Contacts.size()>=2)
                        {
                             acc.addError('Can Not Delete Record Has 2 or More Contacts  '+acc.Name);
                        }
            }
        }
    }*/
}