public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];
        System.debug('Account Name : Annual Revenue');
        for (Account acc : accountsList){
            String fullname =  acc.Name + ' : ' + acc.AnnualRevenue;
            system.debug(fullname);
        }
    }
}