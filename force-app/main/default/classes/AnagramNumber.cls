//check character/integer is occur same time(seq is maybe different)
//abdc=bcda is anagram

public class AnagramNumber {
    public static void CheckAnagram()
    {
       List<Integer> list1=new List<Integer>{1,2,3,4,5};
		List<Integer> list2=new List<Integer>{2,3,4,1,5};

if(list1.size()==list2.size())
{
    list1.sort();
    list2.sort();
}

integer flag=0;
for(integer i=0;i<list1.size();i++)
{
    if(list1[i]!=list2[i])
        flag=1;
        
}
if(flag==0)
system.debug('number are  anagram');
else
    system.debug('number are not anagram');
    }
}