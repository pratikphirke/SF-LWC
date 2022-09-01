public class SF_CalPerimeterRectangle {
    public static void calPerimeter(Decimal width,Decimal height){
        try {
          	 Decimal Perimeter=2 * (width + height);//a + b + a + b = 2a + 2b = 2  (a + b) units.
    		System.debug('Perimeter of Rectangle :'+Perimeter);
           
        } catch (Exception e) {
           System.debug('Exception Occure => ' +e);
       }
    }
}
/*
SF_CalPerimeterRectangle.calPerimeter(10.00,5.00);
*/