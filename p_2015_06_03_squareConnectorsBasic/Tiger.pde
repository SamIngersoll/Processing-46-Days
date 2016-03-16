
class Tiger  {
   color skinColor = color( random(255), random(255), random(255) );  // Color of object
   float radius = random( 10, 300 );  // Size of object
   float x = random( width );  // X position of object
   float y = random( height );  // Y position of object
   float velocityX = 0;  // X velocity of object
   float velocityY = 0;  // Y velocity of object
   float speed = random( 1, 5 );  // Base speed
   float sw = random( 50 );  // Strokeweight
   Tiger()  {   // Empty constructor
   } 
   Tiger( int x, int y )  {  // Constructor for position
     this.x = x;
     this.y = y;
   } 
   
   void draw()  {
     strokeWeight( this.sw );  // Sets strokweight to current strokweight
     stroke( skinColor );  // Sets stroke color to skincolor
     rect( x, y, radius, radius );  // Draws the object
   }
   
   void connect()  {
     strokeWeight( random( 3 ) );  // Sets strokeweight for lines between objects
     for ( int i = 0 ; i < tigers.size() ; i++ )  {  // Iterates over objects
       if ( tigers.get(i) != this )  {  // Checks if current object is self
         if ( abs(dist( tigers.get(i).x, tigers.get(i).y, this.x, this.y )) < 300 ) {  // If the distance is less than 300
            line( tigers.get(i).x, tigers.get(i).y, this.x, this.y );  // Draws lines between selected objects
            line( tigers.get(i).x + tigers.get(i).radius, tigers.get(i).y + tigers.get(i).radius,
                  this.x + this.radius, this.y + this.radius );
            line( tigers.get(i).x, tigers.get(i).y + tigers.get(i).radius,
                  this.x, this.y + this.radius );
            line( tigers.get(i).x + tigers.get(i).radius, tigers.get(i).y,
                  this.x + this.radius, this.y);
            move( i );  // Moves the object
            this.radius -= 0.5;  // Decreases the radius
         }
       }
     }
   }
   
   void move( int i )  {  // Moves object
     if ( this.x + this.radius/2 < tigers.get(i).x + tigers.get(i).radius/2 )
       this.x += this.speed;
     if ( this.x + this.radius/2 > tigers.get(i).x + tigers.get(i).radius/2 )
       this.x -= this.speed;
     if ( this.y + this.radius/2 < tigers.get(i).y + tigers.get(i).radius/2 )
       this.y += this.speed;
     if ( this.y + this.radius/2 > tigers.get(i).y + tigers.get(i).radius/2 )
       this.y -= this.speed;
     x += velocityX;
     y += velocityY;
   }
   
   void checkEdges()  {  // Bounces objects off of walls
    if ( this.x + this.radius > width )  
      this.velocityX = -1.01*this.speed;
    if ( this.x < 0 )  
      this.velocityX = 1.01*this.speed;
    if ( this.y + this.radius > height )  
      this.velocityY = -1.01*this.speed;
    if ( this.y < 0 )  
      this.velocityY = 1.01*this.speed;
   }
   
   void checkRadius( int i )  {  // Checks if object needs to be deleted
     if ( radius < 0 )  {
      tigers.remove( i ); 
      tigers.add( new Tiger() );
     }
   }
}
