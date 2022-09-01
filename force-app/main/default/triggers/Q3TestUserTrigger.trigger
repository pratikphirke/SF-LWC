//---------------------------------------------------------------------------------------------------------------------------------------------
/*
 Handle recursion - To avoid the recursion on a trigger, 
  make sure your trigger is getting executed only one time. 
  You may encounter the error : 'Maximum trigger depth exceeded',
  if recursion is not handled well. 
 You can use Static Boolean variable in apex class
   and check the variable in Apex Trigger IF it is true 
then execute your logic and make it false so that trigger can not execute Again.

-----------------------------------------------------------------------------------
Static in Salesforce are per transaction, 
so the value will be true only for the current transaction. 
It will be initialized to true for other transactions.
Don't think of static in Java term where static values persist till the class is loaded into memory. 
*/
//Note: Add record Test User new ->TestData
trigger Q3TestUserTrigger on Test_User__c  (After Insert,After Update) 
{
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert || Trigger.isUpdate)
        {
              for (Test_User__c test : Trigger.new) 
            		{
                       AssignmentTestUserHandler.PostData(test.Name);
                         AssignmentTestUserHandler.GetData();
                         
            		}
        	}
    	}
  }

 








/*trigger Q3TestUserTrigger on Test_User__c  (After insert) {

 if(Trigger.isAfter){
              
            if(Trigger.isInsert){           
     
             for (Test_User__c test : Trigger.new) {
                    //make webservice callout
                    System.debug('New User Record==>  ' +test); 
                   AssignmentTestUserHandler.sendTestUserInfo(test.Name, test.username__c, test.email__c,test.phone__c,test.website__c);
                } 
       }
     }
   }*/