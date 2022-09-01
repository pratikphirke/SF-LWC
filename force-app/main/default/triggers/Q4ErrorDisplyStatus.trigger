/*
 //Q.1)Create a checkbox on contact object and Write a trigger to check that checkbox whenever a new contact is created.
//Q.3)Write a trigger to delete all the related contacts whenever associated account is delete
 ---------------------------------------------------------------------------------------------------------
//Q.4)Write a trigger on contact to show an
error if status changes from new to closed and record should get 
saved if status changes from New to Open or Open to closed.
   (Note Take three status value (New,Open,Closed)).

*/

trigger Q4ErrorDisplyStatus on Contact(Before insert,Before Update,After delete)
   {    
    if(Trigger.isBefore)
    { //status new ->closed--show error
        if(Trigger.isInsert || Trigger.isUpdate)
        {  //Q1---------------------------------------------------------------------
            Q4ErrorDisplyStatushandler.checkConCreated(Trigger.new);
            //Q4--------------------------------------------------------------------
            Q4ErrorDisplyStatushandler.checkStatusChange(Trigger.new,Trigger.oldMap);
        }  
    } else if(Trigger.isAfter)
    {
       if(Trigger.isDelete)
        {//Q3---------------------------------------------------------------------------
           Q4ErrorDisplyStatushandler.deleteAllConRealtedAcc(Trigger.old);
        }
    }       
  }