public class AccountHandler {
    /*public static void insertAccount(Integer value){
        Integer counter = 1;
        //create a list to add our accounts
        List<Account> addAccounts = new List<Account>();
        while(counter <= value){
            //display the current counter value
            System.debug('Counter Value before Incrementing ' + counter);
            //create a new account
            Account store = new Account();
            store.Name          = 'Acme Inc ' + counter;
            store.AccountNumber = 'A000' + counter;
            addAccounts.add(store);
            System.debug(addAccounts);
            //increment the counter
            counter = counter + 1;
            System.debug('Counter Value after incrementing ' + counter);
        }
        System.debug('Size of Account List: ' + addAccounts.size() );
        System.debug('Elements in Account List: ' + addAccounts);
        //insert all of the accounts in the list
        insert addAccounts;
    }*/
    
       public static Account insertNewAccount (String accName)
       { 
       if(accName!=''){    
           try{
               Account a = new Account(Name=accName);
               insert a;
               System.debug('Bravo User5633! Account created');
               return a;
           } catch(Exception e){
               System.Debug('Account not created');
               return null;
           }
       } else {
           return null;
       }
	}  
}