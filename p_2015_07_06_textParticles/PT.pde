float rand = 0.3;

class PT  {
 PVector p_, v_, a_;
 float r;
 boolean dead;
 PT( float x, float y, float r )  {
  this.p_ = new PVector( x, y );
  this.v_ = new PVector( 0, 0 );
  this.a_ = new PVector( random(-1, 1 ), random(-1, 1 ) );
  this.r = r;
  this.dead = false;
 } 
  PT( float x, float y, float r, float ax, float ay )  {
  this.p_ = new PVector( x, y );
  this.v_ = new PVector( 0, 0 );
  this.a_ = new PVector( ax, ay );
  this.r = r;
  this.dead = false;
 } 
 void draw()  {
  fill( map(this.v_.x, -15, 15, 200, 255 ), 
        map( this.v_.y, -15, 15, 0, 255 ), 
        map( this.v_.y, -15, 15, 200, 255 ) );
  ellipse( p_.x, p_.y, r, r ); 
 }
 void update()  {
     this.v_.add( a_ );
     v_.limit( 15 );
//     a_.limit(  );
     this.p_.add( v_ );
   this.a_.mult(0.99);
 }
 void check()  {
  if ( ((int)random(5)) == 0 )
    if ( img.get((int)p_.x, (int)p_.y ) < -10 )  {
//     a_.mult(0);
//     v_.mult(0);
     this.dead = true;
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
 void attract()  {
     PVector add = new PVector( 0, 0 );
     PVector average = new PVector( 0, 0 );
     for ( int i=0 ; i<PTs.length ; i++ )  {
       if ( PTs[i].p_.x != this.p_.x && PTs[i].p_.y != this.p_.y )  {
         add = new PVector( PTs[i].p_.x-width/2,
                               PTs[i].p_.y-height/2 );
         add.div( -PVector.dist( this.p_, PTs[i].p_ )/10 );            
         average.add( add);
       }
     
//     average.div(PTs.length*100);
//   average.normalize();
     this.a_.add(average);
   }
 }
}


