public class SortAllElement
{
    public static void sortElement()
    {
        List<integer> numList= new List<integer>{52, 11, 1, 5, 15};         
        for (integer i = 1; i < numList.size(); i++)
        { 
                integer ele = numList[i];
            //j is initially 0th index
                integer j = i - 1; 
      
                while (j >= 0 && numList[j] > ele) { //bubble
                 // moving the left side element to one position forward.
                    numList[j + 1] = numList[j];
                    j = j - 1; 
                } 
                numList[j + 1] = ele; 
            }
         system.debug('Sorted List => '+numList);
    }
    
     public static void multiColSort()
          {//sort all the elements in multi column sort when its in parent child relationship in apex
              
            list<Account> accList=new List<Account>();
   			 accList=[select Name,(select Name from Contacts)  from Account] ;
    			for(Account acc:accList)
                {
                     for(Contact con:acc.Contacts)
                     {
                        System.debug('acc List-------->'+con.Name);
                     }
  		 		 }
    	}
}