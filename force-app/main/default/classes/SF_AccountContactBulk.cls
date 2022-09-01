//Create Account, Contact, user  in Bulk
public class SF_AccountContactBulk {
 public static void createBulkRecords(){
           try {
               List<Account> accList = new List<Account>();
                for(Integer i=0; i<5; i++)
                    {   
                        Account acc = new Account();
                        acc.Name= 'SFDC Account'+ i; 
                         accList.add(acc);
                    }
                //Insert 5 account records
                INSERT accList;
            System.debug('Account Inserted=> '+accList);
               
               List<Contact> conList = new List<Contact>();
                     for (Account acc : accList) 
                     {
                        Contact con =  new Contact();
                        con.LastName = acc.Name;
                        con.AccountId = acc.Id;//mapp account id to related contact
                        conList.add(con);
               		 }
					//Insert  contact with related Account
                INSERT conList;
               System.debug('Contact Inserted=> '+conList);

        } catch(DmlException e) {
            System.debug('DmlException has occurred: ' + e.getMessage());
    }
 }
}