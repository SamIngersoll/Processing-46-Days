
// Particles are what ripples are made up of, they are the little circles.

class Particle  {  
 float x, y,         // x and y coordinates of the particle
       xVel, yVel,   // x and y velocities of the particle
       r;            // radius of the particle
 boolean death;      // Whether or not the particle should be removed from the ripple 
                     // (if 'p' key or SPACEBAR have been pressed)
 Particle( float x, float y, float xVel, float yVel )  {  // Values that must be passed to create the particle
  this.x = x;
  this.y = y;
  this.xVel = xVel;
  this.yVel = yVel;
  this.r = 10;
  this.death = false;
 }
 void draw()  {  // Draws the particle as an ellipse
  ellipse( x, y, r, r );
 } 
 void move()  {  // Moves the particle by adding xVelocity and yVelocity to x and y values
   this.x += 5*this.xVel;
   this.y += 5*this.yVel;
 }
 void incrementSize()  {  // Increses the radius of the particle by 0.1
  this.r += particleSizeIncrement; 
 }
 void checkWalls()  {  // Checks if the particle has hit a will, if so, turns it around
  if ( this.y + this.r/2 > height )  // If the particle is below the end of the page
   this.yVel = -1 * abs( yVel );
  if ( this.y - this.r/2 < 0 )       // If the particle is above the beginning of the page
   this.yVel = abs( yVel );
  if ( this.x + this.r/2 > width )   // If the particle is to the right of the end of the page
   this.xVel = -1 * abs( xVel );
  if ( this.x - this.r/2 < 0 )       // If the particle is to the left of the beginning of the page
   this.xVel = abs( xVel ); 
 }
 void checkDeath()  {  // Checks whether the particle is so far off of the page that is can be removed
                       // Only called if 'p' key has been pressed
   if ( this.y - this.r > height )
   this.death = true;
  if ( this.y + this.r < 0 )
   this.death = true;
  if ( this.x - this.r > width )
   this.death = true;
  if ( this.x + this.r < 0 ) 
   this.death = true;
 }
}