/*4.    Write code for following:
     After an Account record is created, create a Contact record linked to that Account record. 
    [Restriction: Cannot use apex trigger for this]

*/
public class createContactOnAccount {
    public static void createContactRelatedAccount()
    {
        //Method1---
           try {
               Account acc = new Account(Name='Test Record1',Phone='141516');
                    insert acc;
                    system.debug('INSERT Account=> '+ acc.Name);
                Contact con = new Contact(FirstName='Pratik',LastName='Firke',AccountId= acc.Id);
                    insert con;
                    system.debug('INSERT Contact Realted Account=> '+ con.FirstName +'Account Name'+con.AccountId);
            
            } catch (DmlException e) {
               System.debug('Exception occured '+e);
            }
        
        
        //Method2---
       /* try {
         List<Account> acclist = new List<Account>(); 
             Account acc1 = new Account(Name='Test1',Phone='67890');
             Account acc2 = new Account(Name='Test2',Phone='111213');
                acclist.add(acc1);
                acclist.add(acc2);
                 insert acclist;
        
             List<Contact> conlist = new List<Contact>();
          Contact con1 = new Contact(FirstName='ram',LastName='patil',AccountId= acc1.Id);
          Contact con2 = new Contact(FirstName='sham',LastName='more',AccountId= acc2.Id);
                conlist.add(con1);
                conlist.add(con2);
                    insert conlist;
         } catch (DmlException e) {
               System.debug('Exception occured '+e);
            }*/
     
        
    }

    
}