/*
4. Create the object called “Books” and create field “Price”(data type is Currency) under this object.
    Whenever we enter some amount of money in the Price field and once we click on save button,
     the value we entered in the Price field is 10% less than the actual price. 
    This is applicable for both inserting and updating records.
*/
trigger Q4DiscountTrigger on Book__c (before insert,before update) {
 if(Trigger.isBefore){        
        if(Trigger.isInsert || Trigger.isUpdate){          
        try{
             List<Book__c> bookList = new List<Book__c>(); 
                 for(Book__c book : Trigger.New)
                    {
                       // System.debug('book new =>'+ book.Name + 'Price '+ book.Price__c); 
                        book.Price__c *= 0.9;
                         bookList.add(book);
                    }   
                        //System.debug('applyDiscount sucessfully  =>'+ bookList[0].Price__c); 
             } catch(Exception e){
                     System.debug('DiscountTrigger Exception'  +e);   
             } 
        }
    }
}