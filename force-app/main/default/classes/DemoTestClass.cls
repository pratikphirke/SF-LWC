@isTest
public class DemoTestClass {
  
        public enum Weekdays{
				Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday
             }
    
//To define Test  Method      //!st way 
        public static testMethod void  demoPositiveTest(){
        Test.startTest();
            Weekdays holiday = Weekdays.Sunday;
            System.debug('HOLIDAYS==>'+holiday);//HOLIDAYS==>Sunday
        Test.stopTest();    
        }
    
		//2nd Way
    @isTest static void demoNegativeTest(){
        Test.startTest();
            Weekdays holiday = Weekdays.Monday;
            System.debug('HOLIDAYS==>'+holiday);//HOLIDAYS==>Monday
        Test.stopTest();
    }  
}