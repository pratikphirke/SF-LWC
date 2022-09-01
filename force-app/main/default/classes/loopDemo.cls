public class loopDemo {
//find the  Maximum Array..
  public static void findLargestNum() 
    {
        Integer[] arr =new List<Integer>{7, 21, 45, 6,34,56,78,26,65,87};
        Integer minvalue = arr[0];
        Integer first = minvalue;
        Integer second = minvalue;
        Integer third = minvalue;
        
//largest ele
        For (integer i =0;i<arr.size();i++)
        {
            
            if( arr[i] > minvalue)
                minvalue = arr[i];             
        }    
 //sec largest       
        for(integer i =0;i<arr.size();i++)
        {
            if(arr[i] > first)
            {
                second = first;
                first = arr[i];
                
            }
            else if(arr[i] > second)
            {
                second = arr[i];
                third = second;
                
            } else if(arr[i] > third) //sec largest   
            {
                third = arr[i];
            }                               
        }
        
        
        
        System.debug(' Largest Number =  ' + first +'\n'+
                     +' Second Largest Number =  '  + second +'\n'+
                    +' Third Largest Number =  '  + third);
    }
}