public class SF_ComplaintHelper {
 public static void Update_CalResponseDate(List<Complaint__c> NewList) 
    {
        try{
       BusinessHours defaultBH = [SELECT Id,Name FROM BusinessHours 
                                        WHERE Name='Complaints businessHrs' AND IsActive = true Limit 1];
   			
        if(defaultBH != NULL){
            for(Complaint__c com : NewList ){
                  System.debug('Complaint__c  ' +com );
               	if(com != NULL)
                {
                    if(com.Priority__c =='Critical')
                        {  
                             Integer slaHours = 6;
                            com.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);
 
                        } else if(com.Priority__c =='High')
                        {
                             Integer slaHours = 48;
                            com.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);

                        } else if(com.Priority__c =='Medium')
                        {
                            Integer slaHours = 120;
                            com.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);
                            
                        }   else if(com.Priority__c =='Low')
                        {   
                             Integer slaHours = 240;
                            com.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);
                              System.debug('Low  ' + com.Response_Date__c );
                        }    
               		 }  
        		}    
   			 }	 
                
    		 }catch(Exception e){
           		 System.debug('Update_CalResponseDate- EXCEPTION  ' + e.getMessage());   
        	}
    }
    //------------------------------------------------------------------------------------------------------------------------------------
   
    public static void Insert_CalResponseDate(List<Complaint__c> NewList) 
    {
        try{
             BusinessHours defaultBH = [SELECT Id,Name FROM BusinessHours 
                                        WHERE Name='Complaints businessHrs' AND IsActive = true Limit 1];
			
			 List<Complaint__c> ComList = new List<Complaint__c>();
       if(defaultBH != NULL){
           
           for(Complaint__c com : NewList)
                 {  
                        System.debug('Complaint__c  ' +com );
                      Complaint__c cobj = new Complaint__c(Id = com.Id);
                    if(com.Priority__c =='Critical')
                        {  
       
                            Integer slaHours = 6;
                    		 cobj.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);

                        } else if(com.Priority__c =='High')
                        {
                             Integer slaHours = 48;
                            cobj.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);
                            
                            
                        } else if(com.Priority__c =='Medium')
                        {
                            Integer slaHours = 120;
                            cobj.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);
                              
                        }   else if(com.Priority__c =='Low')
                        {
                             Integer slaHours = 240;
                            cobj.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);
                          } 
                      		ComList.add(cobj); 
                        }
					}   
                        if(ComList.size()>0)
                        {
                           		UPDATE  ComList;
                            	System.debug('Insert ComList '+ComList);
                       }
   						
    
    		 }catch(Exception e){
           		 System.debug('Insert_CalResponseDate- EXCEPTION  ' + e.getMessage());   
        	}
    }
    
}