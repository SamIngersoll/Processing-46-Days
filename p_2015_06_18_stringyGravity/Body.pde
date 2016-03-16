
class Body  {
 float r, maxVel;
 PVector position, velocity, acceleration;
 Body( float x, float y )  {
  this.position = new PVector( x, y );
  this.velocity = new PVector( 0, 0 );
  this.acceleration = new PVector( 0, 0 );
  this.r = 40;
 }
 void draw()  {
  stroke( map(velocity.mag(), 0, 20, 0, 255 ), 0, 0 );
  point( position.x, position.y );
  
 }
 void move()  {
  checkWalls();
  this.position.add(this.velocity);
  this.velocity.limit( maxVel );
  this.velocity.add(this.acceleration);
  if ( this.velocity.mag() != 0 )
    this.velocity.sub( 1, 1, 1);
  this.acceleration.mult(0);
 }
 void attract( ArrayList<Body> bodies )  {
  for ( int i = 0 ; i < bodies.size() ; i++ )  {
   Body b = bodies.get( i );
   float dist = dist( position.x, position.y, position.z,
                      b.position.x, b.position.y, b.position.z );
   if ( dist < 200 )  {
    applyForce( b.position, b.r );
   }     
  }
 }
 void applyForce( PVector p, float rad )  {
   float dist = PVector.dist( this.position, p );
   if ( dist < this.r+this.r )  {
     this.acceleration.mult( 0 );
   } else {
     float f = this.r*rad/(dist);
     this.acceleration = new PVector( this.position.x - p.x, this.position.y - p.y );
     this.acceleration.normalize();
     this.acceleration.mult( f ); 
   }
 }
 void checkWalls()  {
  if ( this.position.x + this.r > width ) {
   this.velocity.x = -1 * abs(this.velocity.x); 
  }
  if ( this.position.x - this.r < 0 ) {
   this.velocity.x = abs(this.velocity.x); 
  }
  if ( this.position.y + this.r > height ) {
   this.velocity.y = -1 * abs(this.velocity.y); 
  }
  if ( this.position.y - this.r < 0 ) {
   this.velocity.y = abs(this.velocity.y); 
  }
 }
}
