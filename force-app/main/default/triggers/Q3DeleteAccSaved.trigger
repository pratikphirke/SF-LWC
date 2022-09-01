/*

3.  Create custom object ‘Accounts Delete Log’ 
    with fields: Deleted Account Name, Account Deleted Date, Account Deleted Time. 
    When any record from Account object is deleted,
    its name & deletion date/ time should be saved in this ‘Accounts Delete Log’ object.

*/
trigger Q3DeleteAccSaved on Account (After delete) {
    if(Trigger.isAfter){
            if(Trigger.isDelete){
                 try{
                     Datetime now = Datetime.now();
                  //  Integer offset = UserInfo.getTimezone().getOffset(now);
                   // Datetime local = now.addSeconds(offset/1000);
                    Time local = Time.newInstance(
                            now.hour(), 
                            now.minute(), 
                            now.second(), 
                            now.millisecond());
                         List<Accounts_Delete_Log__c> lstToInsrt = new List<Accounts_Delete_Log__c>();  
                              for(Account deletedAcc : trigger.old)
                                  {
                                    system.debug('deletedAcc==> '+deletedAcc );  
                                       Accounts_Delete_Log__c backup = new Accounts_Delete_Log__c();
                                       backup.Name = deletedAcc.name;
                                        backup.Account_Deleted_Date__c =  date.parse( system.today().format());
                                        backup.Account_Deleted_Time__c =  local;
                                      
                                       lstToInsrt.add(backup);
                                      
                                       system.debug('backup '+backup);
                                  }
                     
                              if(lstToInsrt.size()>0)
                              {
                               insert lstToInsrt;
                               system.debug('list'+lstToInsrt);
                              }
                                    
                   } catch(Exception e){
                       System.debug('Q3DeleteAccSaved  Exception'+e);
                     
                   }
            }
       }
}