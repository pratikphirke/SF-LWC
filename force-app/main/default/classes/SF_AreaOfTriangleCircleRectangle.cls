//Write apex program to find area of triangle, circle, and rectangle ( use function overloading)
public class SF_AreaOfTriangleCircleRectangle {
    //Overloading-extend functionality-same name with diffrent arg
       
  public static void Area(Integer Radius)
    {
        Decimal AreaofCircle=3.14*Radius*Radius;
        system.debug('Area of circle => '+AreaofCircle);     
    }
  public static void Area(Decimal Width,Decimal Height)
    {
        Decimal AreaofRectangle=Width*Height;
        system.debug('Area of Rectangle => '+AreaofRectangle);       
    }
   public static void Area(Integer Base,Integer Height)
    {
         Decimal AreaofTrangle=0.5*Base*Height;
        system.debug('Area of Traingle => '+AreaofTrangle);
    }   
}