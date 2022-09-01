trigger OpportunityChangeTrigger on OpportunityChangeEvent(after insert) {
    List<Opportunity> opps = new List<Opportunity>();
    List<Task> taskList = new List<Task>();
    for(OpportunityChangeEvent event : Trigger.New){
        EventBus.ChangeEventHeader header = event.ChangeEventHeader;
        if(header.changeType == 'UPDATE' && event.isWon){
            for(String oppId: header.recordIds){
				Task task = new Task();
            	task.WhatId = oppId;
                task.OwnerId= header.CommitUser;
            	task.subject = 'Follow up on won opportunities: ' +header.recordIds;
            	tasklist.add(task);
            }
        }
    }
    if(taskList.size()>0){
        insert taskList;
    }

}