//Find the Maximum From Array
public class SF_MaximumFromArray {
//Declaring array
    Integer[] inputArray = new Integer[] {1,2,3,4,5,6};
        
//method for Find the Maximum From Array
 public static void findMaxElement( Integer[] inputArray){
    
     integer arraySize = inputArray.size();//to get size of array
     integer MaxElement =inputArray[0]; 
 
     //Comparing with each element and find maximum element    
        for (integer i = 0; i < arraySize; i++)    
          {   
          	if(MaxElement<inputArray[i])
            {
                MaxElement=inputArray[i];
            }
          }   
         System.debug('Max element of Array=>'+MaxElement);   
    }
}
/*
Integer[] inputArray = new Integer[] {1,2,3,4,5,6};
MaximumFromArray.findMaxElement(inputArray);
*/