/*
    10. Create the object called “Customer” and create the Master-Detail Relationship on Customer 
    object so that Customer will be the related list to Account record. 
    Create the field called “Account Manager” on
     Customer object which is lookup to the user object.
    Now Logic is when we create Customer record for account record,
     then the user in Account Manager field will be automatically added to Account Team of that associated account.
NOTE-->*account team setting enable

*/


trigger Q10CustomerAddAccountTeam on Customer__c (After insert) {       

  if(Trigger.isAfter)
  {
       if(Trigger.isInsert)
       {     
        AssignmentCustomerTrigger.customerAddInAccountTeam(Trigger.New);
      }
   }
}