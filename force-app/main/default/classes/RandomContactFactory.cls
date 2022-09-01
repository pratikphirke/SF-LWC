//@isTest
public class RandomContactFactory {
  //  @isTest
    public static List<Contact> generateRandomContacts(Integer num,String LastName){
        List<Contact> conList = new List<Contact>();
        for(Integer i=1; i<=num;i++){
            Contact con = new Contact(FirstName='Test'+i,LastName=lastName);
            conList.add(con);
        }
        return conList;
    }
}