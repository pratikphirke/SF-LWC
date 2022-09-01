@isTest
public class TestVerifyDate {


    @isTest static void Test_DateWithin30Days() {
        
        Date d =VerifyDate.CheckDates(Date.parse('04/15/2021'),Date.parse('04/20/2021'));
        System.assertEquals(Date.parse('04/15/2021'), d);
    }
    
    @isTest static void Test_DateGreater30Days() {
        
        Date d =VerifyDate.CheckDates(Date.parse('04/15/2021'),Date.parse('05/20/2021'));
        System.assertEquals(Date.parse('04/31/2021'), d);
    }
}