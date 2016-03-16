

class PT  {
  float r, theta;
  PT( float r, float theta )  {
    this.r = r;
    this.theta = theta;
  }
  void draw()  {
    point( r*cos(theta), r*sin(theta) );
  }
 
  
}
