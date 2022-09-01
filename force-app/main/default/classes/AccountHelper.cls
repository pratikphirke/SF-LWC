public with sharing class AccountHelper {
 @AuraEnabled(cacheable=true)   
/*public static List<Account> getAccounts(String strAccountName) {

         String strKey = '%'+strAccountName+'%';
        List<Account> accList = [SELECT Id,Name,AccountNumber FROM Account WHERE name LIKE :strKey];
        return accList;
        }*/
 public static List<Account> getAccounts() {
         
        List<Account> accList = [SELECT Id,Name,Phone,Industry FROM Account LIMIT 5];
        return accList;
         }
}