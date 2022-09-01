public class AccountTriggerHandler {
    
 public static void updateDescAndRating(List<Account> newlist)//-----------Before Insert-------------------------------------------------------------------
       { //Before Insert Acc Record Update RATING=HOT and Description = Account create    
           try{
                for(Account acc : newlist)
   				{
                    if(acc.Industry !=null && acc.Industry == 'Media')
                    {
                        acc.rating = 'HOT';
                    }
                    acc.Description='Account created  ' +acc.Name+' Sucessfull...!!';
          		}

           } catch(Exception e){
               System.debug('Account not created'+e);
               //return null;
           }
       } 
         
public static void updateDescAndPhone(List<Account> newlist, Map<Id,Account> oldMap)//------------before update---------------------------------------------
       { //before update-->update Account desc if Phone Is Update
           try{
                for(Account acc : newlist)
   				{
                    if(oldMap !=null && acc.Phone != oldMap.get(acc.Id).Phone)
                    {
                    acc.Description='Phone Change ' +acc.Phone +'On  Account ' +acc.Name+' Sucessfull...!!';
                        
                    }
                    
          		}

           } catch(Exception e){
               System.debug('Account not created'+e);
               //return null;
           }
       }
    
 public static void checkAccStatus(List<Account> oldlist)//------------before delete------------------------------------------------------------------
       {  //before delete -->show error if Active account is delete
           try{
                for(Account acc : oldlist)
   				{
                    if(oldlist !=null && acc.Active__c == 'Yes')
                    {
                    acc.addError('Can NOT Delete Active Account  ' +acc.Name);
                        
                    }
                    
          		}

           } catch(Exception e){
               System.debug('Account not created'+e);
               //return null;
           }
       }                                   
 //--------------------------------------------------------------------------------------------------------------------------------------------
 
    
    //prevent users from creating duplicate accounts, with the same names
	/*public void updateUser(List<Account> accList)
           {
                  Set<Id> masterIds = new Set<Id>();
                  
                  for(Account accObj : accList)
                  {
                    if(accObj.Master__c != null)
                       masterIds.add(accObj.Master__c);
                  }
            
                    Map<Id,Master__c> masterMap = new Map<Id,Master__c>([Select Id, test_user1__c from Master__c where Id IN : masterIds]);
                     
                     
                  for(Account acct : accList)
                  {
            
                    if(masterMap.containsKey(acct.Master__c))
                    {
                       Master__c masterObj = masterMap.get(acct.Master__c);
                  
                        if(acct.test_user1__c == null)
                
                           acct.test_user1__c = masterObj.test_user1__c;
                    }
                  }
           }
    */
    
    
                                  
                                          
}