

class PT  {
 PVector p_, v_, a_;
 float m;
 PT( float x, float y )  {
  p_ = new PVector( x, y );
  v_ = new PVector();
  a_ = new PVector();
  m = random( 10, 30 );
 } 
 void draw()  {
  strokeWeight(4);
  point( p_.x, p_.y ); 
 }
 void update()  {
  p_.add( v_ );
  v_.add( a_ ); 
  a_.mult(0);
  v_.div(1.005);
 }
 void applyForce( PVector force )  {
   this.a_.add( force );
 }
}
