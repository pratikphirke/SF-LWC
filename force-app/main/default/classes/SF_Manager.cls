public class SF_Manager extends SF_Employe {
    
    public  void ManagerDetails(){
        Super.EmployeeDetails(101,'Pratik Phirke','4.5 LPA');
        Integer id=205;
        String Name='Akshay D';
        String Department='SF/RF';
        String Salary='12 LPA';
            
        system.debug('------------Manager  Details :-----------');
 		system.debug('Manager Id 		 :=> '+id);
        system.debug('Manager Name	 	 :=> '+Name);
        system.debug('Manager Department :=> '+Department);
        system.debug('Manager Salary 	 :=> '+Salary);
    }
}
//SF_Manager m = new SF_Manager();
//m.ManagerDetails();