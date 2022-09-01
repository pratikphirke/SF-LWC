trigger AccountTriggerBefore on Account (before insert,before update ,before delete) {

    if(Trigger.isBefore){
        
        if(Trigger.isInsert){
             //before insert-->prevent users from creating duplicate accounts, with the same names
            AccountTriggerHandler.updateDescAndRating(Trigger.New);
            
        }else if(Trigger.isUpdate){
             //before update-->update Account desc if Phone Is Update
             AccountTriggerHandler.updateDescAndPhone(Trigger.New,Trigger.oldMap);
            
        }else if(Trigger.isDelete){
             //before delete -->show error if Active account is delete
              AccountTriggerHandler.checkAccStatus(Trigger.old);
            
        }
       } 
     }