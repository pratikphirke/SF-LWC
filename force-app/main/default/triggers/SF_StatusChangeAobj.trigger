Trigger SF_StatusChangeAobj on Aobject__c (After Update) {
if(Trigger.isAfter)
    {
     if(Trigger.isUpdate) {
         Try{
                Set<Id> Aid = new Set<Id>();
                for(Aobject__c a:Trigger.new)
                {
                    if(a.Status__c!=Trigger.oldMap.get(a.Id).Status__c)//new rec!= old rec--status is changed
                    {
                        Aid.add(a.Id);
                    }
                }
                if(Aid.size()>0)
                {
                    List<Bobject__c> bList = new List<Bobject__c>();
                    
                    for(Cobject__c c:[SELECT Id,masterAobj__r.Status__c,masterBobj__r.Status__c,masterAobj__c 
                                      FROM Cobject__c  WHERE masterAobj__c IN:Aid])
                    {
                        if(c.masterAobj__r.Status__c != c.masterBobj__r.Status__c)
                        {
                            Bobject__c b = new Bobject__c();
                            b.Id = c.masterBobj__c;
                            b.Status__c = c.masterAobj__r.Status__c;
                            bList.add(b);
                        }
                    }
                     if(bList !=Null || bList.size() >0){
                          update bList;
                        System.debug('bList Is => '+bList);
                        }     
                  }      
     	     } catch (Exception e) {
              System.debug('Exception'+e);
			}
        }
  	}
}