trigger AutoRecordApproval on Project__c(after insert,after update) {

if(Trigger.isAfter)
     {
		if(Trigger.isInsert || Trigger.isUpdate)
            {   
   			 try{
                 for(Project__c proj : Trigger.new)
    			{
                    System.debug('New Project Record   =>  '+proj);
                    if(proj!= Null)//proj.User__c !='' && proj.Project_Amount__c > 200
                        {
                            Id objectId = proj.Id;
                            
                            Approval.ProcessSubmitRequest processrequest = new Approval.ProcessSubmitRequest();            
                            processrequest.setObjectId(objectId);
                            processrequest.setComments('Approved');
                           // processrequest.setSubmitterId(proj.CreatedById);
                            System.debug('processrequest   =>  '+processrequest);
                            //--------------------------------------------------------------------------------------
                            Approval.ProcessResult result = Approval.process(processrequest);
                          	System.debug('result   =>  '+result);
                            Boolean isSuccess = result.isSuccess();
                              System.debug('result   =>  '+isSuccess);
                        }
    				}
                

    		 }catch(Exception e){
           		 System.debug('Error-' + e.getMessage());   
        	}
    	}    
	}
    
} 
    
    
    /*


|New Project Record   =>  Project__c:{Id=a065g000008TMNhAAO, OwnerId=0055g0000046XRNAA2, IsDeleted=false, Name=test2 auto, CreatedDate=2021-04-25 10:12:43, CreatedById=0055g0000046XRNAA2, LastModifiedDate=2021-04-25 10:25:34, LastModifiedById=0055g0000046XRNAA2, SystemModstamp=2021-04-25 10:25:34, LastActivityDate=null, LastViewedDate=null, LastReferencedDate=null, Priority__c=High, Show_Image__c=true, display_img__c=_IM1_/servlet/servlet.FileDownload?file=0155g0000005F5L_IM2_Checked_IM3__45_IM
processrequest   =>  Approval.ProcessSubmitRequest[getObjectId=a065g000008TMNhAAO;getProcessDefinitionNameOrId=null;getSkipEntryCriteria=null;getSubmitterId=null;]
result   =>  Approval.ProcessResult[getActorIds=null;getEntityId=a065g000008TMNhAAO;getErrors=null;getInstanceId=04g5g0000004UucAAE;getInstanceStatus=Approved;getNewWorkitemIds=();isSuccess=true;]
|result   =>  true
*/
    
    
   
               /*   public static  void approveRecord(Project__c opp)
                     {
                             //Class used for Approving Record
                             Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
                             req.setComments('Approving request for Project__c');
                             
                             //Approve or Reject Record
                             req.setAction('Approve');
                             
                             //Getting Work Item Id
                             ProcessInstanceWorkitem pItem = [Select Id from ProcessInstanceWorkitem 
                             where ProcessInstance.TargetObjectId =: opp.id];
                            
                             req.setWorkitemId(pItem.Id);
                             // Submit the request for approval
                             Approval.ProcessResult result = Approval.process(req);
                     
                     }  */