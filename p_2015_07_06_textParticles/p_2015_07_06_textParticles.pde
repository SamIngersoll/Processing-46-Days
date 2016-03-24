PImage img;
PT[] PTs = new PT[3000];
float counterX = random( 100000 );
float counterY = random( 100000 );
void setup()  {
  size( 800, 800 );
  noStroke();
  img = loadImage( "words.jpg" );
  float offsetX = random(0, 3);
  float offsetY = random(0, 3);
  for ( int i=0 ; i<PTs.length ; i++ )  {
//   PTs[i] = new PT( random(width), random(height), random(3, 20) ); 
//   PTs[i] = new PT( random(width), random(height), random(3, 20), random(10,1.5), random(-10,-1.5) ); 
    PTs[i] = new PT( (width*noise(counterX)*3)-(offsetX*width), (height*noise(counterY)*3)-(offsetY*height), 
    random(3, 20) ); 
    counterX+=0.1;
    counterY+=0.1;
  }
}
void draw()  {
  background( 255, 255, 255, 0 );
  for ( int i=0 ; i<PTs.length ; i++ )  {
   PTs[i].draw(); 
   if ( !PTs[i].dead )  {
     PTs[i].update();
     PTs[i].check();
//     PTs[i].checkWalls(); 
     PTs[i].attract();
   }
  }
  saveFrame( "textParticles_gif_###.png" );
}
void mousePressed()  {
 setup(); 
}

void keyPressed()  {
 saveFrame( "textParticles_###.png" ); 
}