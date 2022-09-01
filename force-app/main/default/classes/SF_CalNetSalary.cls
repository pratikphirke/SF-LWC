public class SF_CalNetSalary {
public static void calNetSalAmount(){
        try {
        	 Decimal BasicSal=10000;  //Basic salary
             Decimal DA=(20*100); //Dearness allowance-->2000
               System.debug('DA Amount is :'+DA);
             Decimal HRA=(30*100);//House rent allowance-->3000
               System.debug('HRA Amount is :'+HRA);
            Decimal netSal=(BasicSal + DA + HRA);
            System.debug('Net Salary Amount is :'+netSal);//-->15000
        } catch (Exception e) {
           System.debug('Exception Occure => ' +e);
       }
    }
}//SF_CalNetSalary.calNetSalAmount();