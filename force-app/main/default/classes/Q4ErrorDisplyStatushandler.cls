/*
 //Q.1)Create a checkbox on contact object and Write a trigger to check that checkbox whenever a new contact is created.
//Q.3)Write a trigger to delete all the related contacts whenever associated account is delete
 ---------------------------------------------------------------------------------------------------------
Q.4)Write a trigger on contact to show an
error -->if status changes from new to closed and record should get 
saved -->if status changes from New to Open or Open to closed.
   (Note Take three status value (New,Open,Closed)).
*/


public class Q4ErrorDisplyStatushandler {   
     
//Q1------------------------------------------------------------------------------------------------------------------------------------------ 
  public static void checkConCreated(List<Contact> newlist)
   {
     try{
           for(Contact con: newlist)
                {                    
                    if(con!=Null)
                    {   
                         con.contact_created__c = true;
                    } 
                }
        }catch(Exception e) {
			System.debug('checkConCreated Exception: ' + e.getMessage());
        }
    }
    
 //Q3------------------------------------------------------------------------------------------------------------------------------------------ 
  public static void deleteAllConRealtedAcc(List<Contact> oldlist)
   {
     try{
         	Set<ID> contactIDSet = new Set<ID>();
              for(Contact contactToDelete: oldlist)
                  {
                    contactIDSet.add(contactToDelete.AccountId);
                   }

            List<Account> DelAccountRecordList = [select id from Account where Id IN:contactIDSet];
            
            if(DelAccountRecordList.size() >0)
                {
                 delete DelAccountRecordList ;
                    System.debug('Delete Account');
                }
		
        }catch(Exception e) {
			System.debug('deleteAllConRealtedAcc Exception: ' + e.getMessage());
        }
    }
       
//Q4------------------------------------------------------------------------------------------------------------------------------------------ 
    public static void checkStatusChange(List<Contact> newlist,Map<Id,Contact> oldMap)
   {
     try{
		for(Contact con : newlist)
          {
            if((oldMap.get(con.Id).status__c).equalsIgnoreCase('New'))
            {
                if((con.status__c).equalsIgnoreCase('Closed'))
                {
                   con.status__c.addError('status changes from new to closed ');
                 }
             }
           }
        }catch(Exception e) {
			System.debug('Q4ErrorDisplyStatus Exception: ' + e.getMessage());
        }
    }
}


/*--------------------------------------------------------------------------------------------------------------------------------------
OR Solution que 4
trigger Q4StatusContact on Contact (before update)
{
   for(Contact connew : trigger.new)
    {
     for(Contact conold : trigger.old)
      {
        if(connew.Id == conold.Id && conold.Status__c == 'New' && connew.Status__c == 'Closed')
           {
              connew.addError('You cant changed status from new to closed');
            }
           }
      }

 
  }
*/