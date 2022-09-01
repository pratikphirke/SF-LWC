public class Q2_SchedulerToDeleteRecord implements Schedulable {
      public void execute(SchedulableContext SC) {
             
      DeleteAccRecord acc = new DeleteAccRecord(); 
               acc.deleteMorethanTenAccount();
   }


}