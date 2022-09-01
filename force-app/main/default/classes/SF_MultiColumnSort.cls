//Sort all the elements  with multicolumn sort
public class SF_MultiColumnSort {
    
public static void multiColSort()
  {  //sort all records from Lead Object with column company as Decending oerder and Lead name in ASC
     List<Lead> listLead = new List<Lead>();
	  listLead = [Select id,company,name from Lead where name != null order by Company DESC,name ASC];
    
    		for(Lead le:listLead)
                {
                     System.debug('Lead List-------->'+' NAME=> '+le.name +' Company=> '+le.company);
  		 		 }
    	}
      
}