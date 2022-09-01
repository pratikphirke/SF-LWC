trigger ClosedOpportunityTrigger on Opportunity  (after insert,after update) {
if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate){
            List<Task> taskList = new List<Task>();
            
            for(Opportunity opp : Trigger.new){
                if(opp.StageName == 'Closed Won')
                {
                   taskList.add(new Task(Subject ='Follow Up Test Task',WhatId = opp.Id));
                }
                
            }
            if(taskList.size()>0){
                Insert taskList;
            }
        }
    }
}