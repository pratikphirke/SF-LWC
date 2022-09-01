public class ChildAbstract extends ParentAbstract {
    public void show()
        {
         System.debug('Child class =>show()');   
        }
    public override void getMsg(){
        String msg='Hello';
        System.debug('child class getMsg() =>'+msg);
    } 
}