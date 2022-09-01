//Q.2)Write a trigger to create related contact when an Account is created and associate that contact with that account.
//create acc Name =contact Name
trigger SF_CreateConRelatedAcc on Account(After insert)
{ 
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            List<Contact> conList = new List <Contact>();
            
            for(Account acc : trigger.new)
            {
            
                Contact con = new Contact();
                con.LastName        = acc.name;//required lastname
                con.AccountId       =   acc.id; //associate con with acc
                con.Fax             =   acc.Fax;
                con.MailingStreet   =   acc.BillingStreet;
                con.MailingCity     =   acc.BillingCity;
                con.MailingState    =   acc.BillingState;
                con.MailingPostalCode = acc.BillingPostalCode;
                con.MailingCountry  =   acc.BillingCountry;
                con.Phone           =   acc.Phone;
                conList.add(con);
            }
            if(conList !=Null ){
                insert conList;
            System.debug('conList Is => '+conList);
            }
                 
     }
    }
}