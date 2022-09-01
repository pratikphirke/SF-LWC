public class SF_PrintFibonacciSeries {
public static void DisplayFibonacciSeries(){
        try {
            Integer n = 10, n1 = 0, n2 = 1;
            System.debug('Fibonacci Series till => ' + n +'th terms');
            
                for (Integer i = 1; i <= n; ++i) {//    while (n1 <= n)
                    System.debug('Fibonacci Number  ' + n1 );
                 
                  Integer temp = n1 + n2;
                  n1 = n2;
                  n2 = temp;
                }
             
        } catch (Exception e) {
           System.debug('Exception Occure => ' +e);
       }
    }
}