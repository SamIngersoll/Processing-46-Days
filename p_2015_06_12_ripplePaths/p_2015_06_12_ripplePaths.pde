// Sam Ingersoll //
  // Click mouse to create ripple
  // Press SPACEBAR to kill all circles
  // Press 'p' to let circles leave screen and be removed
  // Press 's' to save the screen as a .png
  // Press the number keys to change the size of the next ripple 
  //  (1-9, to get larger ripples, change rippleSize global variable)

ArrayList<Ripple> ripples;                 // List containing ripples currently being used
int rippleSize = 3;                        // Number of circles per ripple
float particleSizeIncrement = 0.1;       // How fast the radius of the particle grows
float particleOffsetAngle = PI/4;          // Angle to rotate the ripple

// Colors
color lifeColor = color( 255, 255, 255 );  // Particle color in life
color deathColor = color( 0 );             // Particle color in death
color strokeColor = color( 0, 0, 0 );      // Color of particle stroke

void setup()  {
 size( 800, 800 );
 background( 255 );
 ripples = new ArrayList<Ripple>();
 fill( lifeColor ); // Sets fill to lifeColor
 stroke( strokeColor );  // Sets stroke to strokeColor
}
void draw()  {
  for ( int i = 0 ; i < ripples.size() ; i++ )  {  // Iterates through currently active ripples
   ripples.get(i).draw();  // draws current ripple
   ripples.get(i).move();  // moves current ripple
   
   // Checks whether ripples were told to leave screen or bounce
   if ( !ripples.get(i).kill )  {  // If the ripple has NOT been asked to leave screen
     ripples.get(i).checkWalls();  // Checks if current ripple needs to bounce off wall
   }  else  {                      // If the current ripple has been asked to leave screen ('p' key)
     ripples.get(i).checkDeath();  // Checks if the ripple is far enough off the screen to be removed
     ripples.get(i).clean();       // Removes ripples that are far enough off the screen
   }  
  }
  saveFrame( "ripplePaths_gif_###.png" );
}

void mousePressed()  {  // If mouse is pressed
  draw();  
  ripples.add( new Ripple( mouseX, mouseY, rippleSize ) );  // Adds a new ripple at point of click
}

void keyPressed()  {  // If ANY key is pressed
 if ( key == ' ' )  { // If the SPACEBAR is pressed
   fill( deathColor );              // Changes circle fill to the deathColor
   draw();               // Draws the black circle
   ripples.clear();      // Removes all ripples currently in use
   fill( lifeColor );          // Sets fill back to the lifeColor
 }
 if ( key == 'p' )  {  // If the 'p' key is pressed
   // Iterates through currently active ripples
   for ( int i = 0 ; i < ripples.size() ; i++ )  {  
     ripples.get( i ).kill = true;  // Tells all current ripples that they should leave the screen
   }
 }
 if ( key == 's' )  {  // If the 's' key is pressed
  saveFrame( "ripplePaths_###.png" );   // Saves the current frame to the sketch folder
 }
 if ( key == 'c' )  {  // If the 'c' key is pressed
   background( 255 );
   ripples.clear();
 }
 if ( key == '1' )
   rippleSize = 1;
 if ( key == '2' )
   rippleSize = 2;
 if ( key == '3' )
   rippleSize = 3;
 if ( key == '4' )
   rippleSize = 4;
 if ( key == '5' )
   rippleSize = 5;
 if ( key == '6' )
   rippleSize = 6;
 if ( key == '7' )
   rippleSize = 7;
 if ( key == '8' )
   rippleSize = 8;
 if ( key == '9' )
   rippleSize = 9;
}