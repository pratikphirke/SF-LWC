public class SF_ConvertCurrencyRates {
public static void USDtoINR(Decimal Amount) {
    
        String url = 'https://api.apilayer.com/currency_data/convert?to=INR&from=USD&amount='+Amount;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
    	req.setHeader('apikey','599fuht5TJQ7IamMGVLLBuPfs9ooMTLZ');
        req.setEndpoint(url);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        
  if(res.getStatus()=='OK' && res.getStatusCode()==200){
     
      JSONParser parser = JSON.createParser(res.getBody());
            while (parser.nextToken() != null) {
                if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                    parser.nextValue();
                    if (parser.getCurrentName() == 'amount') {
                       Amount = Decimal.valueOf(parser.getText());
                         System.debug('Amount In $ => '+ Amount);
                        
                    } else if (parser.getCurrentName() == 'quote') {
                       Decimal usdRate  = Decimal.valueOf(parser.getText());
                         System.debug('USD Rate--->'+usdRate);
                        
                    }else if (parser.getCurrentName() == 'result') {
                          
                           Decimal inrRate  = Decimal.valueOf(parser.getText());
                         System.debug('Converted INR--->'+inrRate);
                        
                    }
                
                }
          //  {info={quote=77.264498, timestamp=1652185624}, query={amount=50, from=USD, to=INR}, result=3863.2249, success=true}
        }
      }
    }
}