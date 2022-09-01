trigger OpportunityTriggerAfter on Opportunity ( after insert,after update ,after delete ) {
        
    if(Trigger.isAfter){ // After Trigger.
           // Iterate through the records inserted passing them to the handler.
          
            if (Trigger.isInsert)
            {
                    OpportunityTriggerHandler.onAfterInsert(Trigger.New);
                /*
                   List<Opportunity> oppList = New List<Opportunity>();
                    Opportunity opp1 = new Opportunity();
                    opp1.Name = 'Test1';
                    opp1.StageName='Prospecting';
                    opp1.Closedate=System.today();
                    opp1.AccountId='0015g00000AFYpyAAH';
                   
                    
                    Opportunity opp2 = new Opportunity();
                    opp2.Name = 'Test1';
                    opp2.StageName='Qualification';
                    opp2.Closedate=System.today();
                    opp2.AccountId='0015g00000AFYpyAAH';
                   
                    
                    oppList.add(opp1);
                    oppList.add(opp2);
                    insert oppList;
                */
            }
            // Iterate through the records updated passing them to the handler.
            else if (Trigger.isUpdate)
            {
                OpportunityTriggerHandler.onAfterUpdate(Trigger.New,Trigger.oldMap);
                /* 
                List<Opportunity> oppList = New List<Opportunity>();
                    Opportunity opp1 = new Opportunity();
                    opp1.Name = 'Test1';
                    opp1.StageName='Needs Analysis';
                    opp1.Closedate = System.today();
                    opp1.Id= '0065g000001vCgyAAE';
                    opp1.AccountId='0015g00000AFYpyAAH';
                    opp1.Amount=2000;
                    
                    Opportunity opp2 = new Opportunity();
                    opp2.Name = 'Test2';
                    opp2.StageName='Qualification';
                    opp2.Closedate=System.today();
                    opp2.Id= '0065g000001vCgzAAE';
                    opp2.AccountId='0015g00000AFYpyAAH';
                    opp2.Amount=3000;
                    
                    oppList.add(opp1);
                    oppList.add(opp2);
                    System.debug('BEFORE UPDATE Records=> ' +oppList);
                    update oppList;
                    System.debug('After UPDATE Records=> ' +oppList);  
                */
                   
            }

            // Iterate through the records deleted passing them to the handler.
            else if (Trigger.isDelete)
            {
                OpportunityTriggerHandler.onAfterDelete(Trigger.old);
               /*
                Opportunity opp =[SELECT Id FROM Opportunity WHERE Id='0065g000001vCgtAAE' ];
                delete opp;
                */
            }
    }
    
}