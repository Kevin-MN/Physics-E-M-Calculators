class Force_E{
  private float magnitude;    // 
  private float direction;    //angle theta relative to?
  private float x_initial;
  private float y_initial;
  private float x_terminal;
  private float y_terminal;
  private boolean repel;
  private int source;
 
  public Force_E(float mag, float dir, float x_int, float y_int, boolean rep, int sc){
     this.magnitude = mag;
     this.direction = dir;
     this.x_initial = x_int;
     this.y_initial = y_int;
     this.x_terminal = (this.x_initial + (width/2)) + (this.magnitude * cos(this.direction));
     this.y_terminal = ((-1 * this.y_initial) + (height/2)) + (this.magnitude * sin(this.direction));
     this.repel = rep;
     this.source = sc;
    }

  public void draw_force_E(){
    if(repel){
      stroke(#FF0000);
    }
    else{
       stroke(#0000FF); 
    }
    line(this.x_initial + (width/2),(-1 * this.y_initial) + (height/2),this.x_terminal,this.y_terminal);
  }

  public float get_magnitude(){
     return this.magnitude; 
  }
  
  public float get_direction(){
     return this.direction * 180 / PI; 
  }
  
  public float get_source(){
     return this.source; 
  }
}
