/*
Write code for following: After an Account record is created, create a Contact record linked to that Account record.
 [Restriction: Cannot use apex trigger for this]

Using Process Builder :
immediate actions
Select Apex class in action type.
assign parameters to the method---accIds--FieldRefrence=Account.Id
*/

public class SF_AccRelatedConRecord {
 @InvocableMethod()
     public static void createRelatedContact(List<Id> accIds)
     {
         try{
                List<Contact> conListToInsert  = new List <Contact>();
                List<Account> Acclist =[SELECT Id,Name FROM Account WHERE Id=:accIds];
                    for(Account acc : Acclist)
                    {
                       Contact c = new Contact();
                        c.LastName =  'Invocable'+acc.name;
                        c.AccountId=acc.id;
                        conListToInsert .add(c);
                    }
                     if(!conListToInsert.isEmpty()){
                         insert conListToInsert ; 
                    }

          } catch (Exception e) {
              System.debug('Exception'+e.getMessage());
			}
		}
}