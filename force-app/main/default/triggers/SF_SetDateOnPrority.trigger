trigger SF_SetDateOnPrority on Complaint__c (After insert,Before update) {
  
    if(Trigger.isBefore){
        
             if(Trigger.isUpdate)
             {
                SF_ComplaintHelper.Update_CalResponseDate(Trigger.New);
             }      
 }else if(Trigger.isAfter){
        
            if(Trigger.isInsert)
                {           
                     SF_ComplaintHelper.Insert_CalResponseDate(Trigger.New);
                }
       }
}