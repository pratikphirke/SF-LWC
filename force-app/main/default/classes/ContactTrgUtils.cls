public class ContactTrgUtils {
    public static void SetApprover(List<Contact> trgNew, boolean isUpdate, boolean isInsert, boolean isDelete, boolean isAfter)
    {
        if(!isAfter && isUpdate)
            {
                Set<Id> ownerIds=new Set<Id>();
                Map<ID,User> ownerMap=new Map<ID,User>();
                
            for(Contact cont:trgNew)
            {
                if(cont.In_Approval__c)
                    {
                      ownerIDs.add(cont.OwnerId);
                    }
            }
            for(User u:[select id,special_Approver__c from USer where Id in:OwnerIDs])
                {
                     OwnerMap.put(u.Id,u);
                }
            List<User>OwnersToUpdate=new List<User>();
            for(Contact cont:trgNew)
            {
                if(cont.In_Approval__c)
                    {
                    User owner=ownerMap.get(cont.ownerId);
                    owner.special_Approver__c=getApprover(cont).Id;
                    ownersToupdate.add(owner);
                    }
             }
                if(!OwnersToUpdate.isEmpty())
                {
                update ownersToUpdate;
                }
            
            
           	  }
            }
            private static USer getApprover(Contact cont)
                {
                User approver=[select id from user where username='alexapprover1@sess.com'];
                
                //business logic for selectig an approver
                if(cont.MailingState=='TX')
                    {
                    approver=[select id from user where username='alexapprover1@sess.com'];
                    }
        else
        {
       	 approver=[select id from user where username='alexapprover1@sess.com'];
        }
    return approver;
    }
}