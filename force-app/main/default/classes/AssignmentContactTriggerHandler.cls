public class AssignmentContactTriggerHandler {
    //q8
   public static void contactCreateWithRelation(List<Contact> newList)
           { 
               try{
                    list<Contact_Relationship__c> conRelList= new list<Contact_Relationship__c>();
                     System.debug('conRelList ==>  '+conRelList);
                   
                    for(Contact con : newList)    
                     {    
                         System.debug(' New Record List ==>  '+newList);

                         if(con.Contact_Relationship__c == true)    
                         {    
                             Contact_Relationship__c conRel = new Contact_Relationship__c();  
                             
                             conRel.Name = con.Lastname;    
                             conRel.Contact__c= con.id;  
                             
                             conRelList.add(conRel);    
                         }   
                     }   
                   if(conRelList.size()>0){
						insert conRelList;
                   		System.debug('After Insert  ==>  '+conRelList);                         
                     }


               } catch(Exception e){
                   System.debug('contactCreateWithRelation Exception'+e.getMessage());
                  
               }
           } 
 //-----------------------------------------------------------------------------------------------------------------------------------------------
 
     public static void CountOfContacts(List<Contact> newlist,List<Contact> oldlist)
           { //Q9 When we add the Contacts for that Account then count will populate in the field Count of Contacts
          		 try{
                    // System.debug('newlist    '+ newlist); 
                     // System.debug(' oldlist   '+ oldlist); 
                    list<contact> listcon = new list<contact>();                  
                    list<account>listacc = new list<account>();
               
                     set<id> accid = new set<id>();
                   //  System.debug('Set AccountID'+ accid); 
                     if(trigger.isinsert){
                             for(contact con : newlist) //trigger.isInsert con --New record
                                {
                                     accid.add(con.accountid);
                                }    
                     }     
                     
  					if(trigger.isdelete){
                            for(contact con: oldlist)  //trigger.isdelete  con--Old record
                            {
                                 accid.add(con.accountid);
                            }
                       }
                    
                    list<account> acclist = new list<account>( [SELECT Id,Name FROM Account WHERE Id IN :accid]);  
                         //System.debug('Account Result=> '+ acclist); 
                     
                    list<contact> contactlist = new list<contact>([SELECT Id,Name,AccountId FROM Contact WHERE AccountId IN :accid]);
                    	// System.debug('contact Result=> '+ contactlist); 
                     
                     map<id,integer>mapCount=new map<id,integer>();
                     //System.debug('mapCount => '+ mapCount); 
                          
                    for(Account acc : acclist){
                    	listcon.clear();
                        
                    for(Contact c : contactlist){
                   		 if(c.accountid == acc.id){
                    		listcon.add(c);
                    
                  		  mapCount.put(c.accountid,listcon.size());//<AccountId,NumberOfContact>
                   		 }
                       }
                    }
                     //System.debug('Contact Avilable List => '+ listcon);
                     
                    if(acclist.size()>0){
                    
                        for(Account a:acclist)
                        {
                            if(mapCount.get(a.id)==null)
                            {
                            	a.Count_of_Contacts__c = 0; //if Number of contacts=  0 
                            }else{
                    			a.Count_of_Contacts__c = mapCount.get(a.id);
                    			listacc.add(a);            
                            }
                    
	                    }
                    }   
                    if(listacc.size()>0)
                    {
                    	update listacc;    
                    }
                                                     
               } catch(Exception e){
                   //System.debug('CountOfContacts Exception'+e);
                  
               }
           }
    
}