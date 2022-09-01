public class AsssignmentComplaintHandler 
{
    public static void update_ResponseDate(List<Complaint__c> NewList) //,Map<Id,Complaint__c>oldMap
    {
        try{
             BusinessHours defaultBH = [SELECT Id,Name FROM BusinessHours 
                                        WHERE Name='Complaints businessHrs' AND IsActive = true Limit 1];
			System.debug('BusinessHours==>  '+defaultBH);
   			
        if(defaultBH != NULL){
            for(Complaint__c com : NewList ){
                  System.debug('Complaint__c  ' +com );
               	if(com != NULL)//&& oldMap.get(com.Id).Response_Date__c != NULL && com.CreatedDate !=NULL
                {
                    if(com.Priority__c =='Critical')
                        {  
                        
                            Integer slaHours = 6;
                         com.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);
                             System.debug('Critical  ' + com.Response_Date__c );
                            
                        } else if(com.Priority__c =='High')
                        {
                            //com.Response_Date__c = com.CreatedDate +(48/24);
                             Integer slaHours = 48;
                            com.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);
                             System.debug('High  ' + com.Response_Date__c );
                            
                        } else if(com.Priority__c =='Medium')
                        {
                           
                            //com.Response_Date__c = com.CreatedDate +(120/24);
                            Integer slaHours = 120;
                            com.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);
                              System.debug('Medium  ' + com.Response_Date__c );
                            
                        }   else if(com.Priority__c =='Low')
                        {
                           
                           // com.Response_Date__c = com.CreatedDate +(240/24);
                             Integer slaHours = 240;
                            com.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);
                              System.debug('Low  ' + com.Response_Date__c );
                        }    
               		 }  
        		}    
   			 }	 
                
    		 }catch(Exception e){
           		 System.debug('updateResponseDate- EXCEPTION  ' + e.getMessage());   
        	}
    }
    //------------------------------------------------------------------------------------------------------------------------------------
   
    public static void insert_ResponseDate(List<Complaint__c> NewList) 
    {
        try{
             BusinessHours defaultBH = [SELECT Id,Name FROM BusinessHours 
                                        WHERE Name='Complaints businessHrs' AND IsActive = true Limit 1];
			System.debug('BusinessHours==>  '+defaultBH);
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
                            System.debug('Critical  ' +  cobj.Response_Date__c );
								
                            
                        } else if(com.Priority__c =='High')
                        {
                            //com.Response_Date__c = com.CreatedDate +(48/24);
                             Integer slaHours = 48;
                            cobj.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);
                             System.debug('High  ' + cobj.Response_Date__c );
                            
                        } else if(com.Priority__c =='Medium')
                        {
                           
                            //com.Response_Date__c = com.CreatedDate +(120/24);
                            Integer slaHours = 120;
                            cobj.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);
                              System.debug('Medium  ' + cobj.Response_Date__c );
                            
                        }   else if(com.Priority__c =='Low')
                        {
                           
                           // com.Response_Date__c = com.CreatedDate +(240/24);
                             Integer slaHours = 240;
                            cobj.Response_Date__c = BusinessHours.add(defaultBH.Id,com.CreatedDate, SLAhours* 60 * 60 * 1000L);
                              System.debug('Low  ' + cobj.Response_Date__c );
                          } 
                      		ComList.add(cobj); 
                        }
					}   
                        if(ComList.size()>0)
                        {
                           		update  ComList;
                            	System.debug('Insert ComList '+ComList);
                       }
   						
    
    		 }catch(Exception e){
           		 System.debug('updateResponseDate- EXCEPTION  ' + e.getMessage());   
        	}
    }
    
    

}