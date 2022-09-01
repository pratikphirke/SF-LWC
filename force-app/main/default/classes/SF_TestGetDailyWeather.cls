@isTest
global class SF_TestGetDailyWeather {
     private class RestMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            String fullJson = '{"coord":{"lon":73.8553,"lat":18.5196},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"base":"stations","main":{"temp":311.02,"feels_like":309.64,"temp_min":311.02,"temp_max":311.02,"pressure":1001,"humidity":20,"sea_level":1001,"grnd_level":942},"visibility":10000,"wind":{"speed":7.25,"deg":313,"gust":8.3},"clouds":{"all":100},"dt":1652175766,"sys":{"country":"IN","sunrise":1652142779,"sunset":1652189343},"timezone":19800,"id":1259229,"name":"Pune","cod":200}';
            
            HTTPResponse res = new HTTPResponse();
            res.setHeader('Content-Type', 'text/json');
            res.setBody(fullJson);
            res.setStatusCode(200);
            return res;
        }
     }
@isTest
     public static  void schedulerTest(){
                 String cronexpression ='0 10 15 * * ?' ;
       			Test.setMock(HttpCalloutMock.class, new RestMock());
                Test.startTest();

                String jobId = System.schedule('SF_GetDailyWeatherData',  cronexpression, new SF_GetDailyWeatherData());
                CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
                System.assertEquals(cronexpression, ct.CronExpression);
                System.assertEquals(0, ct.TimesTriggered);
                Test.stopTest();
      }
}