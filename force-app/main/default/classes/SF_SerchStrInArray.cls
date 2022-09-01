//Search given String in array
public class SF_SerchStrInArray {
    
 public static void serchString(){
  String str='Apex';
  String[] inputArray = new String[]{'Admin','visualForce','Apex','LWC','Remedyforce'};
    for(String s:inputArray){
        if(s==str){
            System.debug('String is Founded =>'+s);
        }else{
            System.debug('String is Not Founded =>'+s);
        }       
     }
   }
}