PImage img;
PT[] PTs = new PT[3000];

void setup()  {
  size( 800, 800 );
  noStroke();
  img = loadImage( "words.jpg" );
  for ( int i=0 ; i<PTs.length ; i++ )  {
   PTs[i] = new PT( random(width), random(height), random(3, 20) ); 
  }
}
void draw()  {
  background( 255 );
  for ( int i=0 ; i<PTs.length ; i++ )  {
   PTs[i].draw(); 
   PTs[i].update();
   PTs[i].check();
   PTs[i].checkWalls(); 
  }
}
