import java.util.ArrayList;



public class main {

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
