public class SOQLQueryDemo {
    public void display(){
        
   /*
//SOQL Includes, Excludes Operators-->Multi-Select Picklists
     SELECT colors__c,Id,Name FROM ObjectX__c WHERE colors__c EXCLUDES ('yellow','grey')//rest records print
	SELECT colors__c,Id,Name FROM ObjectX__c WHERE colors__c INCLUDES ('pink','black')// contain pink and black colore record print
*/     
        
        
// Standard Object=> Relationship queries: parent(Account)-to-child(Contact)
 /*
    	List<Account> acclist = [SELECT Name, (SELECT FirstName,LastName FROM Contacts) FROM Account
                                 WHERE Name ='Get Cloudy' LIMIT 10 ];
        if(!acclist.isEmpty()){
           for(Account acc: acclist)
           {
           		System.debug('ACCOUNT Contacts'+ acc.Contacts);
                System.debug('ACCOUNT NAME =>'+ acc.Name +'ACCOUNT ID =>'+ acc.Id);
       	   }   
        }
  */     
// Standard Object=> Relationship queries:child(Contact)-to-parent(Account)
    
 /*   	List<Contact> conlist =[SELECT Contact.FirstName, Contact.Account.Name 
                                FROM Contact limit 5];
      
           for(Contact con:  conlist )
           {
           		//System.debug('ACCOUNT Contacts'+ acc.Contacts);
                System.debug('Contact FirstName =>'+ con.FirstName +'Contact ID =>'+ con.Id);
       	   }   
      */         
 // Custome Object=> Relationship queries: parent(Job_Application__c)-to-child(Review__c)       
    /*   String Job_Application_Name='JA-00009';
        
        List<Job_Application__c> jobApplist =[SELECT Name,Number_of_Reviews__c,
                                              (SELECT Candidate__c,Position__c FROM Reviews__r)
                                				FROM Job_Application__c where  Name =:Job_Application_Name];
        if(!jobApplist.isEmpty()){
			for(Job_Application__c job:  jobApplist)
           {
           	   //System.debug('Reviews Candidate =>'+ Job_Application__c.Candidate__c +'Position =>'+ Job_Application__c.Position__c);
               System.debug('Job_Application => Name  '+ job.Name+  ' '+'  Number_of_Reviews  '+ job.Number_of_Reviews__c);   
       	   }            
        }
   
    
     */   
     // Custome Object=> Relationship queries: child(Review__c)-to- parent(Job_Application__c)       
 
        String Job_Application_Name='JA-00009';
        
        List<Review__c> Reviewlist =[SELECT Job_Application__r.Name ,Job_Application__r.Number_of_Reviews__c, 
                                              Candidate__c,Position__c 
											   FROM Review__c 
											    where  Job_Application__r.Name =:Job_Application_Name];
        if(!Reviewlist.isEmpty()){
			for(Review__c rev:  Reviewlist)
           {
           	   //System.debug( );
               System.debug('Job_Application =>'+ rev.Job_Application__c +
                            'Review  => Position  '+ rev.Position__c + 
                            '  Candidate  '+ rev.Candidate__c);   
       	   }            
        }     
        
    }  
        /*
//Standard Object=>Account 
//SELECT Name, COUNT(Id) FROM Account GROUP BY Name HAVING COUNT(Id) > 1
// Integer cnt =[SELECT COUNT() FROM Account WHERE Name LIKE 'Acme%'  GROUP BY Name Having Count(Name)>1];
//System.debug('COunt =>'+cnt);
        

    	List<Account> acclist = [SELECT Id,Name FROM Account WHERE Name LIKE 'Acme%' 
                                AND Potential_Value__c <= 50
                                 ORDER BY BillingPostalCode ASC NULLS LAST LIMIT 10  ];
      
          Integer listsize = acclist.size();
           for(Integer i=0; i<listsize; i++)//traditional for loop
           {
           	 Account acc= acclist.get(i);	
     		System.debug('ACCOUNT NAME =>'+ acc.Name +'ACCOUNT ID =>'+ acc.Id);
       	   }
        

//Custom Object=>Position        

        String loc ='San Francisco, CA'; //dynamic query using variable 
        List<Position__c> poslist = [SELECT Id,Name FROM Position__c WHERE Location__c =:loc 
                                    AND Days_Open__c >= 1  LIMIT 10];
        if(!poslist.isEmpty()){
         for(Position__c pos: poslist){// for each loop
            System.debug('Position NAME =>'+ pos.Name +'Position ID =>'+ pos.Id);
         }   
        }
         
       
    }*/

}
























//SELECT Name FROM Account ORDER BY Name DESC NULLS first limit 5
//SELECT Id, CaseNumber, Account.Id, Account.Name FROM Case ORDER BY Account.Name 
//A subquery can use OFFSET only if the parent query has a LIMIT 1 clause. The following query is a valid use of OFFSET in a subquery
 //SELECT Name n, MAX(Amount) max FROM Opportunity GROUP BY Name//alies max
 //   SELECT LeadSource, COUNT(Name) cnt FROM Lead GROUP BY ROLLUP(LeadSource) 
 // The GROUP BY ROLLUP clause adds subtotals at different levels, aggregating from right to left through the list of grouping columns.
//The order of rollup fields is important. A query that includes three rollup fields returns the following rows for totals:
//SELECT Name, Count(Id) FROM Account GROUP BY Name HAVING Count(Id) > 1
//
//-------------------------------------------------------------------------------------------------------------
//ID field Semi-Join
//SELECT Id, Name FROM Account WHERE Id IN ( SELECT AccountId FROM Opportunity WHERE StageName = 'Closed Lost' ) 
//Reference Field Semi-Join
//SELECT Id FROM Task WHERE WhoId IN ( SELECT Id FROM Contact WHERE MailingCity = 'Twin Falls' ) 
//ID field Anti-Join
//SELECT Id FROM Account WHERE Id NOT IN ( SELECT AccountId FROM Opportunity WHERE IsClosed = false ) 
//Reference Field Anti-Join
//SELECT Id FROM Opportunity WHERE AccountId NOT IN ( SELECT AccountId FROM Contact WHERE LeadSource = 'Web' 
//Multiple Semi-Joins or Anti-Joins
//SELECT Id, Name FROM Account WHERE Id IN ( SELECT AccountId FROM Contact WHERE LastName LIKE 'apple%' ) 
//AND Id IN ( SELECT AccountId FROM Opportunity WHERE isClosed = false )
//Semi-Joins or Anti-Joins Evaluating Relationship Queries
//SELECT Id, (SELECT Id from OpportunityLineItems) FROM Opportunity WHERE Id 
//IN ( SELECT OpportunityId FROM OpportunityLineItem WHERE totalPrice > 10000 )