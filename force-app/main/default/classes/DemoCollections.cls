public class DemoCollections {
//Practicals On Collections Class in Apex
  /* Public void displayList(){
        
      List<string> oneDimList = new List<string>{'p','r','a','t','i','k'}; 
	  	System.debug('One-Dimensional List==>  '+oneDimList);
	  
	   List<Account> acclist = [SELECT Id,Name FROM Account LIMIT 10];
         for(Account acc: acclist){
            System.debug('List of ACCOUNT NAME =>'+ acc.Name +'ACCOUNT ID =>'+ acc.Id);
        }
        
        List<List<String>> CourseList = new List<List<String>>();
        List<String> DegreeList = new List<String>();
        DegreeList.add('BE');
        DegreeList.add('BCS');
        DegreeList.add('BCA');
        DegreeList.add('BSC');
        DegreeList.add('BCom');
        CourseList.add(DegreeList);
        
		List<String> MastersList = new List<String>();
        MastersList.add('ME');
        MastersList.add('MCS');
        MastersList.add('MCA');
        MastersList.add('MSC');
        MastersList.add('MCom');
        CourseList.add(MastersList);
	
		System.debug('Course Nested List=> '+CourseList);
       
        //Method On List==>
        List<Integer> numList = new List<Integer>();
        numlist.clear();
        if(numList.isEmpty()){
        numlist.add(5);
        numList.add(50);
        numList.add(15);
        numList.add(35);
        numList.add(80);
        numList.add(10);
        }
        numList.remove(1);
        numList.sort();
		 Integer size = numlist.size();
       // List<Integer> nextlist = new List<Integer>{10,20,50,10,2021};
       // numlist.addAll(CourseList);
        system.debug('List Demo ==>  '+numlist);
        system.debug('List Demo SIZE==>  '+size);
    }
   */ 
    /*  Public void displaySet(){
        
      set<string> oneDimset = new set<string>{'p','r','a','t','i','k','s','h','a'}; 
	  	System.debug('One-Dimensional set==>  '+oneDimset);//{a, h, i, k, p, r, s, t} auto sort/unique
	  
	 
        //Method On List==>
		 Set<Integer> numSet = new Set<Integer>();
       // numSet.clear();
        if(numSet.isEmpty()){
        numSet.add(5);
        numSet.add(50);
        numSet.add(15);
        numSet.add(35);
        numSet.add(50);
        numSet.add(10);
        }
        numSet.remove(1);
        system.debug('Set Demo ==>  '+numSet);//  {5, 10, 15, 35, 50} 
        List<Integer> nextlist = new List<Integer>{10,20,50,10,2021};
        numSet.addAll(nextlist);
        Integer size = numSet.size();
        system.debug('Set after add nextList ==>  '+numSet);// {5, 10, 15, 20, 35, 50, 2021}
        system.debug('Set Demo SIZE==>  '+size);//7
          numSet.removeAll(nextlist);
           system.debug('Set Demo ==>  '+numSet);//{5, 15, 35}
          numSet.clear();
          system.debug('Set Demo ==>  '+numSet.size());//0
    }
*/
   /*  Public void displayMap(){
        
      Map<Integer,String> colorMap = new Map<Integer,String>{101=>'red',102=>'black',103=>'white',103=>'black',104=>'green'}; 
         if(!colorMap.isEmpty()){						// auto unorder/key unique but value duplicate
            colorMap.put(105, 'Blue');
           colorMap.put(106, 'yellow'); 
         }
        System.debug('colorMap==>  '+colorMap);//  {101=red, 102=black, 103=black, 104=green, 105=Blue, 106=yellow}
          if(colorMap.containsKey(105))
         System.debug('map containsKey(110) Present=> TRUE ');
         colorMap.remove(104);
         
         Map<Integer,string> numMap = new Map<Integer,string>{1=>'A',4=>'B',3=>'D',5=>'E',2=>'F'};
         colorMap.putAll(numMap);
         System.debug('colorMap After add new ele=>'+colorMap);
         //{{1=A, 2=F, 3=D, 4=B, 5=E, 101=red, 102=black, 103=black, 105=Blue, 106=yellow, ...}
         
         String value = colorMap.get(1);
         System.debug('104 has value=>'+value);//A
         Set<Integer> SetOfKeys = colorMap.keySet();
         System.debug('colorMap SetOfKeys=>'+SetOfKeys);//{1, 2, 3, 4, 5, 101, 102, 103, 105, 106}
         
	     List<string> colorValueList = new List<string>(); 
        colorValueList.addAll(colorMap.values());
          System.debug('colorMap Value List=>'+colorValueList);//(red, black, black, Blue, yellow, A, B, D, E, F)
       
    }*/
    
}