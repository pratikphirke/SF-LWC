//Q.3)Write a trigger to delete all the related contacts whenever associated account is delete
trigger Q3DeleteAllRelContact on Contact(After delete)
{
    if(Trigger.isAfter)
    {
       if(Trigger.isDelete)
        {
            Set<ID> contactIDSet = new Set<ID>();
              for(Contact contactToDelete: Trigger.old)
                  {
                    contactIDSet.add(contactToDelete.AccountId);
                   }

            List<Account> DelAccountRecordList = [select id from Account where Id IN:contactIDSet];
            
            if(DelAccountRecordList.size() >0)
                {
                 delete DelAccountRecordList ;
                    System.debug('Delete Account');
                }
        }
    }
    

}