public class CountContactsrelatedAccount_handler {
  public static void handleAfterInsert(List<Contact> newlist)
   { 
      try{
            List<Account> accList = new List<Account>();
          	Set<Id> aID = new Set<Id>(); 
			   
          for(Contact ConI:newlist) {
            	aID.add(ConI.AccountID);   
    		 }

         list<Account> acc = [select Id,Number_of_Contact__c from Account where ID IN :aID];
         list<Contact> con = [select ID from Contact where AccountID IN :aID];
         
         for(Account acn:acc)
         {
             acn.Number_of_Contact__c=con.Size();
         }
            Database.Update(acc);                      
          System.debug('update Number_of_Contact__c on ACC'+acc);
           } catch(Exception e){
                   System.debug('CreateAccNumberOfContact Exception'+e);
        }
}
    public static void handleAfterUpdate(List<Contact> conID, Map<ID,Contact> conmapIds)
    {
        
      try{
            //first parameter is Trigger.New  &   second parameter is  Trigger.OldMap
             Set<ID> aId = new SET<ID>(); //for New AccountIDs
             Set<ID> OldAId = new Set<ID>(); //for Old AccountIDs
             
             for(Contact opp : conID)
             {
             
                 if (opp.AccountId != conmapIds.get(opp.id).AccountId)
                {
                             aId.add(opp.AccountId);
                             
                             OldAId.add(conmapIds.get(opp.id).AccountId);
                }
            }
            
           if (!aId.isEmpty())
           {
                  //for new Accounts
                  List<Account> acc = [select id,Number_of_Contact__c from Account where Id in:aId];
                  
                  //For New Account Contacts
                  List<Contact> con = [select id from contact where AccountId in :aId];

                  /*  This is For Old Contacts Count */

                  //for Old Accounts
                  List<Account> Oldacc = [select id,Number_of_Contact__c from Account where Id in:OldAId];

                 //For Old Account Contacts
                  List<Contact> OldCon=[select id from contact where AccountId in :OldAId];

                //For New Accounts
                 for(Account a : acc)
                 {
                    a.Number_of_Contact__c=con.size();
                 }
              
                 Database.Update(acc);

                //For Old Accounts
                for(Account a : Oldacc)
               {
                 a.Number_of_Contact__c=OldCon.size();
               }
              Database.Update(Oldacc);
         }
      
           } catch(Exception e){
                   System.debug('CreateAccNumberOfContact Exception'+e);
        }       
    }  
}