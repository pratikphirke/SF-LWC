/*
 6. Create the object called “Customer Project” and create Status field under this object 
	with picklist data type (Values=Active, Inactive). Create the relationship between this
	 custom object and Opportunity so that Customer Project is related list to the Opportunity.
	Create  Active Customer project field on Opportunity object (Data Type=Checkbox)
	The logic is when we create Customer Project for an Opportunity with the Status=Active, 
	then Active Customer project check box on the Opportunity Detail page is automatically checked.
 */

trigger Q6UpdateCustProjActiveOpp on Customer_Project__c (before insert) {
    if(Trigger.isBefore)
    {
            if(Trigger.isInsert || Trigger.isUpdate)
            {
              List<Opportunity> opps = new List<Opportunity>();
                     for(Customer_Project__c cp:Trigger.New)
                     {
                         
                         if(cp.Status__c=='Active')
                         {
                             System.debug('Customer Project==> '+ cp);        
                             Opportunity opp= new Opportunity(id= cp.Opportunity_Relation__c);
                             opp.Active_Customer_Project__c = True;
                             opps.add(opp);
                             
                         }
                     }
                if(opps!=Null){
                      update opps;
                    System.debug('Update Sucessfully ==> '+ opps);   
                }
    
       	 }
        }
}