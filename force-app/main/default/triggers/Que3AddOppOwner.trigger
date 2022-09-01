/*3. Write a trigger that adds the Opportunity Owner into the sales team automatically whenever the Opportunity is created.
    User: John Smith
    Profile: CDS
    Whenever this guy creates (owns) an oppty,
    i would like him to immediately be added to the Sales Team with the team role "Sales - CDS"
     all of the team roles say "sales - " and then the department which always matches the profile name.
NOTE--Opportunity team setting enable
*/

//-------------------------------------------------------------------------------------------------------------------------------------
/*
11. When we create the Opportunity with the Probability=20, then the opportunity 
    owner will be automatically added to Account Team of the associated account for that Opportunity.
NOTE-->*account team setting enable
*/

trigger Que3AddOppOwner on Opportunity (After insert,After update) {

    if(Trigger.isAfter){
        
        if(Trigger.isInsert){
            //Q3
             AssignmentOppTriggerHandler.addOppOwnerintoSale(trigger.New);
            
        }else if(Trigger.isInsert || Trigger.isUpdate){
            //Q11
             AssignmentOppTriggerHandler.oppAddAccTeam(trigger.New);
        }
        
       } 
}