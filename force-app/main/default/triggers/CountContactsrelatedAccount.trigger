Trigger CountContactsrelatedAccount on Contact (after insert, after update, after delete, after undelete){
 if(Trigger.isAfter)
    {
        if(Trigger.isInsert||Trigger.isUndelete)
        {
             CountContactsrelatedAccount_handler.handleAfterInsert(Trigger.New); 
            
        }else if(Trigger.isUpdate ||Trigger.isDelete)
        {
            CountContactsrelatedAccount_handler.handleAfterUpdate(Trigger.New,Trigger.OldMap);
        }
    }
}