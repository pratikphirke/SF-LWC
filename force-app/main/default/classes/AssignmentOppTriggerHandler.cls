public class AssignmentOppTriggerHandler {

//3. Write a trigger that adds the Opportunity Owner into the sales team automatically whenever the Opportunity is created   
public static void addOppOwnerintoSale(List<Opportunity> newlist)
           {
             try{                   
                  List<OpportunityShare> sharesToCreate = new List<OpportunityShare>();
                  List<OpportunityTeamMember> oppteam = new List<OpportunityTeamMember> ();
                 OpportunityShare oshare = new OpportunityShare();
                   
                 oshare.OpportunityAccessLevel = 'Edit';//acess of oppp record
                 oshare.OpportunityId =  newlist[0].Id;
                 oshare.UserOrGroupId = newlist[0].OwnerId;
                 sharesToCreate.add(oshare);
                   
                 OpportunityTeamMember ot = new OpportunityTeamMember(); //rec Owner assign into team 
                 ot.OpportunityId = newlist[0].Id;
                 ot.UserId = newlist[0].OwnerId;
                 ot.TeamMemberRole = 'Sales Rep';
                 oppteam.add(ot);
                
                 if(Oppteam!=null && Oppteam.size()>0)
                     {
                        insert Oppteam;
                          System.debug('After Insert OpportunityTeamMember List==>   '+oppteam);
                     }

                 if(sharesToCreate!=null && sharesToCreate.size()>0)
                
                	 {
                
                	 	list<Database.SaveResult> dsr = Database.insert(sharesToCreate,false);
                          System.debug('After Insert OpportunityShare List==>   '+sharesToCreate);
                              
                               for (Database.saveresult sr : dsr) {
                                    if (sr.isSuccess()) {
                                        //After insert Sucessfull
                                        System.debug('Successfully inserted Record ID: ' + sr.getId());
                                    }
                                   
                            else {//To Track Error 
                                for(Database.Error err : sr.getErrors()) {
                                    system.debug('err'+err);
                                    System.debug('The following error has occurred.');                    
                                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                                    System.debug('Account fields that affected this error: ' + err.getFields());
                                }
                            }
                     	}
                	}

               } catch(Exception e){
                   System.debug('addOppOwnerintoSale Exception'+e.getMessage());          
		}
  } 

//-------------------------------------------------------------------------------------------------------------------------------------------
/*
11. When we create the Opportunity with the Probability=20, then the opportunity 
	owner will be automatically added to Account Team of the associated account for that Opportunity.
NOTE-->*account team setting enable

*/
    public static void oppAddAccTeam(List<Opportunity> newlist)
           {
               System.debug('opportunity Rec==>   '+newlist);
              try{
                 List<AccountShare> accShareList = new List<AccountShare>();
                 List<AccountTeamMember> accTeamList = new List<AccountTeamMember>();
                  
                 for(Opportunity opp : newlist)
                 {
                     if(opp.Probability == 20)
                     {
                         AccountTeamMember accTeam = new AccountTeamMember();
                             accTeam.accountid		=   opp.accountid;
                             accTeam.teamMemberRole	=   'Account Manager';
                             accTeam.UserId			=   opp.Ownerid;
                         
                         AccountShare accShare = new AccountShare();
                             accShare.AccountId				=  	opp.Accountid;
                             accShare.UserOrGroupId 		= 	opp.OwnerId;
                             accShare.AccountAccessLevel	=   'Read/Write';
                             accShare.OpportunityAccessLevel =  'Read Only';
                             accShare.CaseAccessLevel		=	'Read Only';
                         
                         accTeamList.add(accTeam);
                         accShareList.add(accShare);
                     }
                 }
                  if(accTeamList!=null){
                     insert accTeamList; 
                  }
                     
                  if(accShareList!=null && accShareList.size()>0){
					   List<Database.saveresult> dsr = Database.insert(accShareList,false);
                             for (Database.saveresult sr : dsr) {
                                    if (sr.isSuccess()) {
                                        
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
                  
               } catch(Exception e){
                   System.debug('oppAddAccTeam Exception'+e.getMessage());          
		}
  } 

    
}