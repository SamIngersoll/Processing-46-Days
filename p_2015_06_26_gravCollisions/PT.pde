

class PT  {
 PVector p_, v_, a_;
 float m, r;
 color f;
 PT( float x, float y )  {
  p_ = new PVector( x, y );
  v_ = new PVector();
  a_ = new PVector();
  m = random( 10, 30 );
  r = random( 10, 40 );
  f = color( 255 );
 } 
 void draw()  {
  ellipseMode( CENTER );
  f = color( 0, map( v_.mag(), 0, 10, 0, 255 ), map( v_.mag(), 0, 10, 0, 255 ) );
  fill( f );
  ellipse( p_.x, p_.y, r, r ); 
 }
 void update()  {
  p_.add( v_ );
  v_.add( a_ ); 
  a_.mult(0);
  v_.div(1.05);
 }
 void applyForce( PVector force )  {
   this.a_.add( force );
 }
 void checkCollision( Attractor a )  {
   if ( p_.x+r/2 >= a.p_.x-a.r/2
     && p_.x-r/2 <= a.p_.x+a.r/2
     && p_.y+r/2 >= a.p_.y-a.r/2
     && p_.y-r/2 <= a.p_.y+a.r/2 )  {
     collide( a );
   }
 }
 void checkCollision( PT a )  {
   if ( p_.x+r/2 >= a.p_.x-a.r/2
     && p_.x-r/2 <= a.p_.x+a.r/2
     && p_.y+r/2 >= a.p_.y-a.r/2
     && p_.y-r/2 <= a.p_.y+a.r/2 )  {
     collide( a );
   }
 }
 void collide( Attractor a )  {
   PVector collision = PVector.sub( p_, a.p_ );
   collision.div(20);
   collision.add( new PVector( -v_.y, v_.x ));
   this.v_=collision;
 }
  void collide( PT a )  {
   PVector collision = PVector.sub( p_, a.p_ );
   collision.div(20);
   collision.add( new PVector( -v_.y, v_.x ));
   this.v_=collision;
 }
}
