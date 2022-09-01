/*
1. Create “Top X Designation” custom object which is the related list to 
    Opportunity (Look up Relationship). In the Top X Designation object, create the fields Type (Picklist),
    Document Attached (Checkbox)
        Create one field Handoff Attached with pick list type with values are Yes, No on Opportunity Object.

  Logic :-  If Type (Top X Designation) = "Contract Flow Down/Handoff", and 
  "Document Attached” = True then "Handoff Attached" = True, otherwise false.
*/

trigger Que1TopXDesignation on Top_X_Designation__c (after insert, after update, after delete) {
   
    map<id,id> maptop = new map<id,id>();
    set<Id> oppid = new set<Id>();
    
    map<id,id> maptopfalse = new map<id,id>();
    set<Id> oppIdInFalseCase = new set<Id>();
    
    map<id,id> deletecase = new map<id,id>();
    set<Id> delcaseid = new set<Id>();
    
    list<Opportunity> opplist = new list<Opportunity>();
    list<Opportunity> listtoupdate = new list<Opportunity>(); 
    
  if(trigger.isafter){
    for(Top_X_Designation__c top : trigger.isdelete? trigger.old : trigger.new)
    {
        if(trigger.isInsert || trigger.isUpdate)
        {
            if(top.Document_Attached__c == true &&((top.Type__c=='Contract Flow Down') || (top.Type__c=='Handoff')))
            {
                maptop.put(top.OppLookUp__c, top.Id);
                oppid.add(top.OppLookUp__c);
                //system.debug('here '+ top.OppLookUp__c);
            } else{
             maptopfalse.put(top.OppLookUp__c,top.id);
            oppid.add(top.OppLookUp__c);
           // system.debug('here in else part '+ top.OppLookUp__c);
            }
          
        }

        if(trigger.isDelete)
            {
            deletecase.put(top.OppLookUp__c,top.Id);
            delcaseid.add(top.OppLookUp__c);
            oppid.add(top.OppLookUp__c);
            }
        }

        opplist = [select Id,Handoff_Attached__c from opportunity where id in:oppid];
        for( opportunity opp : opplist)
        {
            if(maptop.containsKey(opp.id))
            {
                opp.Handoff_Attached__c ='yes';
                //listtoupdate.add(opp);
              }

            if(maptopfalse.containsKey(opp.id))
            {
                  opp.Handoff_Attached__c ='no';
                  // listtoupdate.add(opp);
            }

            if(delcaseid.contains(opp.Id))
            {
                opp.Handoff_Attached__c ='';
            }
                 listtoupdate.add(opp) ;
            }

        if( listtoupdate.size()>0)
            {
                update listtoupdate;
                system.debug('testL'+listtoupdate);
            }
        }
 }