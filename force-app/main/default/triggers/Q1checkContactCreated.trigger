//Q.1)Create a checkbox on contact object and Write a trigger to check that checkbox whenever a new contact is created.
//Active trigger 
trigger Q1checkContactCreated on Contact (before insert,before update) {
    
    if(Trigger.isBefore)
    {
        if(Trigger.isInsert ||Trigger.isUpdate)
        {   
              for(Contact con: trigger.New)
                {                    
                    if(con!=Null)
                    {   
                         con.contact_created__c = true;
                    } 
                }
         }  
    }
}