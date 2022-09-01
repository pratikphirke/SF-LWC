public class ApexAssignments {

public static void getDetails(){
   	List<Case > caseList =[select id, CaseNumber, Contact.lastname, Account.Name from Case LIMIT 10];
        	for(Case Ca :caseList){
            	 if(Ca != null) {
					     System.debug('CASE==>'+Ca +'CONTACT'+ca.Contact.lastname +'ACCOUNT'+ca.Account.Name);
           		 }
      	 	 }
/*      Set<Id> Userid = new Set<Id>();
       List<String> userName = new List<String>(); 

      	List<Position__c > posList =[SELECT Hiring_Manager__c,Name FROM Position__c WHERE  Hiring_Manager__c != null];
        	for(Position__c pos :posList){
            	 if(pos != null) {
					Userid.add(pos.Hiring_Manager__c);               
           		 }
      	 	 }
        List<User>  usr = [SELECT Name FROM User WHERE Id IN:Userid ];
           for(User u : usr){
                    System.debug('User==>'+u);
						userName.add(u.Name);
      			  }
    
  
     Map<id,Position__c> posMap= new Map<id,Position__c>([SELECT Hiring_Manager__c,Name FROM Position__c WHERE  Hiring_Manager__c != null AND Hiring_Manager__c IN =:usersList]); 
        for (ID idKey : posMap.keyset()) {
            Position__c p = posMap.get(idKey);
        		 System.debug('Position ==>'+p.Name + 'Hiring Manager' +User.name);
            	
        }  */  
    
	}
}