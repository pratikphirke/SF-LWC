//DML OPerations in Apex Salesforce
public class DemoDMLOperations {
//************Un Delete   ***************
//Undo record from recycle bin using undelete 

 /* List<Position__c> pos = [SELECT Id, Name,Status__c FROM Position__c 
                         WHERE Name = 'spot boy' ALL ROWS]; 
        try {
            undelete pos;
            System.debug('UNDELETE Sucessfull Position=> ' +pos);
        } catch (DmlException e) {
           System.debug('Exception Occure => ' +e);
       }

  */
     
    
//************Delete   ***************
//----Standard Object----Delete Related record from Account Object
 /*
     Account[] acc = [SELECT Id, Name,Phone FROM Account 
                         WHERE Name = 'Test Data']; 
    try {
        delete acc;
        System.debug('DELETE Sucessfull Account=> ' +acc);
    } catch (DmlException e) {
       System.debug('Exception Occure => ' +e);
    }

//----Custome Object----Delete Related record from Position Object
    List<Position__c> pos = [SELECT Id, Name,Status__c FROM Position__c 
                         WHERE Name = 'spot boy']; 
    try {
        delete pos;
        System.debug('DELETE Sucessfull Position=> ' +pos);
    } catch (DmlException e) {
       System.debug('Exception Occure => ' +e);
    }
*/

   //************Merge = Combine Two Records ***************
   //3 records of same object type can merged 
   //lead,contact and Account records can be merged
    
    
    /*
      List<Account> accList = new List<Account>{new Account(name='Acme Inc.'),
    										new Account(name='Acme')};
    	insert accList;
    
        Account masterAcct = [SELECT Id, Name FROM Account WHERE Name = 'Acme Inc.' LIMIT 1];
         Account mergeAcct = [SELECT Id, Name FROM Account WHERE Name = 'Acme' LIMIT 1];
    try {
            merge masterAcct mergeAcct;
           System.debug(' Merge Dml Sucessfull..');
        //remove acme record merge into acme inc. record
    } catch (DmlException e) {
           System.debug('Exception Merge Dml'+e);
    }

	*/
    
    
    
    
    
 //************UPSERT = Insert and Update DML***************
 //Create one record and update other by upsert dml
 /*
	List<Job_Application__c> joblist = new List<Job_Application__c>();
	//insert new record
		Job_Application__c job1 = new Job_Application__c(
    											Cover_Letter__c ='data dummy',
    											Status__c ='New');
	//update existing record
		Job_Application__c job2 = [SELECT Id, Name, Status__c, 
                             Cover_Letter__c, Position__r.Name, Candidate__r.Name
            				 FROM Job_Application__c
                             WHERE Position__r.Name ='DBA'];
        job2.Position__r.Name = 'Sr.UI Designer';
        job2.Status__c = 'New';
        joblist.add(job1);	
        joblist.add(job2);
        try {
               upsert joblist;
       		 system.debug('  Job_Application =>  '+joblist);
        } catch (DmlException e) {
       		 system.debug('  Exception Occured =>  '+e); 
        }			
*/   
 /*//Standard Object Account -->Upsert Dml 
        List<Account> acctList = new List<Account>();
        Account acc1 = new Account( Name='Test Demo3',Phone='1234');
        Account acc2 = [SELECT Id,Name,Phone FROM Account WHERE Name='Test Demo4'];
        acc1.Phone = '251290';
        acctList.add(acc1);
        acctList.add(acc2);
        try {
           
            upsert acctList;
            System.debug('ACCOUNT LIST UPSERT=> '+acctList);
        } catch (DmlException e) {
          System.debug('DML Exception Occured '+e);  
        }
*/   
  
    
//************UPDATE DML***************-->query for fetch existing records
//-->update record using dml update 
   /* 
    Account acc= [SELECT Id,Name,Phone FROM Account WHERE Name ='Test Data2'];
    System.debug('ACCOUNT =>  '+acc);
    acc.Phone='111111';
    update acc;
    Account updateAcc= [SELECT Id,Name,Phone FROM Account WHERE Name ='Test Data2'];
    System.debug('Update Phone= '+updateAcc.Phone+ ' Old phone ='+acc.Phone + ' EQUAL ');    
        
	*/
    
//-->Update related record
/*
		 Contact con = [SELECT Id, FirstName, LastName, 
               Phone, Account.Phone
              FROM Contact 
              WHERE FirstName='Pratik' AND LastName='Firke' 
              AND AccountId!= null ];

		system.debug(' CONTACT =>  '+con);

            con.Phone='8485861797';
            con.Account.Phone='141516';
            update con;
            update con.Account;
        Contact conUpdate = [SELECT Id, FirstName, LastName, 
                       Phone, Account.Phone
                      FROM Contact 
                      WHERE FirstName='Pratik' AND LastName='Firke' 
                      AND AccountId!= null ];
        
        system.debug('UPDATE CONTACT =>  '+conUpdate);
    
*/    
 
//-->Insert record and update field
/*
    Account a = new Account(Name='Acme2');
    insert(a);
    
    Account acc = [SELECT Id, Name, BillingCity FROM Account WHERE Id = :a.Id];
    acc.BillingCity = 'San Francisco'; 

    try {
        update acc;
    } catch (DmlException e) {
       System.debug('Exception occured '+e);
    }
*/
    
 //-->CUSTOME OBJECT 
 //update record from job status= reject and total rating>2 then 
 //update related position min pay =20000 and max pay =35000
   /*  
    List<Job_Application__c> joblist = [SELECT Id, Name, Position__c, Status__c, 
                             Total_Rating__c, Position__r.Name
            				 FROM Job_Application__c
							WHERE Job_Application__c.Status__c='Rejected'
                             AND Total_Rating__c > 2];

    for(Job_Application__c jobApp : joblist ){
        system.debug(' Job_Application =>  '+jobApp);
        jobApp.Status__c='Hired';
            jobApp.Position__r.Max_Pay__c=35000;
            jobApp.Position__r.Min_Pay__c=20000;
            update jobApp;
            update jobApp.Position__r;
    }
       //display updated records
	List<Job_Application__c> Updatejoblist = [SELECT Id, Name, Position__c, Status__c, 
                             Total_Rating__c, Position__r.Name
            				 FROM Job_Application__c];

    for(Job_Application__c ujobApp : Updatejoblist ){
        system.debug(' UPDATE AFter Job_Application =>  '+ujobApp);
    }
    
   */ 
    
    
  
//******INSERT DML******--->Insert Only one Record
//Case 1  	
	/* 	Account acc = new Account(Name='Test Data',Phone='12345');insert acc;
		insert acc;
		System.debug('ACCOUNT CREATED=>'+acc.Id+'Name '+acc.Name); //fetch id after insert new record
  	*/  
//Case 2    
    /*
             Opportunity op = new Opportunity(
            Name='Record opp1',
            CloseDate= Date.today(),
            Amount=1000,
            StageName='Needs Analysis',
            AccountId='0015g00000AFWpJ'
            
        );
		insert op;
		system.debug('INSERT RECORD OPPORTUNITY=> '+op.Name);
	*/
    
//--->Insert records in Bulk using LIST
	/*	List<Account> acclist = new List<Account>(); 
   			 Account acc1 = new Account(Name='Test Data1',Phone='67890');
   			 Account acc2 = new Account(Name='Test Data2',Phone='111213');
            	acclist.add(acc1);
      	     	acclist.add(acc2);
      			 insert acclist;
    		system.debug('INSERT RECORD1=> '+ acclist[0]);
    		system.debug('INSERT RECORD2=> '+ acclist[1]);

	 */  
    
//--->Insert Related Record (Account record create Contact)
	/*
		Account acc = new Account(Name='Test Data3',Phone='141516');
			insert acc;
			system.debug('INSERT Account=> '+ acc.Name);
		Contact con = new Contact(FirstName='Pratik',LastName='Firke',AccountId= acc.Id);
			insert con;
			system.debug('INSERT Contact Realted Account=> '+ con.FirstName +'Account Name'+con.AccountId);
	*/    
}