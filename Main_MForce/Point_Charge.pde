class Point_Charge{
  private float radius; //gui
  private float x_pos; // m
  private float y_pos;
  private PVector vel; //m/s
  private float charge; // C, Couloumbs
  private color q_color;
  
  Point_Charge(float r, float x, float y, PVector v, float q){
   this.radius = r;
   this.x_pos = x;
   this.y_pos = y;
   this.vel = v;
   this.charge = q;
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
  
   public void display_object(){
       fill(this.q_color);
       noStroke();
       circle(this.x_pos + (width / 2),(-1 * this.y_pos) + (height / 2), this.radius * 2);
    }
    
  public float getX(){
       return this.x_pos; 
    }
    
     public float getY(){
       return this.y_pos; 
    }
    
     public float get_charge(){
        return this.charge; 
     }
     
    public PVector get_vel(){
       return this.vel; 
    }
}
