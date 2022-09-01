public class AssignmentTriggerHandler {
    public static boolean Flag = true;//handle recurssion trigger q4
     public static void preventDuplicateAcc(List<Account> newlist)
           { //Q2. Write a Triger to Prevent the users to create Duplicate Accounts
               try{
                 
                    for(Account acc : newlist)
                    { 
                        System.debug('Account new ==>  '+acc);
                        List<Account> accList =[Select id from Account where Name=:acc.Name];
                        if(accList.size()>0)
                          {//Test record1
                             acc.Name.addError('You Cannot Create the Duplicate Account');
                          }else{
                              System.debug('Duplicate Record Created How??');
                          }
                        
                    }
    
               } catch(Exception e){
                   System.debug('Account Created Exception'+e);
                  
               }
           } 
 //-------------------------------------------------------------------------------------------------------------------------------------------------   
    public static void CreateAccNumberOfContact(List<Account> newlist)
           { //Q5. creates the number of contacts which are equal to the number which 
          		 // we will enter in the Number of Contacts field on the Account
               try{
                     	list<contact> listContact = new list<contact>();
                        map<id,decimal> mapAcc=new map<id,decimal>();
                    
                        for(Account acc: newlist){
                            mapAcc.put(acc.id,acc.Number_of_Contact__c);//(accId,Numberofcontact)
                        }
                   
                    	//System.debug('MAp ACCOUNT==> '+ mapAcc);//MAp ACCOUNT==> {0015g00000AH8hNAAT=2}
                   
                        if(mapAcc.size()>0 && mapAcc!=null){
                            for(Id accId:mapAcc.keyset()){//unique key set for each acId= 2
                                
                                for(integer i=0;i<mapAcc.get(accId);i++){ //loop executed in 2 times to make 2 contact
                                    
                                    contact newContact 	 = 	new contact();
                                    newContact.accountid =	accId;  //link AccID 
                                    newContact.lastname =   'contact ' +i; //To Make it unique +i
                                    
                                    listContact.add(newContact);
                                }
                            }
                        }
                    
                   if(listContact.size()>0 && listContact!=null){
                         insert listContact;                        
         			 System.debug('List Contact ==> '+ listContact);
                   }
                          
                  
               } catch(Exception e){
                   System.debug('CreateAccNumberOfContact Exception'+e);
                  
               }
           } 
 //-------------------------------------------------------------------------------------------------------------------------------------------------   
     public static void UpdateSalesRep(List<Account> newlist)
           { //Q7. When we create/Update the Account record, the Account Owner will be automatically added to Sales Rep field. 
          		 try{
                     
                   /*  for(Account objA : newlist){
                    objA.Sales_Rep__c = objA.OwnerId;
                    }*/
                     
					Set<Id> Ownerset = new  Set<Id>();
  					//System.debug('Ownerset==>   '+Ownerset);
                     for(Account acc: newlist) 
                     { 
                   	  	Ownerset.add(acc.OwnerId);
                     }

			 Map<Id,User> User_map = new Map<Id,User>([SELECT Name FROM User WHERE Id IN : Ownerset]);
			//SELECT Name,Id FROM User Where id = '0055g0000046XRNAA2';pratik
				//System.debug('User_map==>  '+User_map);
                 for(Account acc: newlist)
                  {
                         User usr = User_map.get(acc.OwnerId);     
                         Acc.Sales_Rep__c = usr.Name;
                 }
                                     
               } catch(Exception e){
                   System.debug('UpdateSalesRep Exception'+e);
                  
               }
           }
 //------------------------------------------------------------------------------------------------------------------------------------------------- 
     public static void preventDeletionAccount(List<Account> oldlist)
           {//Apex Trigger-->Q2.Provide solution to prevent deletion of Account If contact related to that account is present.
          		 try{
                     List<Account> accList = new List<Account>();
                     Set<id> accIdSet = new Set<id>();
                        for(Account acc : oldlist)
                        {
                       		 accIdSet.add(acc.id);
                        }
                        
                     Map<Id, Account> accts = new Map<Id, Account>([SELECT Id, (SELECT Id FROM Contacts) 
                                                                    FROM Account WHERE Id IN :accIdSet]);
                        
                     for(Account acc : oldlist)
                        {
                            if(accts.get(acc.id).contacts.size()>0)
                            {
                            	acc.adderror('Account cannot be deleted');
                                 System.debug('Account cannot be deleted');
                            }
                        }
                               
                   } catch(Exception e){
                       System.debug('preventDeletionAccount Exception'+e);
               }
           }
    
     //------------------------------------------------------------------------------------------------------------------------------------------------- 
         public static void delectAccSavedLog(List<Account> newlist,List<Account> Oldlist)
           { //Que3 -‘Accounts Delete Log’
               try{
                     Datetime now = Datetime.now();
                     Time local = Time.newInstance(//to get local time of salesforce org
                            now.hour(), 
                            now.minute(), 
                            now.second(), 
                            now.millisecond());
                   
                         List<Accounts_Delete_Log__c> lstToInsrt = new List<Accounts_Delete_Log__c>(); 
                   
                              for(Account deletedAcc : Oldlist)//get deleted acc record
                                  {
                                    system.debug('deletedAcc==> '+deletedAcc ); 
                                      
                                       Accounts_Delete_Log__c backup = new Accounts_Delete_Log__c(); //create instance to update field in accdeletelog
                                       backup.Name = deletedAcc.name;
                                        backup.Account_Deleted_Date__c =  date.parse( system.today().format());
                                        backup.Account_Deleted_Time__c =  local;
                                      
                                       lstToInsrt.add(backup);
                                      
                                       system.debug('backup '+backup);
                                  }
                     
                              if(lstToInsrt.size()>0)
                              {
                               insert lstToInsrt; //insert record into log
                               system.debug('list'+lstToInsrt);
                              }
                                    
                   } catch(Exception e){
                       System.debug('Q3DeleteAccSaved  Exception'+e);
                     
                   }
           } 
   //------------------------------------------------------------------------------------------------------------------------------------------------- 
         public static void recursiveTrigger()
           {   //Q4 Provide solution to handle recursive trigger. (Take any example of your choice)
               try{
               
                       Account ac = new Account();
                        ac.Name = 'Child Account';
                        ac.Phone = '1234567890';
                   		ac.Industry='Finance';
                       
                   		insert ac;    
                       system.debug('ACC List Inserted => '+ac);
 
    
               } catch(Exception e){
                   System.debug('Recursive Trigger Exception'+e);
                  
               }
           } 
     
}