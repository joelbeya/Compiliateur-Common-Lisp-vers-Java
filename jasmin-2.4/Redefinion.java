import java.util.ArrayList;

public class Redefinion {
	
	private  ArrayList<Object> A ;
	
	public Object cons(Object o,ArrayList<Object> pl) {
		 pl.add(0, o);
		 return pl;	 
	}
	
	public Object car(ArrayList<Object> pl) {
		if (pl.isEmpty())
		return null;
		
		return pl.get(0);
	}

	public Object cdr(ArrayList<Object> pl) {
		A = pl;
		
		if (pl.isEmpty())
			return null;
					
		 A.remove(0);
		 return A;
	}
	
	public Object cddr(ArrayList<Object> pl) {
		A = pl;
		
		if (pl.isEmpty())
			return null;
		
		A.remove(0);
		A.remove(0);
	
		return A;
	}
	
	public Object cadr(ArrayList<Object> pl) {
		cdr(pl);
		return car(pl);
	}
	
	public Object caddr(ArrayList<Object> pl) {
		A = pl;
		
		if (pl.isEmpty())
			return null;
		A.remove(0);
		A.remove(0);
		
		return car(A);
	}
	
	public Object Append(ArrayList<Object> pl1,ArrayList<Object> pl2) {
		pl1.addAll(pl2);
		return pl1;
	}
	
	public Object Last(ArrayList<Object> pl1) {
		if (pl1.isEmpty())
			return null;
		
		return pl1.get(pl1.size()-1);
	}
	
	public Object Length(ArrayList<Object>pl) {
		return pl.size();
	}
	
	
	public Object plus(Object e1,Object e2) {
		
		if ((e1 instanceof  Integer) && (e2 instanceof Integer))
			return (Integer)e1 + (Integer)e2;
		
		if ((e1 instanceof  Float) && (e2 instanceof Float))
			return (Float)e1 + (Float)e2;
		
		if ((e1 instanceof  Float) && (e2 instanceof Integer))
			return (Float)e1 + (Float)e2;
		
		if ((e1 instanceof  Integer) && (e2 instanceof Float))
			return (Float)e1 + (Float)e2;
		
		if ((e1 instanceof  Double) && (e2 instanceof Double))
			return (Double)e1 + (Double)e2;		
	
		if ((e1 instanceof  Double) && (e2 instanceof Integer))
			return (Double)e1 + (Integer)e2;	
		
		if ((e1 instanceof  Integer) && (e2 instanceof Double))
			return (Integer)e1 + (Double)e2;	
		
		if ((e1 instanceof  Double) && (e2 instanceof Float))
			return (Double)e1 + (Float)e2;	
		
		if ((e1 instanceof  Float) && (e2 instanceof Double))
			return (Float)e1 + (Double)e2;	
		
		return null;
		
	
	
	}
	
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
	
	public Object div(Object e1,Object e2) {
		
		if ((e1 instanceof  Integer) && (e2 instanceof Integer))
			return (Integer)e1 / (Integer)e2;
		
		if ((e1 instanceof  Float) && (e2 instanceof Float))
			return (Float)e1 / (Float)e2;
		
		if ((e1 instanceof  Float) && (e2 instanceof Integer))
			return (Float)e1 / (Integer)e2;
		
		if ((e1 instanceof  Integer) && (e2 instanceof Float))
			return (Integer)e1 / (Float)e2;
		
		if ((e1 instanceof  Double) && (e2 instanceof Double))
			return (Double)e1 / (Double)e2;	
		
		if ((e1 instanceof  Double) && (e2 instanceof Integer))
			return (Double)e1 / (Integer)e2;	
		
		if ((e1 instanceof  Integer) && (e2 instanceof Double))
			return (Integer)e1 / (Double)e2;	
		
		if ((e1 instanceof  Double) && (e2 instanceof Float))
			return (Double)e1 / (Float)e2;	
		
		if ((e1 instanceof  Float) && (e2 instanceof Double))
			return (Float)e1 / (Double)e2;	
		
		return null;
	
	}


	public Object supp(Object e1,Object e2) {

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
	
	public Redefinion(ArrayList<Object> a) {
		super();
		A = a;
	}

public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	
		ArrayList<Object> A = new ArrayList<Object> ();
		Object h1 = new String("A");
		Object h2 = new String("B");
		Object h3 = new String("C");
		A.add(h1);
		A.add(h2);
		A.add(h3);
		
		ArrayList<Object> C = new ArrayList<Object> ();
		
		Redefinion B = new Redefinion(A);
		Object h4 = new String("E");
		Object h5 = new String("F");
		Object h6 = new String("G");
		
		C.add(h4);
		C.add(h5);
		C.add(h6);
		
		Object hj = new String("D");
		
		
		
		
		
		
		System.out.println(B.cons(hj,A));
		
		
		System.out.println(B.car(A));
		
		System.out.println(A);
		
		
		System.out.println(B.cdr(A));
		
		System.out.println(B.cadr(A));
		
	
		System.out.println(B.caddr(A));
		
		System.out.println(B.Last(A));
		
		System.out.println(B.div(4,3));
		
		System.out.println(B.div(2.3,3));
		
		System.out.println(B.div(3.5,5.3));
		
		System.out.println(B.div(4,8.6));
		
		System.out.println(B.Append(A,C));
		
		System.out.println(B.moins(4,3));
		
		System.out.println(B.moins(2.3,3));
		
		System.out.println(B.moins(3.5,5.3));
		
		System.out.println(B.moins(4,8.6));
		
		System.out.println(B.plus(4,3));
		
		System.out.println(B.plus(2.3,3));
		
		System.out.println(B.plus(3.5,5.3));
		
		System.out.println(B.plus(4,8.6));
		
		System.out.println(B.mult(4,3));
		
		System.out.println(B.mult(2.3,3));
		
		System.out.println(B.mult(3.5,5.3));
		
		System.out.println(B.mult(4,8.6));
		

	}



}
