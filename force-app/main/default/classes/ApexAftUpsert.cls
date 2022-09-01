public class ApexAftUpsert {

    //created after insert and update trigger
    public static void updateOncontact()
    {
       //create list of contacts of related account
       
       List<Contact> lstcontacts=new List<Contact>([select Id,FirstName,LastName,AccountId 
                                                    from Contact where AccountId In:Trigger.new]);
        System.debug('COntact List==> '+lstcontacts);
      //once website is updated getting that id
        Map<Id,Account> mapAccountIdAccount=new Map<Id,Account>([select id,website from account where id in : trigger.new]);
          System.debug('mapAccountIdAccount List==> '+ mapAccountIdAccount);
        
        //list to add 
        List<Contact> lstContUpdate=new List<Contact>();
        
      
        
        for(Contact obj:lstcontacts)
        {
            		//getting account id to update website
            		Account objAccount = mapAccountIdAccount.get(obj.AccountId);
            System.debug('objAccount ==> '+ objAccount);
            		if(obj.FirstName!=null)
                    {
            		String strfirstname = obj.FirstName.subString(0,1); //yPokharkar
            		obj.Profile__c = objAccount.Website+'/'+ strfirstname + obj.LastName;//www.assignmenttest.com/yPokharkar
            		lstContUpdate.add(obj);
                    }
        }
        
        if(lstContUpdate.size()>0)
        {
            upsert lstContUpdate;
        }
           System.debug('lstContUpdate List==> '+ lstContUpdate);
    }
//new account is created if id is not match
//if id match then update website account automatically update in related contact
}