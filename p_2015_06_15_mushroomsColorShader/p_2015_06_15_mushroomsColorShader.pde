PShape mass;
PShape bg;
int rotationalSegments = 10;
float angle = 0;
float counter; 
color bgColor;

void setup()  {
  size( 800, 800, P3D );
  counter = random( 10000000 );
  mass = createMass();
  bg = createBG();
  bgColor = color( random(255),random(255),random(255) );
}

void draw()  {
  background( bgColor );
  pushMatrix();
  translate( width/2, height/2 );
  rotateY(angle);  
  shape( mass );
  popMatrix();
  shape(bg);
  angle += 0.01;
}

PShape createMass()  {
 PShape sh = createShape();
 sh.beginShape( QUAD_STRIP );
 sh.stroke( 255, 0, 0, 20);
 sh.normal(0, 0, 1);
 int heightSegments = (int)random( 2, 20 );
 float oldh = 0;
 float r2 = map(noise(counter-1), -1, 1, 0, 130 );
 for ( int j = 0 ; j < heightSegments ; j++ )  {
   float r = map(noise(counter), 0, 1, 10, 200 );
   float h = random( 10,300/heightSegments*3.5 )+oldh;
   color col1 = color( random(255),random(255),random(255) );
   color col2 = color( random(255),random(255),random(255) );
   for ( int i = 0 ; i <= rotationalSegments ; i++ )  {
     if ( j < heightSegments-1)  {
       float angle = TWO_PI/rotationalSegments;
       float x = sin( i*angle );
       float z = cos( i*angle );
       sh.fill( col1 );
       sh.vertex( x * r2, -300+oldh, z * r2 );
       sh.fill( col2 );
       sh.vertex( x * r, -300+h, z * r );
     }
   }
   r2 = r;
   counter++;
   oldh= h;
 }
 sh.endShape();
 return sh;
}
PShape createBG()  {
  color col1 = color( random(255),random(255),random(255) );
  color col2 = color( random(255),random(255),random(255) );
  PShape sh = createShape();
  sh.beginShape( QUAD );
  sh.noStroke();
  sh.normal( 0, 0, 1 );
  sh.fill( col1 );
  sh.vertex( 0,0,-300);
  sh.vertex( width, 0, -300 );
  sh.fill( col2 );
  sh.vertex( width, height, -300 );
  sh.vertex( 0, height, -300 );
  sh.endShape();
  return sh;
}

void mousePressed()  {
 setup(); 
}

void keyPressed()  {
 if ( key == 's' )  {
  saveFrame( "mushRoomsColorShader_###.png" );
 } 
}
