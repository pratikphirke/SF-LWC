public class demo {
    
	public Virtual  class Parent {
        public void parentMethod()
        {
            System.debug('This Is Parent Method');
        }
 	}
     //-2------------------------------------------------   
    //extends->used to get acess of parent class
	public Virtual class Child extends Parent  {
        public void childMethod()
            {
                System.debug('This Is Child Method');
            }
	}

/*
//SOQL Includes, Excludes Operators-->Multi-Select Picklists
     SELECT colors__c,Id,Name FROM ObjectX__c WHERE colors__c EXCLUDES ('yellow','grey')//rest records print
	SELECT colors__c,Id,Name FROM ObjectX__c WHERE colors__c INCLUDES ('pink','black')// contain pink and black colore record print
*/
}