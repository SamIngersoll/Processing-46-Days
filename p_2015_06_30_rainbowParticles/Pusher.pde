
class Pusher  {
 PVector p_, v_, a_;
 Pusher( float x, float y, float z)  {
  p_ = new PVector( x, y, z );
  v_ = new PVector( 0, 0, 0 );
  a_ = new PVector( random(-.1,.1), random(-.1,.1), random(-.1,.1) );
 } 
 void draw()  {
   pushMatrix();
   translate( p_.x, p_.y, p_.z );
   strokeWeight( 3 );
   point( 0, 0 );
   popMatrix();
 }
 void update()  {
   PVector add = new PVector( random(-10,10), random(-10,10), random(-10,10) );
   add.normalize();
   this.a_.add( add );
   this.v_.add( a_ );
   strokeWeight( 1 );
   stroke( map(this.v_.x, 0, 10, 0, 255 ), 
           map(this.v_.y, 0, 10, 0, 255 ), 
           map(this.v_.z, 0, 10, 0, 255 ) );
   line( p_.x, p_.y, p_.z, 
         p_.x+v_.x, p_.y+v_.y, p_.z+v_.z );
   this.p_.add( v_ );
 }
}
