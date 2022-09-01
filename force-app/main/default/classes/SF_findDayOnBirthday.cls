// Find the Day on your birthday
public class SF_findDayOnBirthday {
public static void findDayonBirthday(){    
       Datetime birthday = Datetime.newInstance(1996, 07,02);
     //For format of day
        String  DOBday= birthday.format('EEEE');
     //For printing day on your birthday 
        system.debug('Day on Birth Day is : '+DOBday);
    }   
}