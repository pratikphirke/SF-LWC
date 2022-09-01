/*Q.5)Create Three Objects (A, B, C). Object 'C' will be the junction object. 
    Create status field on object 'A' and 'B' (note:- Status:New Open Closed).
    Write trigger to update status field of all related records.
    whenever there is change in status of record on either object(A,B). 

*/
trigger Q5changeStatusJunctoionObj on Cobject__c(after insert, after update)
{
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert ||Trigger.isUpdate )
        {
             Q5JunctionObjHandler.update_Status(Trigger.new);
        }
    }         
}





/*

trigger TRIGGERNAME on Child_Object__c (after insert, after delete, after update) {

    if(Trigger.isInsert){
            try {
                for (Child_Object__c co : Trigger.new){
                    Parent_Object__c po = [SELECT Id, Sum_Field__c  FROM Parent_Object__c WHERE Id = :co.Parent_Lookup__c];
                    
                    List<Child_Object__c> l_co = [SELECT Id, Amount__c FROM Child_Object__c WHERE Parent_Lookup__c = :po.Id];
                    for(Child_Object__c am_co : l_co) {
                        amount += am_co.Amount__c;  
                    }
                    po.Sum_Field__c = amount;

                    update po;
                }
            } catch (Exception e) {
                System.debug(e);
            }
        }

    if(Trigger.isAfter) {
        if(Trigger.isUpdate){
            try {
                for (Child_Object__c co : Trigger.old){
                    Parent_Object__c po = [SELECT Id, Sum_Field__c  FROM Parent_Object__c WHERE Id = :co.Parent_Lookup__c];
                    
                    List<Child_Object__c> l_co = [SELECT Id, Amount__c FROM Child_Object__c WHERE Parent_Lookup__c = :po.Id];
                    for(Child_Object__c am_co : l_co) {
                        amount += am_co.Amount__c;  
                    }
                    po.Sum_Field__c = amount;

                    update po;
                }
            } catch (Exception e) {
                System.debug(e);
            }
        }

      
    }
}
*/