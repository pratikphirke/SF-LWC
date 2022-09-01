public class OpportunityTriggerHandler {
   
    
    
public static void onAfterInsert(List<Opportunity> newlist)//---------------After Insert ---------------------------------------------------------------
       {  // After Insert -->Opportunity creation if Amount not null then add amt to acc anual revenue
           try{
               Set<Id> accIds = new Set<Id>();
               List<Account> accToUpdate = new List<Account>();
                for(Opportunity opp : newlist)
   				{
                    if(newlist !=null && opp.AccountId != null)
                    {
                   		accIds.add(opp.AccountId);
                    }
          		}
               accToUpdate = calAnualRevenue(accIds);
               if(!accToUpdate.isEmpty()){
                   Update accToUpdate; 
               }

           } catch(Exception e){
               System.debug('onAfterInsert Exception '+e);
               //return null;
           }
       }   
 		public static List<Account> calAnualRevenue( Set<Id> accIds)
 			{
                List<Account> accToUpdate = new List<Account>();
     			Map<Id,Decimal> accIdToAnnualRevenue = new Map<Id,Decimal>();	
     			try{
                	for(Opportunity opp : [SELECT ID, Amount, AccountId FROM Opportunity WHERE AccountId IN : accIds])
   					{
                        Decimal total =0;
                    	if(accIdToAnnualRevenue.containsKey(opp.AccountId))
                    	{
                    	 total =accIdToAnnualRevenue.get(opp.AccountId);
                    	}
                        if(opp.Amount!=null){
                            total= total + opp.Amount; 
                        }
                    	accIdToAnnualRevenue.put(opp.AccountId, total);
          			}
                    if(!accIdToAnnualRevenue.isEmpty()){
                        for(Id i : accIdToAnnualRevenue.keySet()){
                            Account acc=new Account();
                            acc.id =i;
                            acc.AnnualRevenue = accIdToAnnualRevenue.get(i);
                            
                            accToUpdate.add(acc);
                        }
                        
                    }
			
           			} catch(Exception e){
               			System.debug('calAnualRevenue Exception'+e);
               	
          		 }
                	return accToUpdate;
 		}   
    
    
public static void onAfterUpdate(List<Opportunity> newlist, Map<Id,Opportunity> oldMap)//-----------------After Update-------------------------------------------------------------
       {  //After Update -->when Opportunity amout updates then update acc anual revenue  
           try{
                
 				Set<Id> accIds = new Set<Id>();
              	 List<Account> accToUpdate = new List<Account>();
                    for(Opportunity opp : newlist)
                    {
                        if(opp.AccountId != null && opp.Amount != oldMap.get(opp.Id).Amount)
                        {
                            accIds.add(opp.AccountId);
                        }
                    }
                   accToUpdate = calAnualRevenue(accIds);
                   if(!accToUpdate.isEmpty()){
                       Update accToUpdate; 
                   }

           } catch(Exception e){
               System.debug('onAfterUpdate Exception'+e);
               //return null;
           }
       }    

    
   public static void onAfterDelete(List<Opportunity> oldlist)//----------------AfterDelete--------------------------------------------------------------
       {  //After Delete -->when Opportunity delete then update acc revenue
           try{
                
 				Set<Id> accIds = new Set<Id>();
              	 List<Account> accToUpdate = new List<Account>();
                    for(Opportunity opp : oldlist)
                    {
                        if(opp.AccountId != null)
                        {
                            accIds.add(opp.AccountId);
                        }
                    }
                   accToUpdate = calAnualRevenue(accIds);
                   if(!accToUpdate.isEmpty()){
                       Update accToUpdate; 
                   }
           } catch(Exception e){
               System.debug('onAfterDelete Exception'+e);
               //return null;
           }
       }         
    
}