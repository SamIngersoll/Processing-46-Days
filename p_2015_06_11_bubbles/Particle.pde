

class Particle  {
  float x, y, r;
  float xVel, yVel;
  Particle()  {  // Constructor, randomly sets values for position and velocity
   this.x = random( width );
   this.y = random( height );
   this.r = random( 40 );
   this.xVel = xVel;
   this.yVel = yVel;
  } 
  void draw()  {
   ellipse( this.x, this.y, this.r, this.r ); 
  }
  void move()  {
  this.x += (noise(counter)-0.5);  // Noise for movement
  this.y += (noise(counter)-0.5);  
  this.x += 0.1;
  }
  
}
