
float g = 2;

class Ball  {
 PVector p_, v_, a_;
 float r;
 Ball( float x, float y, float r )  {
  this.p_ = new PVector( x, y );
  this.v_ = new PVector( random(-3, 3), random(-3,3) );
  this.a_ = new PVector( 0, g );
  this.r = r;
 } 
 void draw()  {
  fill( map( v_.mag(), -3, 20, 0, 255 ), 0, 0 );
  ellipse( p_.x, p_.y, r, r ); 
 }
 void update()  {
  this.v_.add(a_);
  this.p_.add(v_); 
 }
 void checkCollisions( Pin[] pins )  {
   for ( int i=0 ; i<pins.length ; i++ )  {
//     if ( p_.x+r/2 >= pins[i].p_.x-pins[i].r/2
//     && p_.x-r/2 <= pins[i].p_.x+pins[i].r/2
//     && p_.y+r/2 >= pins[i].p_.y-pins[i].r/2
//     && p_.y-r/2 <= pins[i].p_.y+pins[i].r/2 )  {
    if ( PVector.dist( p_, pins[i].p_ ) < r/2+pins[i].r/2 )  {
     collide( pins[i] );
     }
   }
   checkWalls();
 }
 void collide( Pin a )  {
   PVector collision = PVector.sub( p_, a.p_ );
//   collision.div(20);
//   collision.normalize();
   collision.add( new PVector( -v_.y, v_.x ));
   this.v_=collision;
   this.v_.div(5);
 }
 void checkWalls()  {
  if ( p_.x - r/2 < 0 )  {
   v_.x = abs( v_.x );
   v_.x/=(1.2);
  } 
  if ( p_.x + r/2 > width )  {
   v_.x = -1*abs( v_.x );
   v_.x/=(1.2);
  } 
  if ( p_.y + r/2 > height )  {
   v_.y = -1*abs( v_.y );
   v_.y/=(1.2);
  } 
 }
}
