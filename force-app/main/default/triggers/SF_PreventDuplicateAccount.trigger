Trigger SF_PreventDuplicateAccount on Account (Before Insert, Before Update, After Insert) {
    if(Trigger.isBefore ){
    if(Trigger.isInsert){
//Q2. Write a Triger to Prevent the users to create Duplicate Accounts
           SF_AssignmentAccHandler.preventDuplicateAcc(Trigger.New);
            
 /*Write a trigger to update the account industry field with value "Banking". 
Note: Develop a trigger which will not run when user is perfoming data import
*/          SF_AssignmentAccHandler.updateAccIndustry(Trigger.New);
        
    }else if(Trigger.isUpdate){
       for (Account acc : Trigger.new) {
        System.debug('new Account after update---'+acc.Name);
           SF_AssignmentAccHandler.POSTData(acc.Description);
        }
                SF_AssignmentAccHandler.GetData();
    }
}else if(Trigger.isAfter){
    if(Trigger.isInsert){ 
        /*
        Create Custom field called “Number of Contacts” on the Account Object (Data Type=Number) 
        The trigger creates the number of contacts which are equal to the number 
        which we will enter in the Number of Contacts field on the Account Object.
        */
         SF_AssignmentAccHandler.CreateAccNumberOfContact(Trigger.New);
        
        }else if(Trigger.isUpdate){
   // when account address is changed contact address should be changed.
         //  SF_AssignmentAccHandler.updateContactAddress(Trigger.New,Trigger.OldMap,Trigger.NewMap);
        }
    }   
 }