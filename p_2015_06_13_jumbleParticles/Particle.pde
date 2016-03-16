
class Particle  {
 float x, y, 
       xVel, yVel,
       r;
 Particle()  {
  this.x = random( width );
  this.y = random( height );
  this.xVel = random( -1, 1 );
  this.yVel = random( -1, 1 );
  this.r = random( 1, 7 );
 }
 Particle( float x, float y , float xVel, float yVel, float r )  {
  this.x = x;
  this.y = y;
  this.xVel = xVel;
  this.yVel = yVel;
  this.r = r;
 } 
 void draw()  {
  ellipse( this.x, this.y, this.r, this.r ); 
 }
 void move()  {
   this.y += yVel;
   this.x += xVel;
   if (sideWays == 0 )
     this.yVel += g;
   if ( sideWays == 1 )
     this.yVel -= g;
   if ( sideWays == 2 )
     this.xVel -= g;
   if ( sideWays == 3 )
     this.xVel += g;
   checkOthers();
   checkWalls();
 }
 void checkOthers()  {
   for ( int i = 0 ; i < particles.size() ; i++ )  {
    float or = particles.get(i).r;
    float ox = particles.get(i).x;
    float oy = particles.get(i).y;
    if ( abs(this.x - ox) < (or + this.r)/2
      && abs(this.y - oy) < (or + this.r)/2 
      && this.x - ox > 0 )  {
         println( abs(this.x - ox) );
       if ( this.x - particles.get(i).x < 0 ) {
         this.x--;
       } else  {
         this.x++;
       }
       if ( this.y - particles.get(i).y < 0 ) {
         this.y--;
       } else  {
         this.y++;
       }
     }  
   }      
 }
 void checkWalls()  {
  if ( this.x + this.r/2 > width )  {
   this.xVel = -1 * abs( this.xVel )/2;
   this.x -= 4;
  }
  if ( this.x - this.r/2 < 0 )  {
   this.xVel = abs( this.xVel )/2; 
   this.x += 4;
  }
  if ( this.y + this.r/2 > height )  {
   this.yVel = -1 * abs( this.yVel )/2;
   this.y -= 4;
  }
  if ( this.y - this.r/2 < 0 )  {
   this.yVel = abs( this.yVel )/2; 
   this.y += 4;
  }
 }
}
 
