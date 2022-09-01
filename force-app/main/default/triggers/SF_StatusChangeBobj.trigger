Trigger SF_StatusChangeBobj on Bobject__c (After Update) {
if(Trigger.isAfter)
    {
     if(Trigger.isUpdate) {
         Try{
              Set<Id> BId= new Set<Id>();
             for(Bobject__c  B:trigger.new)
             {
               if(B.Status__c !=trigger.oldmap.get(B.Id).Status__c )
                 BId.add(B.Id);
             }
             if(!BId.isempty())
             {
              list<Aobject__c > Alist = new list<Aobject__c >();
              for(Cobject__c ObjC:[SELECT Id,masterAobj__r.Status__c,masterBobj__c, masterBobj__r.Status__c
                                   FROM Cobject__c WHERE masterBobj__c IN :BId])
                     {
                       if(ObjC.masterBobj__r.Status__c != ObjC.masterAobj__r.Status__c)
                         {
                           Aobject__c A = new Aobject__c();
                           A.Id = ObjC.masterAobj__c ;
                           A.Status__c = ObjC.masterBobj__r.Status__c;
                            Alist.add(A);
                         }
                     }
                      if(!Alist.isEmpty()) {
                        UPDATE Alist;
                      }
             }
             
     	     } catch (Exception e) {
              System.debug('Exception'+e);
			}
        }
  	}
}