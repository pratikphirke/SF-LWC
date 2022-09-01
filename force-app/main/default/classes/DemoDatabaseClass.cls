public class DemoDatabaseClass {
    
 //countQuery(query) ----------------------------------------------------------------------------------------------------------------  
//Each executed countQuery method counts against the governor limit for SOQL queries.    
    
   /* String QueryString =  'SELECT count() FROM Account'; 
	Integer i = Database.countQuery(QueryString);
	System.debug('COUNT ACCOUNT '+i);
    */
//delete(recordsToDelete, allOrNone)---------------------------------------------------------------------------------------------------
//public static Database.DeleteResult[] delete(SObject[] recordsToDelete, Boolean allOrNone)
//Deletes a list of existing sObject records, such as individual accounts or contacts, from your organization’s data.
//each executed delete method counts against the governor limit for DML statements.    
    /*
        Account[] acc = [SELECT Id, Name FROM Account WHERE Name = 'Acme3']; 
		Database.DeleteResult[] resultDel = Database.delete(acc,false);
		System.debug('DELETE RECORD RESULT  '+resultDel);
		//(Database.DeleteResult[getErrors=();getId=0015g00000AFYq3AAH;isSuccess=true;])
	*/
    
   
    
    
    
    
//-----------------------------------------------INSERT RECORD----Database.insert();-------------------------------------
   /* // Create the list of sObjects to insert
    List<Account> acctList = new List<Account>();
    acctList.add(new Account());//error required field name 
    acctList.add(new Account(Name='Acme3',Phone ='12345'));//sucessfully inserted

	// DML statement
	Database.SaveResult[] srList = Database.insert(acctList, false);

	// Iterate through each returned result
	for (Database.SaveResult sr : srList) {
    	if (sr.isSuccess()) {
       		 // Operation was successful, so get the ID of the record that was processed
        	System.debug('Successfully inserted account. Account ID: ' + sr.getId());
   		}else {
        // Operation failed, so get all errors                
        for(Database.Error err : sr.getErrors()) {
            System.debug('The following error has occurred.');          
            //REQUIRED_FIELD_MISSING: Required fields are missing: [Name]
            System.debug(err.getStatusCode() + ': ' + err.getMessage());
            //Account fields that affected this error: (Name)
            System.debug('Account fields that affected this error: ' + err.getFields());
        	}
    	}	
  	}
*/
    
    
//-----------------------------------------------INSERT RECORD----Database.insert();-------------------------------------
//
//        
    
}