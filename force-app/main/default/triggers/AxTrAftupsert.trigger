trigger AxTrAftupsert on Account (After insert,After update) 
{
    if(Trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate){
             ApexAftUpsert.updateOncontact();    
        }
    }
    //if(trigger.isInsert || trigger.isUpdate && trigger.isAfter)
/*
 * else if(trigger.isUpdate){
            ApexAftUpsert.updateOncontact();    
        }
*/   

}