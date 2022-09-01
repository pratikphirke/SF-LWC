/*  
8. Create the field called “Contact Relationship” checkbox on the Contact Object and Create 
    the related object called “Contact Relationship” which is related list to the Contacts.(Look Up Relationship).
    Now logic is when we create contact by checking Contact Relationship checkbox,
     then Contact Relationship will be created automatically for that contact.
*/
//--------------------------------------------------------------------------------------------------------------------------------------------

/*
9. Create field called “Count of Contacts” on Account Object.
     When we add the Contacts for that Account then count will populate in the field on 
    Account details page. When we delete the Contacts for that Account, then Count will update automatically.
*/
trigger Q8RelationWithContcat on Contact ( After insert,After delete) {
    if(Trigger.isAfter)
    {
       if(Trigger.isInsert || Trigger.isDelete)
            { 
             //Q8 
               AssignmentContactTriggerHandler.contactCreateWithRelation(trigger.New);  
           //Q9 
             AssignmentContactTriggerHandler.CountOfContacts(Trigger.New,trigger.old); 
            }
         }
    }