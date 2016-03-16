int numDotsRings;
ArrayList<DotsRing> dotsRings = new ArrayList<DotsRing>();
int numRings;
ArrayList<Ring> rings = new ArrayList<Ring>();
int numRods;
ArrayList<Rod> rods = new ArrayList<Rod>();
Rod r;
float cameraCounter = 0;
float counter = 0;
float increment = 0.01;

void setup()  {
  numDotsRings = (int)random( 2, 50 );
  numRings = (int)random( 1, 10 );
  numRods = (int)random( 1, 5 );
  size( 800, 800, P3D );
  strokeWeight( 1 );
  r = new Rod( 0, -300, 0, random( 30, 50 ), 0, random( 1000, 2000 ), (int)random( 4, 10 ) );
  for ( int i = 0 ; i < numDotsRings ; i++ )  {
    dotsRings.add( new DotsRing( 0, random( -500, 500 ), 0, 
                   random( 100, 200 ), (int)random( 10, 100 ) ) );
  }
  for ( int i = 0 ; i < numRods ; i++ )  {
    rods.add( new Rod( 0, random( -500, 500 ), 0, random( 100, 200 ), random( 100, 200 ), 
                       random( 4, 100 ), (int)random( 10, 50 ) ) );
  }
  for ( int i = 0 ; i < numRings ; i++ )  {
    boolean complete;
    int bool = (int)random( -0.4999, 1.4999 );
    if ( bool == 1 )
      complete = true;
    else 
      complete = false; 
    rings.add( new Ring( 0, random( -400, 400 ), 0, random( 80, 100 ), random( 110, 200 ), complete, (int)random( 6, 20 ) ) );
  }
}

void draw()  {
  camera(1.5*mouseX, 1.5*mouseY, (mouseY+200/2.0) / tan(PI*30.0 / 180.0), 
         0, 0, 0, 0.5, 0, 0);
  background( 0 );
  rotateX(cameraCounter);
  for ( int i = 0 ; i < dotsRings.size() ; i++ )  {
   pushMatrix();
   rotateY( noise(counter+dotsRings.get(i).offset) );
   translate( 0, 200*noise(counter+dotsRings.get(i).offset), 0 );
   dotsRings.get( i ).draw(); 
   popMatrix();

  }
  for ( int i = 0 ; i < rods.size() ; i++ )  {
   rotateY( noise(counter+rods.get(i).offset) );
   translate( 0, 200*noise(counter+rods.get(i).offset), 0 );
   rods.get( i ).draw(); 
  }
  for ( int i = 0 ; i < rings.size() ; i++ )  { 
   rotateY( noise(counter+rings.get(i).offset) );
   translate( 0, 200*noise(counter+rings.get(i).offset), 0 );
   rings.get( i ).draw(); 
  }
  rotateY( noise(counter+r.offset) );
  translate( 0, 200*noise(counter+r.offset), 0 );
  r.draw();
  counter += increment;
  cameraCounter += 0.01;
}

void mousePressed()  {
 dotsRings.clear(); 
 rings.clear();
 rods.clear();
 setup();
}

void keyPressed()  {
 if ( key == 's' )  {
  saveFrame( "uiCylinder_###.png" );
 } 
}
