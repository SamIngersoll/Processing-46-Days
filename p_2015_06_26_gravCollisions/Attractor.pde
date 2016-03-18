
class Attractor  {
 PVector p_;
 float g, m, r;
 Attractor( float x, float y )  {
  p_ = new PVector( x, y );
  g = 0.4;
  m = 20;
  r = 100;
 } 
 void draw()  {
  ellipseMode( CENTER );
  fill( 50, 200, 100 );
  ellipse( this.p_.x, this.p_.y, r, r ); 
 }
 void update()  {
  this.p_.x = mouseX;
  this.p_.y = mouseY;
//  this.p_.x = width/2;
//  this.p_.y = height/2;
 }
 PVector force( PT pt )  {  // Applies forces
   PVector force = PVector.sub( p_, pt.p_ );
   float distance = force.mag();
   distance = constrain(distance,5.0,25.0);
   force.normalize();
   float strength = (g * m * pt.m) / (distance * distance);
   force.mult(strength);
   return force;
 }
}