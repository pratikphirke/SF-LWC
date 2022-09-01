public class SF_CalSimpleInterest {
public static void calInterestAmount(Decimal P,Decimal R, Integer T){
        try {
   			 Decimal Simple_Intrest =((P*R*T)/100);		//((principal*InterestRate*Timeofyears)/100);
        	System.debug('Simple Interest :' +Simple_Intrest);
        } catch (Exception e) {
           System.debug('Exception Occure => ' +e);
       }
    }
}
/*
SF_CalSimpleInterest.calInterestAmount(10000,12,1);
*/