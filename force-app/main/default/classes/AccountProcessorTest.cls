@isTest
public class AccountProcessorTest {
    
    @isTest
    public static void countContactsTest(){
        //Creating an account and inserting it
        Account account = New Account(Name = 'Account Number 1');
        insert account;

        //Creating some contacts related to the account and inserting them
        List<Contact> contacts = new List<Contact>();
        contacts.add(New Contact(lastname = 'Related Contact 1', AccountId = account.Id));
        contacts.add(New Contact(lastname = 'Related Contact 2', AccountId = account.Id));
        contacts.add(New Contact(lastname = 'Related Contact 3', AccountId = account.Id));
        contacts.add(New Contact(lastname = 'Related Contact 4', AccountId = account.Id));
        insert contacts;

        //Creating a List with account Ids to pass them throught the AccountProcessor.countContacts method
        Set<Id> accountIds = new Set<Id>();
        accountIds.add(account.id);

        //Starting Test:
        Test.startTest();

        //Calling the AccountProcessor.countContacts method
        AccountProcessor.countContacts(accountIds);

        //Finishing Test:
        Test.stopTest();
        Account ACC = [SELECT Number_of_Contacts__c FROM Account WHERE id = :account.Id LIMIT 1];
        
        //Setting Assert (We have to parse the account.Number_of_Contacts__c 
        //to integer to avoid some comparasion error between decimal and integer)
        System.assertEquals( Integer.valueOf(ACC.Number_of_Contacts__c) , 4);
    }


}