
class PT  {
 PVector p_,
         v_,
         a_;
 color stroke;
 PT( float x, float y, float z )  {
  this.p_ = new PVector( x, y, z );
  this.v_ = new PVector( 0, 0, 0 );
  this.a_ = new PVector( 0, 0, 0 );
  this.stroke = STROKE;
 } 
 void draw()  {
  stroke( this.stroke );
  point( p_.x, p_.y, p_.z ); 
  this.update();
 }
 void applyForce( PVector force )  {
   this.a_.add( force );
 }
 void dissapateForces( float forceDissapationCoefficient )  {
   this.a_.div( forceDissapationCoefficient );
 }
 void update()  {
   this.p_.add( this.v_ );
   this.v_.add( this.a_ );
 }
}
