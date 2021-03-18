final float u04pi = 1E-7;

Point_Charge q1 = new Point_Charge(3,0,0,new PVector(700000,0,0),1.6E-19);
Point_Charge q2 = new Point_Charge(3,5E-9,5E-9,new PVector(0,-600000,0),1.6E-19);

void setup(){
  fullScreen();
  q1.display_object();
  q2.display_object();
  calculate_Force_m(q1,q2);
}

public void calculate_Force_m(Point_Charge c1, Point_Charge c2){
  
  PVector r1 = new PVector(c2.getX() - c1.getX(),c2.getY()-c1.getY());
  float mult_constant = u04pi * c1.get_charge() * c2.get_charge()/(pow(r1.mag(),2));
  
  //BForce on q2 by q1
  PVector B1 = c1.get_vel().cross(r1.normalize()); //teslas
  PVector F1 = c2.get_vel().cross(B1).mult(mult_constant);
   
  PVector r2 = new PVector(c1.getX() - c2.getX(),c1.getY()-c2.getY());
  //Bforce on q1 by q2
  PVector B2 = c2.get_vel().cross(r2.normalize()); //teslas
  PVector F2 = c1.get_vel().cross(B2).mult(mult_constant);
  
  stroke(#0000FF);
  //F1
  //
  line(c2.getX() + (width / 2), (-1 * c2.getY()) + (height / 2),F1.x,F1.y);
  //F2
  line(c1.getX() + (width / 2), (-1 * c1.getY()) + (height / 2),F2.x,F2.y * -1);
  
  println(B1.x);
  println(B2.y);
  println(B2.z);
  
   println(B2.x);
  println(B2.y);
  println(B2.z);
  
  
  println(F2.x);
  println(F2.y);
  println(F2.z);
  
  println(F1.x);
  println(F1.y);
  println(F1.z);
  
 println("Magnitude of F1 = " + F1.x);
 println("Magnitude of F2 = " + F2.y);
 println("Angle of F1 = " + F1.heading());
 println("Angle of F2 = " + F2.heading());
}
