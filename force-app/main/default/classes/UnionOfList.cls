public class UnionOfList {

    public Static void Union()
    {
        List<integer> list1=new List<Integer>{1,2,3,4};
        List<integer> list2=new List<Integer>{15,6,4};
	SET<integer> unionOfset =new SET<Integer>();
        integer flag=0;
        
        for(integer j=0;j<list2.size();j++)
        {
            for(integer i=0;i<list1.size();i++)
            {
            if(list2[j]==list1[i])
                {
                    flag=1;
                }else{
                    list1[i]=list2[j];
                    unionOfset.add(list1[i]);
                }
            }
        if(flag==0)
        system.debug('union of list'+unionOfset);
        }
 
      /* List<integer> list1 =new List<Integer>{1,2,3,4};
	   List<integer> list2 =new List<Integer>{15,6,2,4};
       List<integer> unionOfList =new List<Integer>();
        Integer sizeList1 = list1.size();
        
        
       // List<Object> uniques = new List<Object>();
        //Set<Object> keys = new Set<Object>(); 
        if(list1 != null && list1.size() > 0){
            for(Integer l2 : list2)
            {
                for(Integer l1 : list1)
        		{
                    if(list2.contains(l1)){
                        continue;
                    } else {
                        unionOfList.add(l1);
                    }
           		 }
            }
             system.debug('Union Of List'+unionOfList);
        }
       // return unionOfList;
        */
		/*for(integer i=0;i<list2.size();i++)
        {
              if(list2[i].contains(list1))
                {
               	  list1[sizeList1]= list2[i];
                  
                   unionOfList.add(list1[i]);
                }
		}*/
        /*for(Integer k=0 ;k < unionOfList.size(); k++)
                {
                   System.debug('Union Of List'+unionOfList[k]);
                }*/
           // system.debug('Union Of List'+unionOfList);
    }
}