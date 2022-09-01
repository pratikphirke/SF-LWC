/*
Create the object called “Books” and create the field “Price”(data type is Currency) under this object.
 Whenever we enter some amount of money in the Price field and once we click on save button, 
 the value we entered in the Price field is 10% less than the actual price. 
 This is applicable for while both inserting and updating records.
*/
Trigger SF_DiscountBooksTrigger on Book__c(Before Insert,Before Update) {
 if(Trigger.isBefore){        
        if(Trigger.isInsert || Trigger.isUpdate){          
        try{
             List<Book__c> bookList = new List<Book__c>(); 
                 for(Book__c book : Trigger.New)
                    {
                        book.Price__c *= 0.9;
                         bookList.add(book);
                    }   
                        
             } catch(Exception e){
                     System.debug('SF_DiscountBooksTrigger Exception'  +e);   
             } 
        }
    }
}