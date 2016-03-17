
class Knot  {
  float maxLength;
  PVector position, velocity, acceleration;
  boolean anchored;
  Knot( float x, float y, float maxLength, boolean anchored )  {
    this.position = new PVector( x, y );
    this.velocity = new PVector();
    this.acceleration = new PVector();
    this.maxLength = maxLength;
  }
  void move()  {  // Move knot by gravity
   applyGravity();
   this.velocity.add(this.acceleration);
   this.position.add(this.velocity);
   println( this.acceleration );
   this.acceleration.mult(0);
   this.velocity.div(1.09);
   
  }
  void draw()  {  // Draws knot
   strokeWeight( 3 );
   point( position.x, position.y ); 
  }
  void applyGravity()  {  // Apply gravity
   this.acceleration.add( gravity ); 
   this.acceleration.add( wind );
  }
  PVector applyForce( PVector kPosition )  {  // Applies force based on position
    PVector f = PVector.sub(this.position,kPosition);
    f.mult(-0.04);
    f.div(this.maxLength);
    this.acceleration.add( f );
    return f;
  }
}