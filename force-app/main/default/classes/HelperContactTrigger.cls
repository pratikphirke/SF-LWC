public class HelperContactTrigger {

  public static List<Contact> sendEmail(List<Contact> Contacts)
    {
     //query on template object
       // EmailTemplate et=[Select id from EmailTemplate where name=:'Sales: New Customer Email'];
        //list of emails
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();   
        string subject='welcoming to Salesforce Platform';
        for(Contact con : Contacts)
        {
            if(con!= null){

                //initiallize messaging method
                Messaging.SingleEmailMessage singleMail = new Messaging.SingleEmailMessage();

                //set object Id
                singleMail.setTargetObjectId(con.Id);

                //set template Id
                //singleMail.setTemplateId(et.Id);
                //------Withought Template ----------------------------------------
                singleMail.setSubject(subject);
                String body = 'Dear ' + con.FirstName + ' ' + con.LastName + ',  \n ';
				body += 'Thank you for considering us  \n We sincerely value the opinion of our customers, and we would love to hear your opinion on our services which would help us improve the same. \n Please take a few minutes to complete the Feedback form by visiting the link given below. \n' ;
				body += 'Here’s the link https://vyomlabs-2f-dev-ed.my.salesforce.com//survey/?email='+con.email+'&fullname='+con.firstname+''+con.lastname+' ';
				body += '\n Best Regards,' ;
                body += '\n '+ 'VyomLabs Team';
                
                singleMail.setPlainTextBody(body);
                singleMail.setSaveAsActivity(false);
                emails.add(singleMail);
            }
        }
            //send mail
          /*  Messaging.SendEmailResult[] results = Messaging.sendEmail(emails);
 
                 if (results[0].success) 
                 {
                     return Contacts;
                   System.debug(‘The email was sent successfully.’);
                 } else {
                     
                   System.debug(‘The email failed to send: ‘ +  results[0].errors[0].message);
                 }*/
       Messaging.sendEmail(emails);
   		 return Contacts;
                  
        
    }
}