Trigger populateManagerlookup on Ticket__c (Before insert) {
//write a trigger to automatically populate a manager lookup field( who is the manager of ticket creator) on the ticket object when it is created
    if(Trigger.isBefore){        
     if(Trigger.isInsert){
               try{     
                   Set <Id> ownerID = new Set<Id>();    
                 
                  // Select Id,ownerID,Name from Ticket__c where OwnerId='0055g0000046XRNAA2'
                     		 Map<Id,Id> MapuserId = new Map<id,id>();
                   
                             for (Ticket__c t: trigger.New) {
                                if (t.Ticket_Description__c != null) {
                                    ownerID.add(t.OwnerId);	//add unique acc from current opp
                                }
           					 }
                      System.debug('ownerID SET->'+ownerID);
                   			 List<User> usrlist = new List<User>();
                        usrlist = [Select Id,ManagerId from User Where Id IN: ownerID]; //id=0055g0000046XRNAA2    
                  		   System.debug('USER LIST->'+usrlist);
                        if(usrlist.size() > 0)
                        {
                            for(User u : usrlist)
       						 {
                                if(!MapuserId.containsKey(u.Id))
                                {
                                    MapuserId.put(u.Id, u.ManagerId);  
                                }
                            }
                             System.debug('MapuserId LIST->'+MapuserId);
                        }
                          
                      for(Ticket__c t :trigger.New)
                        {
                              if(MapuserId.containsKey(t.OwnerId))
                                {
                                    t.Manager__c = MapuserId.get(t.OwnerId);
                                      System.debug('Update Manager lookup LIST->'+ t.Manager__c);
                                }
                        }
					   
                            
               } catch(Exception e){
                   System.debug('populateManagerlookup Exception'+e.getMessage());
                  
               }
           } 
	 }
}