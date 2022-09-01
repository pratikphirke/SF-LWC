public class SF_CheckNumIsPalindrome {
public static void Check(){
        try {
               Integer rem,temp,sum=0,n=450;
         		 temp=n;
            
                  while(n>0){    
                       rem=Math.mod(n, 10); //n%10;  //reminder
                       sum=(sum*10)+rem;    //reverse number
                       n=n/10;    //skip last digit
                  }  
                 if(temp==sum) {
                      System.debug('Number '+temp+':=>is Palindrome');
                  }else{
                        System.debug('Number '+temp+':=>is NOT Palindrome');
             }
        } catch (Exception e) {
           System.debug('Exception Occure => ' +e);
       }
    }
    
    
    
    
    
    
   /* public static void CheckString(){
        /*String str = 'Wow';
        String revStr = str.reverse();
        if (str== revStr ) 
        {  system.debug('String is Palindrom :'+revStr ); 
        }else 
        { 
        system.debug('String is not Palindrom :'+revStr ); 
        }

        //-----------Withought function
            String temp= 'Wow';
            integer stringLength=0;
            stringLength=temp.Length();
            string revString='';
        for (Integer i=temp.Length()-1;i>=0;i--) {
            system.debug('Place of char' + I + '---'+ (i+1));
            revString = revString+ temp.substring(i,i+1) ;
            system.debug(revString);
        }
        if (temp == revString) {
            system.debug('String is Palindrom :'+revString);
        }else {
            system.debug('String is not Palindrom :'+revString);
        }
    }*/
}//SF_CheckNumIsPalindrome.Check();