//Find the Saturdays and Sundays in Current Month
public class SF_FindSatAndSunInMonth {
      
 public static void  countWeekendDays(Integer Year,Integer Month) {
 //used to get days in month of specific year
    Integer dayInMonth = Date.daysInMonth(Year, Month);
//used to cal total sat and sun days in month
    Integer CountofWeekend = 0;
    
    for(Integer i=1;i<=dayInMonth ;i++)
    {
        Date myDate = date.newInstance(Year, Month, i);//Initialised date object
        Datetime dt = (DateTime)myDate;//typecast date into datetime
        String  weekends = dt.format('EEEE');
        if(weekends == 'Sunday' || weekends=='Saturday')
        {
            CountofWeekend = CountofWeekend + 1;  //count if found day is sat/sunday
        }
    }
      System.debug('Saturdays and Sundays in Current Month=> '+ CountofWeekend+'  Days');
 }
}
/*
SF_FindSatAndSunInMonth.countWeekendDays(2022,03);
*/