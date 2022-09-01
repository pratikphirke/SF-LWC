public virtual class SF_Employe {
//virtual keyword used parent class to extend functionality into base class     
    public  void EmployeeDetails(Integer EmpId,String EmpName, String EmpSalary){
         	system.debug('------------Employee Details :-----------');
            system.debug('Employee id     :=> '+EmpId);
            system.debug('Employee Name   :=> '+EmpName);
            system.debug('Employee Salary :=> '+EmpSalary);
        }
}