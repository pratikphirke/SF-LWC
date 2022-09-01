public class ChildOneInterface implements ParentInterface {
    public void cal(Integer a,Integer b){
        Integer add= a+b;
        System.debug('Addition =>'+add);
    }
}