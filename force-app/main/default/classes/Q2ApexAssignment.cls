/*
2.	Client wants only upto 10 records to be created on the Account object daily.//batch apex
    Write code which will run every 15 minutes. //schedule apex 
	It will check for Account object records created in last 24 hour period (12 am to 12 pm). //Asyncapexjob(jobId)
	If the count exceeds 10, delete the additional records. Counter will reset at 12 am to 0.//Apex code //DMl Delete 

*/

global class Q2ApexAssignment implements Schedulable, Database.Batchable<sObject>{

	 global Database.QueryLocator start(Database.BatchableContext bc)
    {
   		 return Database.getQueryLocator([select id,Name from Account limit 100]);
    }

    global void execute(Database.BatchableContext bc,sObject[] scope)
     {      for(sObject s : scope)
                {
                     Account a =(Account)s;
                }
     }

    global void finish(Database.BatchableContext bc)
    {
   	 	// Database.executeBatch(new Batch2());
    }
    //---------------------------------------------------------------
     global void execute(SchedulableContext sc)
        {
            System.schedule('Account Updater: at 15 mins', '0 15 * * * ?', 
                            new Q2ApexAssignment());
        }
}
/*

System.schedule('Account Updater: at 00 mins', '0 0 * * * ?', new Q2ApexAssignment());
System.schedule('Account Updater: at 15 mins', '0 15 * * * ?', new Q2ApexAssignment());
System.schedule('Account Updater: at 30 mins', '0 30 * * * ?', new Q2ApexAssignment());
System.schedule('Account Updater: at 45 mins', '0 45 * * * ?', new Q2ApexAssignment());
*/
/*global void execute(SchedulableContext ctx) {

		List <Account> Accounts_to_Update = new List <Account>();

		List <Account> AccList = [SELECT Id, Type from Account WHERE LastModifiedDate = TODAY];

        for(Account a : AccList){

			if(a.Type != 'Prospect'){
				
				a.Type = 'Prospect';
				Accounts_to_Update.add(a);
			}
        }

		if(!Accounts_to_Update.isEmpty()){
			
			try{
				update Accounts_to_Update;
            }catch(Exception e) {
					
					System.debug('An exception occurred: ' + e.getMessage());
			}
		}
	}*/

/*
-----------------------------------------------------------------------------------------------------------------------------------------------

global class Batch1 implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
   		 return Database.getQueryLocator([select id,Name from Account limit 100]);
    }

    global void execute(Database.BatchableContext bc,sObject[] scope)
     {      for(sObject s : scope)
                {
                     Account a =(Account)s;
                }
     }

    global void finish(Database.BatchableContext bc)
    {
   	 	// Database.executeBatch(new Batch2());
    }

     global void execute(SchedulableContext sc)
        {
            Batch1 b = new Batch1();
            Database.executeBatch(b);
        }
}
//-----------------------------------------------------------------------------------------------------------
global class Schedulebatch implements Schedulable
{
    global void execute(SchedulableContext sc)
    {
        Batch1 b = new Batch1();
        Database.executeBatch(b);
    }
}
-----------------------------------------------------------------------------------------------------------------------------
Schedulebatch obj = new Schedulebatch();

string sch1 = '0 0 * ?';
System.schedule('jobName1', sch1, obj);

string sch2 = '0 15 * ?';
System.schedule('jobName2', sch2, obj);

string sch3 = '0 30 * ?';
System.schedule('jobName3', sch3, obj);

string sch4 = '0 45 * ?';
System.schedule('jobName4', sch4, obj);
-----------------------------------------------------------------------------------------------------------------------------------------------
*/
/*
Update account description, number of employees, contact last name using batch apex. 
Get the failure record ids in the email. Also schedule the job for every Monday.

global class batchUpdateAccountsContacts implements Database.Batchable <sObject>,Database.Stateful,Schedulable {
    global batchUpdateAccountsContacts()
	{
    }
    Set<id> successRecord = new Set<id>();
    Set<id> failRecord = new Set<id>();

    global Database.QueryLocator start(Database.BatchableContext info)
	{
        String SOQL='Select id,name,NumberOfEmployees, description,(select id, name from contacts) from Account';
        return Database.getQueryLocator(SOQL);
    }

    global void execute(Database.BatchableContext info, List<Account> scope)
{
   	 List<Account> accsToUpdate = new List<Account>();
        List<Contact> cUpdate = new List<Contact>();
        for(Account a : scope)
        {
            a.description ='Test';
            a.NumberOfEmployees = 70;
            accsToUpdate.add(a);
            for (Contact c:a.contacts){
            c.lastname = 'test+a';
            cUpdate.add(c);
    	}
   }
Database.SaveResult[] srList = Database.update(accsToUpdate, false);
Database.SaveResult[] srList1 = Database.update(cUpdate, false);


        for (Database.SaveResult sr : srList) {
        if (sr.isSuccess())
		{
        // Operation was successful, so get the ID of the record that was processed
        successRecord.add(sr.getId());
        }else {
                for(Database.Error err : sr.getErrors()) {
                }
                failRecord.add(sr.getId());
                }
			}

                for (Database.SaveResult sr : srList1) {
                if (sr.isSuccess()) {
                successRecord.add(sr.getId());
                }
                else {
                for(Database.Error err : sr.getErrors()) {
                }
                failRecord.add(sr.getId());
                }
                }


}
global void finish(Database.BatchableContext info)
{
    // Get the ID of the AsyncApexJob representing this batch job
    // from Database.BatchableContext.
    // Query the AsyncApexJob object to retrieve the current job's information.
    AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
    TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :info.getJobId()];
    
    // Send an email to the Apex job's submitter notifying of job completion.
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    
    String[] toAddresses = new String[] {a.CreatedBy.Email};
    mail.setToAddresses(toAddresses);
    mail.setSubject('Account and contact update' + a.Status);
    mail.setPlainTextBody
    
    ('The batch Apex job processed ' + a.TotalJobItems +
    ' batches with '+ a.NumberOfErrors + ' failures.'+successRecord+'successRecordids: '+ 'failRecordids: '+ failRecord);
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}


global void execute(SchedulableContext SC){
    database.executeBatch(new batchUpdateAccountsContacts(),100);
    //for cron expression
    // String cronexpression = ‘0 0 0 ? *’
    // System.schedule(‘Testing’, cronexpression, testobj);
    }
}



*/