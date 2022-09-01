public class DemoOopsConcept {
 
   //-1------------------------------------Inheritance------------------------------------------   
 	 //Inheritance of 3 class -Parent->child->grandchild
 	 //Apex does not support multiple inheritance.
	//virtual keyword used parent class to extend functionality into base class 
 	public Virtual class Parent {
        public void parentMethod()
        {
            System.debug('This Is Parent Method');
        }
 	}
     //-2-------------------------------------------------------------------------------------------------   
    //extends->used to get acess of parent class
	public Virtual class Child extends Parent  {
    public void childMethod()
        {
            System.debug('This Is Child Method');
        }
	}
    
    //-3-------------------------------------------------------------------------------------------------   
    //extends->used to get acess of child class
	public class GrandChild extends Child {
    public void grandChildMethod()
        {
            System.debug('This Is Grand Child Method');
            super.childMethod();//call child class method using super keyword
        }
	}

              //Inheritance
               // GrandChild gc= new GrandChild();
               // gc.grandChildMethod();
                //gc.childMethod();
               // gc.parentMethod();
   
    
  /* 
       //-1------------------------------------Abstraction------------------------------------------ 
     
   public Abstract class ParentAbstract {
    public void display()
    {
     System.debug('Parent class =>display()');   
    }
         public abstract void getMsg();
     }
     //------------------------------------------------------------------------------- 
     
    public class ChildAbstract extends ParentAbstract {
    public void show()
        {
         System.debug('Child class =>show()');   
        }
         public override void getMsg(){
            String msg='Hello';
           System.debug('child class getMsg() =>'+msg);
         } 
     }
                //Abstract class
              //  ChildAbstract ca =new ChildAbstract();
                //ca.display();
                //ca.show();
                //ca.getMsg();


*/
    
    /*
     * ------------------------------------------------------ Polymorphism----------------------------------------------------
 public class PolymorphismDemo {
//poly=change morph==change one stage to anothe
----------------------------//1.Overloading-extend functionality-same name with diffrent arg---------------------------------

    public void Person(){
        System.debug('A person is Male');
    }
    public void Person(Integer age){
        System.debug('A person as a Child Age=> '+age);
    }
    public void Person(String name){
        this.Person(20);
        System.debug('A person as a Men Name => '+name);
    }
    public void Person(String name,Integer age){
        System.debug('A person as a Parent=>Name '+name+' Age ' +age);
    }    
   }   
            //Polymorphism
            PolymorphismDemo pd = new PolymorphismDemo();
            pd.Person();
            //pd.Person(20);
            pd.Person('Abc');
            pd.Person('Abc',55);

---------------------- //2.Overriding-replace functionality - same name same arg(Virtual and Override)---------------------------
 //  1------------------------------------
public virtual class parentOverride {
    public virtual void display()
    {
        System.debug('patrent override Method');
	}
}
 //  2------------------------------------
public class ChildOverride extends parentOverride {
 public override  void display()
    {
        System.debug('child override Method=>');
	}
}
        //Polymorphism-overriding
        ChildOverride co = new ChildOverride();
        co.display();
        parentOverride po = new parentOverride();
        po.display();
        parentOverride  pc= new parentOverride();   
        pc.display();

    */
    /* 
//-----------------------------------------------------------Interface-----------------------------------------      
    //  1------------------------------------ 
         public Interface  ParentInterface {
            //its implement by ChildOneInterface =>Addition
            ////its implement by ChildTwoInterface=>Substraction
             void cal(Integer a,Integer b);
        }
    //  2------------------------------------

		public class ChildOneInterface implements ParentInterface {
   			 public void cal(Integer a,Integer b){
        			Integer add= a+b;
        			System.debug('Addition =>'+add);
    				}
		}
    // 3 ------------------------------------

		public class ChildTwoInterface implements ParentInterface {

   		 public void cal(Integer a,Integer b){
        Integer sub= a-b;
        System.debug('Substraction =>'+sub);
        	}
		}


        //Interface
        ChildOneInterface ci1= new ChildOneInterface();
        ci1.cal(10,5);
        ChildTwoInterface ci2= new ChildTwoInterface();
        ci2.cal(10,5);
*/
    
    
}