//Sort all the elements
public class SF_SortAllElementFromArray {
Integer[] inputArray = new Integer[] {12, 45, 1, 5, 0, 4, 3, 56, 27}; 
Integer arraySize = inputArray.size();//to get size of array//8

//@Method:Sort all the elements from Array 
public  void sortAllElement(integer[] inputArray)
 {
  for (Integer i = 0; i < arraySize; i++)   //arraySize-1 or//i=1
    {   System.debug('UNSorted Array =>'+inputArray[i]); 
        
      for (Integer j = i + 1; j < arraySize; j++)   
       {  
        Integer temp = 0;  
        if (inputArray[i] > inputArray[j])   //[i]<[j]--DESC
            {  
                temp = inputArray[i];  
                inputArray[i] = inputArray[j];  
                inputArray[j] = temp;  
            }  
		}  
    }
     System.debug('Sorted element of Array in ASC=>'+inputArray); 
  } 
 //-------------------------------------------------------------------------------------------------------------------   
 //@Method:Sort of List element using sort();  
  public static void SortListElement()
    {
// Declaration of colour list
		 List<String> colors = new List<String>{ 'Black', 'Red','White','Blue'}; 
// Return given list
          system.debug('orignal colors'+colors);
// Use sort() for sorting of colour list
         colors.sort();
// Return sorted list
        system.debug('After Sort colors'+colors);
    } 
    
/*
Integer[] inputArray = new Integer[] {12, 45, 1, 5, 0, 4, 3, 56, 27};
//0/1/3/4/5/12/27/45/56/
SF_SortAllElementFromArray max = new SF_SortAllElementFromArray();
max.sortAllElement(inputArray);
*/
  
}