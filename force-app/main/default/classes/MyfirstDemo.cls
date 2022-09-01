public class MyfirstDemo {
    
    public static final String str;	//final makes constant to var
    public static final  Integer x;			// static final var changed  in static {--} block
    private static Integer count=10; 		// static variable: sharing a copy of value by all the instances
    private  Integer num=20; 
    static
    {
         x = calculate();
         System.debug('Static Block Executed  X=>'+x);//11
         str = change();
         System.debug('Static Block FIANL str=>'+str);//abc
         
    }
   
	public static Integer calculate() {      
       return 5+6 ;
   }
	public static string change() {
       string ch ='abc';
       return ch;
   }
    public void setcount(Integer val) {
       count = val;
   }
    
    public void setnum(Integer val) {
       num = val;  
    }
	
     public void printAll() {
       system.debug('Value Count Var=> '+count);			//10 //setcount=50
       system.debug('Value Num Var=>  '+num);				//20 //setnum=60
     //  system.debug('Value Num Var=>  '+num);				//20
    }
    
   /* MyfirstDemo d = new MyfirstDemo();
    d.setcount(50);
    d.setnum(60);
    d.printAll();
    MyfirstDemo d1 = new MyfirstDemo();
    d1.printAll();*/
 /*   
    //--------------------------------Final-----------------------------------
    // Final keyword is used to define constants
    // variable can only be assigned once when we declared as final
    // This keyword is used to Defines constants and methods that can’t be overridden.
 

    
   // ---------------------------------Static-------------------------------------
    //: Using static to prevent triggers from running twice
    //To store information that is shared across instances of a class, use a static variable.
    //Apex classes= can’t be static
    // static methods =? only have access to its provided inputs and other static (global) variables.
    // static methods = initialized only when a class is loaded.
    // It cannot access instance member variable values of it's class
   //static variable=? its value is shared across your entire org
   //static variables to store data that is shared within the class.
   // static variable= associated with the block of code in which they’re declared.
   // static variable= "sharing a copy of value by all the instances"
   // Static variables are not memory constants.
    //used for variables being used as a counter ex total number of accounts
    //The static variable resets after a transaction is finished
    
  */       	
    
 /*    public static final Integer a = 500;
 
    public MyfirstDemo()
    {
        x=a;
      system.debug('Final Value changed in constructor=>'+x );
    }
  -----------------------------------------------------------------------------------------------
    public void DowhileLoopDemo(){
        Integer i =1;
        do{
            System.debug('Data=>'+i);
            ++i;
        }while(i<=10);
    }
     public void whileLoopDemo(){
        Integer i =1;
        while(i<10){
            System.debug('Count =>'+i);
           i++;
        }
    }
    
*/
    /*
       Integer red;
        Integer green;
        Integer blue;
 
        MyfirstDemo(Integer red, Integer green, Integer blue) {
            this.red = red;
            this.green = green;
            this.blue = blue;
        }
    static Map<String, MyfirstDemo> colorMap = new Map<String, MyfirstDemo>();
 
    static {
        colorMap.put('red', new MyfirstDemo(255, 0, 0));
        colorMap.put('cyan', new MyfirstDemo(0, 255, 255));
        colorMap.put('magenta', new MyfirstDemo(255, 0, 255));
    }
    
*/
/*	public void CollectionForLoop()
    { 
        List<Integer> numlist = new List<Integer>();
       
        for(Integer i=0; i<10; i++){ // For Loop Tradition 
		//	System.debug('Tradition For Loop'+i);
            numlist.add(i);
        }     
        System.debug('List==>'+numlist);

        for(Integer el :numlist) // For each Loop 
        {
            System.debug('Collection For Loop==>'+el);
        }
        //System.debug('List Size==>'+el);
        
        
		List<Account> acclist = [SELECT Id,Name FROM Account LIMIT 10];//SOQL FOR LOOP 
        //new List<Account>();        
        Integer listsize = acclist.size();
        for(Account acc: acclist){
            System.debug('ACCOUNT NAME =>'+ acc.Name +'ACCOUNT ID =>'+ acc.Id);
        }
        for(Integer i=0; i<listsize; i++)
        {
            Account acc= acclist.get(i);
            System.debug('Tradition Loop Account NAME===>'+acc.Name);
        }
    }    
  */  
    
    /*public integer addt(integer a, integer b)
    {
      integer  add =a+b;
        
        system.debug('Result=> '+add);
        return add;
        
        //firstDemo mf = new MyfirstDemo();
			//.addt(2,5);
		
    }  
    public String addt(string a, string b)
    {
        String c=a+b; 
        system.debug('Result=> '+c);
        return c;
    }  
    */

 }