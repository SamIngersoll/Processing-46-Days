
class Tiger  {  // Object
   color skinColor = color( random(255), random(255), random(255) );
   float radius = random( 10, 300 );
   float x = random( width ); 
   float y = random( height );
   float velocityX = 0;
   float velocityY = 0;
   float speed = random( 1, 5 );
   float sw = random( 50 );
   Tiger()  {   
   } 
   Tiger( int x, int y )  {   
     this.x = x;
     this.y = y;
   } 
   
   void draw()  {  // Draws the object
     strokeWeight( this.sw );
     stroke( skinColor );
     rect( x, y, radius, radius );
   }
   
   void connect()  {  // Connects the object's points
     strokeWeight( random( 3 ) );
     for ( int i = 0 ; i < tigers.size() ; i++ )  {
       if ( tigers.get(i) != this )  {
         if ( abs(dist( tigers.get(i).x, tigers.get(i).y, this.x, this.y )) < 300 ) {
            line( tigers.get(i).x, tigers.get(i).y, this.x, this.y );
            line( tigers.get(i).x + tigers.get(i).radius, tigers.get(i).y + tigers.get(i).radius,
                  this.x + this.radius, this.y + this.radius );
            line( tigers.get(i).x, tigers.get(i).y + tigers.get(i).radius,
                  this.x, this.y + this.radius );
            line( tigers.get(i).x + tigers.get(i).radius, tigers.get(i).y,
                  this.x + this.radius, this.y);
            move( i );
            this.radius -= 0.5;
         }
       }
     }
   }
   
   void move( int i )  {  // Moves the object
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
   
   void checkEdges()  {  // Checks if the object is outside the frame
    if ( this.x + this.radius > width )  
      this.velocityX = -1.01*this.speed;
    if ( this.x < 0 )  
      this.velocityX = 1.01*this.speed;
    if ( this.y + this.radius > height )  
      this.velocityY = -1.01*this.speed;
    if ( this.y < 0 )  
      this.velocityY = 1.01*this.speed;
   }
   
   void checkRadius( int i )  {  // Checks if the object needs to be deleted
     if ( radius < 0 )  {
      blow( tigers.get(i).skinColor, tigers.get(i).x, tigers.get(i).y );
      tigers.remove( i ); 
      tigers.add( new Tiger() );
     }
   }
}
