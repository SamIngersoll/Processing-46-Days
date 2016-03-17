PShape mass;  // Our mushroom object
PShape bg;  // Our background gradient
int rotationalSegments = 10;  // Our radial resolution
float angle = 0;  // Our rotational counter
float counter;  // Random noise seed
color bgColor;  // Background color

void setup()  {
  size( 800, 800, P3D );
  counter = random( 10000000 );  // Initialize random noise seed randomly
  mass = createMass();  // Create our mushroom object
  bg = createBG();  // Create our background gradient object
  bgColor = color( random(255),random(255),random(255) );  // Set our background color randomly
}

void draw()  {
  background( bgColor ); 
  pushMatrix();  // Begin transformations
  translate( width/2, height/2 );  // Move to center of the screen
  rotateY(angle);  // Rotate about the center of the screen
  shape( mass );  // Draw our shape
  popMatrix();  // End transformations
  shape(bg);  // Draw our background gradient
  angle += 0.01;  // Increment our angle counter
  saveFrame( "mushRoomsColorShader_gif_###.png" );
}

PShape createMass()  {  // Function for creating mushroom object
 PShape sh = createShape();  // Initialize shape object
 sh.beginShape( QUAD_STRIP );  // Begin shape, we will be using quads
 sh.stroke( 255, 0, 0, 20);
 int heightSegments = (int)random( 2, 20 );  // Number of vertical layers in shape
 float oldh = 0;  // Variable to save the old height
 float r2 = map(noise(counter-1), -1, 1, 0, 130 );  // Initial value for first radius
 for ( int j = 0 ; j < heightSegments ; j++ )  {  // Iterates through layers
   float r = map(noise(counter), 0, 1, 10, 200 );  // Value for second radius
   float h = random( 10,300/heightSegments*3.5 )+oldh;  // Distance between layers
   color col1 = color( random(255),random(255),random(255) );  // Color of first layer
   color col2 = color( random(255),random(255),random(255) );  // Color of second layer
   for ( int i = 0 ; i <= rotationalSegments ; i++ )  {  // Iterates around radius
     if ( j < heightSegments-1)  {  // Tests to make sure that we are not on the last layer
       float angle = TWO_PI/rotationalSegments;
       float x = sin( i*angle );
       float z = cos( i*angle );
       sh.fill( col1 );
       sh.vertex( x * r2, -300+oldh, z * r2 );  // Make vertex at first height
       sh.fill( col2 );
       sh.vertex( x * r, -300+h, z * r );  // Make vertex at second height
     }
   }
   r2 = r;  // Update old radius with current radius
   counter++; // Update random noise seed
   oldh= h;  // Update old height with current height
 }
 sh.endShape();  // Close our shape
 return sh;  // Return our shape
}
PShape createBG()  {  // Creates a background gradient
  color col1 = color( random(255),random(255),random(255) ); 
  color col2 = color( random(255),random(255),random(255) );
  PShape sh = createShape();  // Initialize shape
  sh.beginShape( QUAD );  // We will be creating a single quad
  sh.noStroke();
  sh.fill( col1 );  // Set vertex colors for first two verts
  sh.vertex( 0,0,-300); 
  sh.vertex( width, 0, -300 );
  sh.fill( col2 );  // Set vertex colors for second two verts
  sh.vertex( width, height, -300 );
  sh.vertex( 0, height, -300 );
  sh.endShape();  // Close our shape
  return sh;  // Return our shape
}

void mousePressed()  {  // If the mouse is pressed, clear workspace and restart
 setup(); 
}

void keyPressed()  {  // If the 's' key is pressed, save the current frame
 if ( key == 's' )  {
  saveFrame( "mushRoomsColorShader_###.png" );
 } 
}