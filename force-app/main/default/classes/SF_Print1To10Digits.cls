public class SF_Print1To10Digits {
public static Void DisplaySeries(){
        try {
             //-----------------Using For Loop
           for(Integer n=1;n<=10;n++){
            	system.debug('1 To 10 Series :'+n);
            }
            //----------------------DO--While Loop
          	Integer i =1;
              do{
                 System.debug('1 To 10 Series=>'+i);
                    ++i;
                }while(i<=10);
             //------------------------While Loop
               while(i<=10){
                System.debug('1 To 10 Series=>'+i);
                   i++;
               }
             //------------------------For Each
            List<Integer> numlist = new List<Integer>{1,2,3,4,5,6,7,8,9,10};
            for(Integer n :numlist) {
                   System.debug('1 To 10 Series=>'+n);
                }
        } catch (Exception e) {
           System.debug('Exception Occure => ' +e);
       }
    }
}//SF_Print1To10Digits.DisplaySeries();