//extends->used to get acess of child class
public class GrandChild extends Child {
    public void grandChildMethod()
        {
            System.debug('This Is Grand Child Method');
            super.childMethod();//call child class method using super keyword
        }
}