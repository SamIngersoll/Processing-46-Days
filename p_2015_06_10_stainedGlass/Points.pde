
class Point  {
  private float x, y, angle, radius;
  Point( float radius, float angle )  {
  this.radius = radius;
  this.angle = angle;
  calcX();
  calcY();
 }

 void calcX()  {  // Calculates the x value from the angle
   this.x = this.radius*cos(this.angle)+width/2;
 }
 void calcY()  {  // Calculates the y value from the angle
   this.y = this.radius*sin(this.angle)+height/2;
 }
 void setX( float x )  {
  this.x = x; 
 }
 void setY( float y )  {
  this.y = y; 
 }
 void spin( float increment )  {  // Spins the points
  this.angle += increment; 
  calcX();
  calcY();
 }
}