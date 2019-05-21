import java.util.ArrayList;

public class Factorielle {

  private  ArrayList<Object> A ;

  public Object moins(Object e1,Object e2) {

		if ((e1 instanceof  Integer) && (e2 instanceof Integer))
			return (Integer)e1 - (Integer)e2;

		if ((e1 instanceof  Float) && (e2 instanceof Float))
			return (Float)e1 - (Float)e2;

		if ((e1 instanceof  Float) && (e2 instanceof Integer))
			return (Float)e1 - (Integer)e2;

		if ((e1 instanceof  Integer) && (e2 instanceof Float))
			return (Integer)e1 - (Float)e2;

		if ((e1 instanceof  Double) && (e2 instanceof Double))
			return (Double)e1 - (Double)e2;

		if ((e1 instanceof  Double) && (e2 instanceof Integer))
			return (Double)e1 - (Integer)e2;

		if ((e1 instanceof  Integer) && (e2 instanceof Double))
			return (Integer)e1 - (Double)e2;

		if ((e1 instanceof  Double) && (e2 instanceof Float))
			return (Double)e1 - (Float)e2;

		if ((e1 instanceof  Float) && (e2 instanceof Double))
			return (Float)e1 - (Double)e2;

		return null;

	}

  public Object mult(Object e1,Object e2) {

		if ((e1 instanceof  Integer) && (e2 instanceof Integer))
			return (Integer)e1 * (Integer)e2;

		if ((e1 instanceof  Float) && (e2 instanceof Float))
			return (Float)e1 * (Float)e2;

		if ((e1 instanceof  Float) && (e2 instanceof Integer))
			return (Float)e1 * (Integer)e2;

		if ((e1 instanceof  Integer) && (e2 instanceof Float))
			return (Integer)e1 * (Float)e2;

		if ((e1 instanceof  Double) && (e2 instanceof Double))
			return (Double)e1 * (Double)e2;

		if ((e1 instanceof  Double) && (e2 instanceof Integer))
			return (Double)e1 * (Integer)e2;

		if ((e1 instanceof  Integer) && (e2 instanceof Double))
			return (Integer)e1 * (Double)e2;

		if ((e1 instanceof  Double) && (e2 instanceof Float))
			return (Double)e1 * (Float)e2;

		if ((e1 instanceof  Float) && (e2 instanceof Double))
			return (Float)e1 * (Double)e2;


		return null;

	}


    public Boolean supp(Object e1,Object e2) {

		if ((e1 instanceof  Integer) && (e2 instanceof Integer))
			return (Integer)e1 > (Integer)e2;

		if ((e1 instanceof  Float) && (e2 instanceof Float))
			return (Float)e1 > (Float)e2;

		if ((e1 instanceof  Float) && (e2 instanceof Integer))
			return (Float)e1 > (Integer)e2;

		if ((e1 instanceof  Integer) && (e2 instanceof Float))
			return (Integer)e1 > (Float)e2;

		if ((e1 instanceof  Double) && (e2 instanceof Double))
			return (Double)e1 > (Double)e2;

		if ((e1 instanceof  Double) && (e2 instanceof Integer))
			return (Double)e1 > (Integer)e2;

		if ((e1 instanceof  Integer) && (e2 instanceof Double))
			return (Integer)e1 > (Double)e2;

		if ((e1 instanceof  Double) && (e2 instanceof Float))
			return (Double)e1 > (Float)e2;

		if ((e1 instanceof  Float) && (e2 instanceof Double))
			return (Float)e1 > (Double)e2;

		return null;

	}


  public Object fact (Object n) {
      if ((Boolean)supp((Object)1,n)) {
        return (Object)1;
      }
        else return(mult(n,fact(moins(n,(Object)1))));
    }

  public Factorielle(ArrayList<Object> a) {
		super();
		A = a;
	}

    public static void main (String[] args) {
      ArrayList<Object> A = new ArrayList<Object> ();
	Factorielle B = new Factorielle(A);
        System.out.print(B.fact(6));
    }
}
