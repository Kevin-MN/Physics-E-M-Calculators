class Object{
  private final float K = 8.9875517873681764 * (pow(10,9)); //Coulomb constant K = 9.0x10^9 N*m^2/C^2
  private float radius;   // distance is in meters, m
  private float charge;   // charge is Coulombs, C
  private ArrayList<Force_E> electric_forces;
  private float x;        // units for distance are in meters, m
  private float y;
  private color q_color;
  
    // constructor for object creation with x and y arguments
     public Object(float r, float q, float x_pos, float y_pos){
        this.electric_forces = new ArrayList<Force_E>();
        this.radius = r;
        this.charge = q;
        this.x = x_pos;
        this.y = y_pos;
        if(this.charge > 0){
           q_color =  #FF0000;
        }
        else if(this.charge < 0){
           q_color =  #0000FF;
        }
        else{
         q_color =  #A9A9A9;
        }
     }
    
    //constructor for object creation based on an angle and distance from object passed as argument
    public Object(){
      
    }
    
    public void compute_force(Object obj, int q1, int q2){      //kQq/r^2
        float distance = sqrt(pow(obj.getX() - this.x,2) + pow(obj.getY() - this.y,2));    
        float e_force = (K * this.charge * obj.get_charge())/(pow(distance,2));        
        float theta = atan((this.y - obj.getY())/(this.x - obj.getX()));
        boolean repulse = e_force > 0 ? true : false; 
         
        Force_E e_vec = new Force_E(e_force,PI - theta,this.x,this.y,repulse,q2);
        Force_E e_vec2 = new Force_E(e_force,(2 * PI) - theta,obj.getX(),obj.getY(),repulse,q1);
        this.electric_forces.add(e_vec);
        obj.add_force(e_vec2);
    }
    
    public void add_force(Force_E e){
      electric_forces.add(e);
    }
    
    public void display_object(){
       fill(this.q_color);
       noStroke();
       circle(this.x + (width / 2),(-1 * this.y) + (height / 2), this.radius * 2);
       this.display_forces();
    }
    
    public void display_forces(){
      for(int i = 0; i< electric_forces.size();i++){
          electric_forces.get(i).draw_force_E();
      }
    }
  
    public float getX(){
       return this.x; 
    }
    
     public float getY(){
       return this.y; 
    }
    
     public float get_charge(){
        return this.charge; 
     }
  
    public void export_forces(PrintWriter writer){
     for(int i =0; i<electric_forces.size();i++){
         writer.println(electric_forces.get(i).get_magnitude() + "N caused by Q" +  electric_forces.get(i).get_source() + "in direction " + (electric_forces.get(i).get_direction() % 180));
     }
    }
  
}
