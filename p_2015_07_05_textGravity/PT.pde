float rand = 0.3;

class PT  {
 PVector p_, v_, a_;
 float r;
 PT( float x, float y, float r )  {
  this.p_ = new PVector( x, y );
  this.v_ = new PVector( 0, 0 );
  this.a_ = new PVector( random(-1, 1 ), random(-1, 1 ) );
  this.r = r;
 } 
 void draw()  {
  fill( 255, 0, 0 );
  ellipse( p_.x, p_.y, r, r ); 
 }
 void update()  {
   this.v_.add( a_ );
   this.p_.add( v_ );
   v_.limit( 15 );
 }
 void check()  {

  if ( img.get((int)p_.x, (int)p_.y ) < -10 )  {
   a_.mult(0);
   v_.mult(0);
  } 
 }
 void checkWalls()  {
  if ( p_.x - r/2 < 0 )  {
   this.v_.x = abs(v_.x);
   this.a_.x = abs(a_.x);
   this.v_.add( new PVector( random(-rand, rand), random(-rand, rand) ) );
  }
  if ( p_.x + r/2 > width )  {
   this.v_.x = -1*abs(v_.x);
   this.a_.x = -1*abs(a_.x);
   this.v_.add( new PVector( random(-rand, rand), random(-rand, rand) ) );
  } 
  if ( p_.y + r/2 > height )  {
   this.v_.y = -1*abs(v_.y);
   this.a_.y = -1*abs(a_.y);
   this.v_.add( new PVector( random(-rand, rand), random(-rand, rand) ) );
  } 
  if ( p_.y - r/2 < 0 )  {
   this.v_.y = abs(v_.y);
   this.a_.y = abs(a_.y);
   this.v_.add( new PVector( random(-rand, rand), random(-rand, rand) ) );
  } 
 }
}

void mousePressed()  {
 setup(); 
}

void keyPressed()  {
 saveFrame( "textParticles_###.png" ); 
}
