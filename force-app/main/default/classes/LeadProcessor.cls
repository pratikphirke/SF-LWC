global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {

    //Creating a variable that will keep the count of Leads processed:
    global Integer recordsProcessed = 0;

    //Retrieving all Leads records (First step in Batch)
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT ID, LeadSource FROM Lead]);
    }

    //Processing all retrieved records (Second step in Batch)
    global void execute(Database.BatchableContext bc, List<Lead> scope) {
        for (Lead lead : scope) {
            lead.LeadSource = 'Dreamforce';
            recordsProcessed = recordsProcessed + 1;
            System.debug(lead.LeadSource);
        }
        update scope;
    }

    //Finishing (Final step in Batch)
    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
    }
}