//account name= vyom update with labs
trigger updateAccName on Account (before insert, before update){
    
   if(Trigger.isBefore)
     {
        if(Trigger.isInsert || Trigger.isUpdate)
            {   

         try {   
                list<account> liacc = new list<account>();
             
                for(Account thisAccount :trigger.new){
                    String accName = 'Labs';
                    thisAccount.name = thisAccount.name + accName;
                    liacc.add(thisAccount);
                }
                 //  update liacc;

             System.debug('ACCOUNT  update accounts ==>  '+liacc);
           } catch (Exception e) {
                    System.debug('Exception is: ' + e);
          }  
       }
     }
 
}