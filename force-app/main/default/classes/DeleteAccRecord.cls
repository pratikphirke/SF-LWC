public class DeleteAccRecord 
{
    public void deleteMorethanTenAccount()
    {
        
        list<account> listAccount = new list<account>([SELECT Id FROM Account WHERE CreatedDate = TODAY
                                                        ORDER BY CreatedDate ASC LIMIT 1]);//10
       
        //listToDeleteAccount.add();
        List<account> listToDeleteAccount = new list<account>([SELECT Id FROM Account WHERE CreatedDate = TODAY
                                                               
                                                              AND Id Not IN : listAccount]);

        if(listToDeleteAccount.size() > 0)
            delete listToDeleteAccount;
        
    }

}
/*

string cronExpression2 = '0 15   * ?';
string cronExpression2 = '0 05 * * * ?';
System.schedule('Delete More than Ten Account @ 0 15',
                cronExpression2, new Q2_SchedulerToDeleteRecord());
*/