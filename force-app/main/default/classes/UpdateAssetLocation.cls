public class UpdateAssetLocation implements database.Batchable<AssetLocation__c> 
{
	public System.Iterable<AssetLocation__c> start(Database.BatchableContext BC){
      return new List<AssetLocation__c>(
          [select id,Name,Asset_Vin__c from AssetLocation__c]);//

 //SELECT BaseElement__r.VINumber__c, FROM AssetLocation__c WHERE BaseElement__r.VINumber__c = 'abc123'
                                                   
   }
     public void execute(Database.BatchableContext BC, List<AssetLocation__c> scope){
    
           try{
	 			List<AssetLocation__c> AssetList = new List<AssetLocation__c>();
               List<BaseElement__c> BaseEleList = new List<BaseElement__c>([select id,Name,VINumber__c from BaseElement__c ]);
               
            Integer asslist = scope.size();
                Integer baseList = BaseEleList.size();
               
           for(Integer i=0; i<asslist; i++)
           {
           		 AssetLocation__c acc= scope.get(i);
              		 System.debug(' AssetLocation NAME =>'+ acc.Name +' AssetLocation ID =>'+ acc.Id);
              
                    for(Integer j=0; j<baseList; j++)
           			{
                         BaseElement__c bcc= BaseEleList.get(j);
              				 System.debug(' BaseEleList NAME =>'+ bcc.Name +' BaseEleList ID =>'+ bcc.Id);
              
                            if(acc.Asset_Vin__c == bcc.VINumber__c){ //acc.Asset_Vin__c == Be.VINumber__c
                                system.debug('***-TRUE*** ');   
                                
                         //  BaseElement__c Be = new BaseElement__c();
                           
                     
                                 acc.BaseElement_lookup__c = bcc.Id; //e.id;
                                
                                   system.debug('***BaseElement lookup   == '+acc.BaseElement_lookup__c);   
                            } 
                      
                    }                                       
                     AssetList.add(acc);
                 system.debug('Assest List==> '+AssetList);

       	   }
           
              update AssetList;
             system.debug('Update List AssetList :'+AssetList);
          		
           } catch(Exception e)
              {
                  System.debug(' Exception'+e);
                  //return null;
              }   

    }
 
   public void finish(Database.BatchableContext BC){
       
   }

}

/*

                
 				/*Set<Id> accIds = new Set<Id>();
    			 List<AssetLocation__c> AssetList = new List<AssetLocation__c>();
               
                    for(AssetLocation__c opp : scope)
                    {
                        if(opp!= null)
                        {
                            accIds.add(opp.BaseElement_lookup__c);
                        }
                    }
                  system.debug('AsaccIds   ==> '+accIds);
              
*/



    
               
               /*  for(AssetLocation__c s : scope)
                     {   
                         
                         
                         
        
        
                    //  AssetLocation__c Al = new AssetLocation__c();//BaseElement_lookup__c--lookup
                   
                            BaseElement__c Be = new BaseElement__c();
                            if(s.Asset_Vin__c == Be.VINumber__c){             
                                system.debug('***-TRUE*** ');                
                                 s.BaseElement_lookup__c = Be.Name;
                                   system.debug('***BaseElement lookup   == '+s.BaseElement_lookup__c);   
                            } 
                            // s.BaseElement_lookup__c = Be.VINumber__c;//record from ass loc ==name 
                                       
                     AssetList.add(s);
                 system.debug('Assest List==> '+AssetList);
                        
                     }
                 
                     */