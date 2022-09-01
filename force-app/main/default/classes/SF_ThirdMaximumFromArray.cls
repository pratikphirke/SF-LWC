//Find the third Maximum From Array
public class SF_ThirdMaximumFromArray {
//Declaring array
 Integer[] inputArray = new Integer[]{11,200,35,4,50,101};//4/11/35/50/101/200
               
    //Method for Find the third Maximum From Arrayy       
 public void findThirdMaxElement( Integer[] inputArray){
    integer arraySize = inputArray.size();
    integer nth_MaxElement = 3;
  for (Integer i = 0; i < arraySize; i++)   //arraySize-1 or//i=1
    {  
         //System.debug('UNSorted array=>'+inputArray); 
      for (Integer j = i + 1; j < arraySize; j++)   
       {  
        Integer temp = 0;  
        if (inputArray[i] > inputArray[j])   //[i]<[j]--DESC
            {  
                temp = inputArray[i];  
                inputArray[i] = inputArray[j];  
                inputArray[j] = temp;  
            }
          // System.debug('Sorted  from array=>'+inputArray); 
		 } 
          if(i==nth_MaxElement)
         	 {
            	System.debug(+ nth_MaxElement +'rd Largest element from array=>'+inputArray[i]); //50
   			 }
        }
    } 
     
}


/*
Integer[] inputArray = new Integer[] {11,200,35,4,50,10};
SF_ThirdMaximumFromArray max = new SF_ThirdMaximumFromArray();
max.findThirdMaxElement(inputArray);
*/