//Find the Second Maximum From Array
public class SF_SecondMaximumFromArray {
//Declaring array
 Integer[] inputArray = new Integer[] {7,4,5,1,2,3};//7.5.4.3.2.1

//Method for Find the Second Maximum From Array       
 public void findSecondMaxElement( Integer[] inputArray){
       integer arraySize = inputArray.size();
    integer nth_MaxElement = 2;
  for (Integer i = 0; i < arraySize; i++)   //arraySize-1 or//i=1
    {  
      for (Integer j = i + 1; j < arraySize; j++)   
       {  
        Integer temp = 0;  
        if (inputArray[i] < inputArray[j])   //[i]>[j]--ASC
            {  
                temp = inputArray[i];  
                inputArray[i] = inputArray[j];  
                inputArray[j] = temp;  
            }  
		}  
        if(i==nth_MaxElement-1){
            System.debug(+ nth_MaxElement +'nd Largest element from array=>'+inputArray[i]); 
        }
    }
 }
}

/*
Integer[] inputArray = new Integer[] {1,2,3,4,5,6};
SF_SecondMaximumFromArray max = new SF_SecondMaximumFromArray();
max.findSecondMaxElement(inputArray);
*/