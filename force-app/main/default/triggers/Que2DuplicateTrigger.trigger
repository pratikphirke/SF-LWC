trigger Que2DuplicateTrigger on Account (before insert,before update ,before delete,
                                        After insert,After update ,After delete) {

    if(Trigger.isBefore){
        
        if(Trigger.isInsert || Trigger.isUpdate){
            
       
            
          //Q2. Write a Triger to Prevent the users to create Duplicate Accounts----------------------------------------------------------------
                     //AssignmentTriggerHandler.preventDuplicateAcc(trigger.New);
          //Q7. When we Update the Account record, the Account Owner will be automatically added to Sales Rep field.----------------------------
                  // AssignmentTriggerHandler.UpdateSalesRep(trigger.New);  
              
         //Q4 Provide solution to handle recursive trigger. (Take any example of your choice)-------------------------------------------------------
         //Insert failed. First exception on row 0; first error: CANNOT_INSERT_UPDATE_ACTIVATE_ENTITY
         //maximum trigger depth exceeded(after 16th time)
                if(AssignmentTriggerHandler.flag == true)
                {
                       AssignmentTriggerHandler.flag = false;        
                      AssignmentTriggerHandler.recursiveTrigger(); 
                }
          
        }else if(Trigger.isDelete)
            {
                //Apex Trigger-->Q2.Provide solution to prevent deletion of Account If contact related to that account is present.
               AssignmentTriggerHandler.preventDeletionAccount(Trigger.old); 
            }
       } else if(Trigger.isAfter)
       {
        
            if(Trigger.isInsert)
            {           
            /*5. Create Custom field called “Number of Contacts” on the Account Object (Data Type=Number)
                The trigger creates the number of contacts which are equal to the number which 
                we will enter in the Number of Contacts field on the Account Object.
            */
               //AssignmentTriggerHandler.CreateAccNumberOfContact(Trigger.New);
    
            }else if(Trigger.isUpdate){
                 
            }else if(Trigger.isDelete){
                /*3.  Create custom object ‘Accounts Delete Log’ 
                        with fields: Deleted Account Name, Account Deleted Date, Account Deleted Time. 
                        When any record from Account object is deleted,
                        its name & deletion date/ time should be saved in this ‘Accounts Delete Log’ object.*/
                 AssignmentTriggerHandler.delectAccSavedLog(Trigger.New,Trigger.Old);
            }
       }
     }