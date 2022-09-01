/*
Q.5)Create Three Objects (A, B, C). Object 'C' will be the junction object. 
	Create status field on object 'A' and 'B' (note:- Status:New Open Closed).
	Write trigger to update status field of all related records.
	whenever there is change in status of record on either object(A,B).  

Note:
--new->Aobj-status->Open
--new->Bobj-status->Closed
--new->Cobjcect  --edit --save
---then //Aobj status become --closed 
*/

public class Q5JunctionObjHandler 
{
    public static void update_Status(List<Cobject__c> newlist)
    {
         try {
              List<Aobject__c> aobjList = New List<Aobject__c>();
              List<Bobject__c> bobjList = New List<Bobject__c>();
        //--Update Record --------------------------------------------------------------    
        List<Cobject__c> oldRecList = [SELECT Id, Name,masterAobj__c,masterBobj__c
                                        FROM Cobject__c 
                                       WHERE masterAobj__c =: newlist[0].masterAobj__c 
                                       AND masterBobj__c =: newlist[0].masterBobj__c  AND Id IN : newlist];    
           //Link record via junction  obj  
        System.debug('oldRecList==>  '+oldRecList);
             
             Aobject__c Ao = [SELECT Id, Name, Status__c  FROM Aobject__c WHERE Id = :oldRecList[0].masterAobj__c];
                     System.debug('Aobject__c=>  '+Ao);
             
              Bobject__c Bo = [SELECT Id,Name, Status__c  FROM Bobject__c WHERE Id = :oldRecList[0].masterBobj__c];
                     System.debug('Bobject__c=>  '+Bo);
             
                 if(Ao !=Null)// Ao.Status__c != Bo.Status__c 
                 {
                   Ao.Status__c = Bo.Status__c;//update objA status according status of objB
                     aobjList.add(Ao);
					if(aobjList.size()>0)
                	{
                   		update aobjList;
                 		System.debug('update aobjList==> '+aobjList);
             		}                     
                 }
             	/*if(Bo.Status__c != Ao.Status__c  ){
                      Bo.Status__c = Ao.Status__c;
						 bobjList.add(Bo);
                   // 	 update bobjList;
                     System.debug('update bobjList==> '+bobjList);
                 }*/

            } catch (Exception e) {
                System.debug(e);
            }
    }
}