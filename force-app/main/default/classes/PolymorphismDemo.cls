public class PolymorphismDemo {
//poly=change morph==change one stage to anothe
//1.Overloading-extend functionality-same name with diffrent arg

    public void Person(){
        System.debug('A person is Male');
    }
    public void Person(Integer age){
        System.debug('A person as a Child Age=> '+age);
    }
    public void Person(String name){
        this.Person(20);
        System.debug('A person as a Men Name => '+name);
    }
    public void Person(String name,Integer age){
        System.debug('A person as a Parent=>Name '+name+' Age ' +age);
    }

    
}