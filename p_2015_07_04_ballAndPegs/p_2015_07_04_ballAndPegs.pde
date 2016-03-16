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
  b.draw();
  b.update();
  b.checkCollisions( pins );
  for ( int i=0 ; i<pins.length ; i++ )  {
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
