//Calculate working hours of user/owner for perticular record. :
trigger CalWorkingHrs on demo__c (Before insert,Before update) {
    if(Trigger.isBefore)
     {
		if(Trigger.isInsert || Trigger.isUpdate)
            {   //cal working time According Business Hours
   			 try{
                  BusinessHours defaultBH = [SELECT Id,Name FROM BusinessHours WHERE  IsActive = true Limit 1];
					System.debug('BusinessHours==>  '+defaultBH);
   
        if(defaultBH != NULL){
            for(demo__c demo : trigger.new ){
                if(demo.Close_Date__c != NULL && Trigger.oldMap.get(demo.Id).Close_Date__c != demo.Close_Date__c){
		             decimal result = BusinessHours.diff(defaultBH.Id, demo.Open_Date__c, demo.Close_Date__c );             
                    Decimal resultingHours = result/(60*60*1000);
                   demo.Total_hrs_By_Trigger__c = resultingHours.setScale(1); 
                }  
        }    
    } 
                
    		 }catch(Exception e){
           		 System.debug('CalWorkingHrs- EXCEPTION  ' + e.getMessage());   
        	}
    	}    
	}

}