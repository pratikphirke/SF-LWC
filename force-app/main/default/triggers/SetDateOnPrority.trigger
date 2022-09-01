trigger SetDateOnPrority on Complaint__c (After insert,Before update) {//Before insert

  if(Trigger.isBefore){
        
           if(Trigger.isUpdate)
                {
                      AsssignmentComplaintHandler.update_ResponseDate(Trigger.New);//,Trigger.oldMap
                         
                }
                    
       } else if(Trigger.isAfter){
        
            if(Trigger.isInsert)
                {           
                    //AsssignmentComplaintHandler.insert_ResponseDate(trigger.New);
                }
       }


        
       /* if(Trigger.isBefore && Trigger.isUpdate ||Trigger.isAfter &&  Trigger.isInsert)// 
        {
             AsssignmentComplaintHandler.isFirstTime = false;
              AsssignmentComplaintHandler.comon_ResponseDate(trigger.New);
        }*/
    
                   
}