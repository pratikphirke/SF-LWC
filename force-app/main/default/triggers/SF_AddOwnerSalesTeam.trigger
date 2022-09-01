// Write a trigger that adds the Opportunity Owner into the sales team automatically whenever the Opportunity is created
Trigger SF_AddOwnerSalesTeam on Opportunity (After insert) {

 if(Trigger.isAfter){        
     if(Trigger.isInsert){
               try{                    
                   List<OpportunityTeamMember> oppTeamList = new List<OpportunityTeamMember> ();    
                     OpportunityTeamMember ot = new OpportunityTeamMember();
                       for(Opportunity op:trigger.new)
                        {  
                             ot.OpportunityId = op.Id;
                             ot.UserId = op.OwnerId;
                             ot.TeamMemberRole = 'Sales Team';
                             oppTeamList.add(ot);     
                        }                    
                 if(oppTeamList!=null && oppTeamList.size()>0)
                     {
                        insert oppTeamList;  
                     }
               } catch(Exception e){
                   System.debug('SF_AddOwnerSalesTeam Exception'+e.getMessage());
                  
               }
           } 
     }
}