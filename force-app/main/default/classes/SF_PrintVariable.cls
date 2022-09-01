/*
 * Question: Write a Program to print variables in Apex;
 * Created Date: Saturday, April 30th 2022, 1:55:05 pm
 * Author: pratikphirke
 * 
 * Copyright (c) 2022 Your Company
 */
public class SF_PrintVariable {
    public static void print(){
        String str = 'Salesforce';
        System.debug('String variable:'+str);
        
        Boolean Flag = true;
        System.debug('Boolean variable:'+Flag);
        
        Integer employeid = 101;
        System.debug('Integer variable:'+employeid);
        
        Long longvar = 12300000L;
        System.debug('Long variable:'+longvar);
        
        Double location = 12350500/5000000;
        System.debug('Double variable:'+location);
        
        Decimal dec  = 62/100;
        System.debug('Decimal variable:'+dec);
        
        Date today = Date.today();
        Date Birthday = Date.newInstance(1996, 07, 02);
        System.debug('Date variable today:'+today);
        System.debug('Date variable Birthday:'+Birthday);
        
 		Time  currentT   =  DateTime.now().time();
        System.debug('Time variable Current:'+currentT);
        
        DateTime now = DateTime.now();
        System.debug('DateTime variable Current :'+now);
        
         ID id='00300000003T2PGAA0';
         System.debug('id :'+id);
    }
}