public class SF_PrintSumOfDigits {
public static void DisplaySumOfDigits(Integer n){//n=245
        try {
           Integer rem=0,sum=0;
         while(n>0)    
            {    
                rem=Math.mod(n, 10);   //remainder of the number 
                sum=sum+rem;    //sum the remainder of the number
                n=n/10;     //Shift digit-->Divide the number by 10
            }    
           System.debug('SUM of Digits => ' +sum);  
        } catch (Exception e) {
           System.debug('Exception Occure => ' +e);
       }
    }
}