Pin[] pins = new Pin[10];
Ball b;

void setup()  {
  size( 800, 800 );
  background( 255 );
  noStroke();
  b = new Ball( width/2, 0, 20 );
  for ( int i=0 ; i<pins.length ; i++ )  {
   pins[i] = new Pin( random(width), random(height), random(300) ); 
  }
}
void draw()  {
  b.draw();  // Draws ball
  b.update();  // Updates ball position
  b.checkCollisions( pins );  // Checks for hits
  for ( int i=0 ; i<pins.length ; i++ )  {  // Draws all pins
   pins[i].draw(); 
  }
}

void mousePressed()  {
 setup(); 
}

void keyPressed()  {
 if ( key == 's' )  {
  saveFrame( "ballAndPegs_###.png" );
 } 
}