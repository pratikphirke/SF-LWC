public class SF_SortMulticolumnRelationObject {
    public static void multiColSort()
    {
//Sort all the elements  with multicolumn sort when it is is in parent child relationship
        
        list<Account> acclist=new List<Account>();
   		 acclist=[SELECT Name,(SELECT Name FROM Contacts) FROM Account ORDER BY Name DESC] ;
              
        if(!acclist.isEmpty()){
           for(Account acc: acclist)
           {
           		for(Contact con:acc.Contacts)
                     {
                        System.debug('ACCOUNT NAME => '+ acc.Name + ' / '+ 'Contact Name=> ' +con.Name);
                     }
               
       	   }   
        }
//Sort all the elements  with multicolumn sort when it is is in  child-parent relationship        
     /*   List<Contact> conlist =[SELECT Name,Account.Name FROM Contact  ORDER BY Name ASC, Account.Name DESC ];
       if(!conlist.isEmpty()){
           for(Contact con: conlist )
           {
               System.debug('ACCOUNT NAME => '+  con.Account.Name + ' / '+ 'Contact Name=> ' +con.Name);

       	   } 
       }*/
	}
}