/*
1.	Build solution to show count of number of Attachment (Classic +Lightening) on record detail page
	 (Create custom filed to store count). Count should get updated on the basis of delete /Insert.
Note:

custom obj--Project__c
field name--Count_Attachment__c
create new Project add attachments --count of attached will display on field above
*/

trigger Q1CountAttachment on Attachment (after insert, after update, after delete, after undelete) {
  if(Trigger.isAfter)
  {
     if(Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete ||Trigger.isUndelete)
          {
             Map<Id,List<Attachment>> parent = new Map<Id,List<Attachment>>();
             set<id> attids = new set<id>();
             
           if(Trigger.new!= null){
               for(Attachment c:Trigger.new){
                   Project__c l;
                   if(c.ParentId != null)
                       attids.add(c.parentid);
               }
                   
           }else if(Trigger.old != null){
               for(Attachment c: Trigger.old){
                if(c.ParentId != null)
                       attids.add(Trigger.oldMap.get(c.id).parentid);
               }
           }
   if(attids.size()>0){
       try{
           
           Map<id,Project__c> testmap = new Map<id,Project__c>([select id,Count_Attachment__c from Project__c where id IN: attids]);
           List<Attachment> a = new List<Attachment>([select id,parentid from Attachment where parentid IN:attids]);
     
           
           for(Attachment at: a){
               List<Attachment> llist = new List<Attachment>();
               
               if(parent.get(at.parentid) == null){
                   llist = new List<Attachment>();
                   llist.add(at);
                   parent.put(at.parentid,llist);
                   
               }else if(parent.get(at.parentid) != null){
                   llist = new List<Attachment>();
                   llist = parent.get(at.parentid);
                   llist.add(at);
                   parent.put(at.parentid,llist);
               }
           }
           
           for(Id i: attids){
               if(testmap.get(i) != null && parent.get(i) != null){
                  testmap.get(i).Count_Attachment__c = parent.get(i).size(); 
               
               }else if(testmap.get(i) != null && parent.get(i) == null){
                  testmap.get(i).Count_Attachment__c = 0; 
               }
           }
      
           update testmap.values();
           System.Debug('Update=>  '+testmap.values());
       }catch(Exception e){
           System.debug('Q1CountAttachment Exception  '+e);
       }
    }
    }
  }
    
}