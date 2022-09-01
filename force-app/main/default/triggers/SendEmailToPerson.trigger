/*
5.  After a Contact record is created, 
    send an email to that person, welcoming them to Salesforce Platform. 
    [Restriction: Cannot use email templates/ alerts for this]

*/
trigger SendEmailToPerson on Contact (after insert,after update) 
{
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert || trigger.isUpdate)
        { 
            HelperContactTrigger.sendEmail(trigger.new);
        }
    }
}