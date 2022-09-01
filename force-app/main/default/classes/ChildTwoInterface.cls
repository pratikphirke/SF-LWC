public class ChildTwoInterface implements ParentInterface {

    public void cal(Integer a,Integer b){
        Integer sub= a-b;
        System.debug('Substraction =>'+sub);
    }

}