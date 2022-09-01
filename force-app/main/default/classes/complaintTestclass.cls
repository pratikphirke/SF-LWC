@isTest
public class complaintTestclass {//100* code coverage --trigger-->SetDateOnPrority(Active)
@isTest
	Static void Meth(){
		Test.StartTest();
		
		Complaint__c com = new Complaint__c();
		com.Name = 'Test Record1';
        com.Priority__c = 'Low';
		//Include all the required fields values.
		insert com;
	
		
		com.Priority__c = 'High';
		update com;
		
		Test.StopTest();
		
	}

}