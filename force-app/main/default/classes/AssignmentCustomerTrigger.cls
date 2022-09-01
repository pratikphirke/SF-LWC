public class AssignmentCustomerTrigger {
 	public static void customerAddInAccountTeam(List<Customer__c> newList)
           { 
               try{
                    List<AccountTeamMember> accteamList = new List<AccountTeamMember>();
                   System.debug('AccountTeamMember List==>   '+accteamList);
					List<AccountShare> accShareList = new List<AccountShare>();
                   System.debug('AccountShare List==>   '+accShareList);
                     
                     if(trigger.isInsert)
                     {
                     	For(Customer__c c : newList)
                     {
                    	  System.debug('Customer__c List==>   '+newList);
                         if(c.Account_Manager__c!=null)
                         {
                            AccountTeamMember accTeam = new AccountTeamMember();
                             accTeam.accountid      =  c.Account__c;  
                             accTeam.teamMemberRole =  'Account Manager';
                             accTeam.UserId			=  c.Account_Manager__c;
                     	
                            AccountShare accShare = new AccountShare();        
                             accShare.AccountId				=	c.Account__c;
                             accShare.UserOrGroupId 		= 	c.Account_Manager__c;
                             accShare.AccountAccessLevel	=	'Edit';
                             accShare.OpportunityAccessLevel = 	'Read';
                             accShare.CaseAccessLevel		=	'Read';
                             accShareList.add(accShare);
                            
                             accteamList.add(accTeam);
                         }                    
                     }
                    
                     if(accteamList!=null)
                     {
                     	insert accteamList;    
                     }
                         
                     if(accShareList!=null && accShareList.size()>0)
                  	   {
                    	 	List<Database.saveresult> dsr =  Database.insert(accShareList,false);    

                               for (Database.saveresult sr : dsr) {
                                    if (sr.isSuccess()) {
                                        // Operation was successful, so get the ID of the record that was processed
                                        System.debug('Successfully inserted Record ID: ' + sr.getId());
                                    }
                                   
                            else {
                                for(Database.Error err : sr.getErrors()) {
                                    system.debug('err'+err);
                                    System.debug('The following error has occurred.');                    
                                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                                    System.debug('Account fields that affected this error: ' + err.getFields());
                                }
                            }
                     	}
                      }  
                     }    
                   } catch(Exception e){
                   System.debug('customerAddInAccountTeam Exception'+e.getMessage());
                  
               }
           } 
}