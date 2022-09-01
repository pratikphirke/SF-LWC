/*
 * Question: To check the Series of prime number in range of 5 to 90
             To check Given number is Prime or not?
 * Created Date: Saturday, April 30th 2022, 1:55:05 pm
 * Author: pratikphirke
 * 
 * Copyright (c) 2022 Your Company
 */


public class SF_CheckNumIsPrime {

public static void rangeOfPrimeNo(){
    //To check the Series of prime number in range of 5 to 90
        integer num=90;
         for(Integer k =5; k<=num; k++){
              if(num>0) {
                 SF_CheckNumIsPrime.isPrime(k);
                //System.debug(k+': Number   ');
            }
         }
    }
public static boolean isPrime(Integer n){//n=5
//To check Given number is Prime or not?   
    
      //since i=0 and 1 is not prime return false.
      if(n==1||n==0){
           System.debug(n+': Number is Not Prime  ');
              return false;
          }
       
      //Run a loop from 2 to square root of n=25--->i=1 and 2 is not prime so i=2
      for(integer i=2; i<n; i++){//i*i<=n;
        // if the number is divisible by i, then n is not a prime number.
          if(Math.mod(n,i)==0){
           System.debug(n+': Number is Not Prime  ');
              return false;
          }
            
      }
      //otherwise, n is prime number.
    	System.debug(n+': Number is  Prime  ');
      return true;
    }
}