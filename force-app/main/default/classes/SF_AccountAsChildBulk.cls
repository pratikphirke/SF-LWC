//Create Account in bulk and Set account as child account
public class SF_AccountAsChildBulk {
 public static void createBulkChildAccRecords(){
           try {
               List<Account> accList = new List<Account>();
               Account accParent = new Account(Name='Parent Account');
               insert accParent;
				System.debug('Parent ACCOUNT CREATED=>'+accParent.Id+'Name '+accParent.Name);
               
                for(Integer i=1; i<2; i++)
                    {   
                        Account acc = new Account();
                        acc.Name= 'Child Account'+ i; 
                        acc.ParentId = accParent.Id;
                         accList.add(acc);
                    }
                //Insert 5 account records
                INSERT accList;
            System.debug('Child Account Inserted=> '+accList);
               
              

        } catch(DmlException e) {
            System.debug('DmlException has occurred: ' + e.getMessage());
    }
 }
}