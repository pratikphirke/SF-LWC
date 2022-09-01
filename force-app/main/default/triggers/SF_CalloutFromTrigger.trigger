trigger SF_CalloutFromTrigger on Account (Before Update) {
if(Trigger.isBefore&& Trigger.isUpdate){
       for (Account acc : Trigger.new) {
           SF_CalloutFromTriggerhandler.POSTData(acc.Description);
        }
                SF_CalloutFromTriggerhandler.GetData();
    }
}