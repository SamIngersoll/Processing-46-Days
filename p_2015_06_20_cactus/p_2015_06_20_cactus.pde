// SAM INGERSOLL //
// Click to reload scene
// Drag to rotate
// Zoom

import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PImage bg;  // Gradient image for background
ArrayList<Cactus> cacti;  // List of cacti
int numCacti = 10;  // Number of cacti
PeasyCam cam;  // Camera
float angle;  // Counter for rotation of camera
float noiseScale = 0.2;  // Noise constant for ground
int space = 30;  // Distance between points on ground
int numX = 50;  // Extent of ground in x direction
int numY = 50;  // Extent of ground in y direction
int length = numX * numY;  // Total number of points in ground
float startX;  // Point at which ground starts
float startY;  // Point at which ground starts
Point[] sand = new Point[ length ];  // Initalize ground point array

void setup()  {
  size(800,800,P3D);
  background( 255 );
  bg = loadImage( "background.png" );  // Load background picture
  startX = width/2 - ( ( 0.5 * numX ) * space );
  startY = height/2 - ( ( 0.5 * numY ) * space );
  cacti = new ArrayList<Cactus>();
  for ( int i = 0 ; i < numCacti ; i++ )  {  // Create cacti
    cacti.add( new Cactus( random(-100, 100 ), 50, random(-100, 100 ), random( 50, 200 ), 20, 20, 30 ) );
  }
  cam = new PeasyCam( this, 0, -50, 0,300 );  // Camera
  cam.setMinimumDistance(300);  // Zoom extents on camera
  cam.setMaximumDistance(500);  // Zoom extents on camera
  
  // Populate ground array
  for ( int d = 0 ; d < numY ; d++ )  // Iterate over rows
  {
    for ( int c = 0 ; c < numX ; c++ )  // Iterate over columns
    {
      sand[ d*numX + c ] = new Point( ( startX + c*space ), 250*noise( c*noiseScale, d*noiseScale ) , ( startY ));  // Creates point for ground with z value according to a random noise function
    }
    startY += space;  // Moves to the next space
  }
}

void draw()  {
  background( bg );  // Set background to gradient image
  cam.rotateY(angle);  // Rotate camera
  for ( int i = 0 ; i < numCacti ; i++ )  {
    cacti.get( i ).draw(); 
  }
  angle = 0.01;  // Rotation iterator for camera rotation
   
  // Draw ground
  for ( int c = 0 ; c < ( numY - 1 ) ; c++ )  // Iterates over rows except the last one, each one is connected to the following one
  {
    for ( int d = 0 ; d < ( numX - 1 ) ; d++ )  // Iterates over columns except the last one, each one is connected to the following one
    {
      noStroke();
      fill( 255-sand[ c*numY + d ].y, 255-sand[ c*numY + d ].y - 70, 0 );  // Color the ground based on the height value
      beginShape();
      vertex( sand[ c*numY + d + 1 ].x, sand[ c*numY + d + 1 ].y/5, sand[ c*numY + d + 1 ].z );
      vertex( sand[ c*numY + numY + d ].x, sand[ c*numY + numY + d ].y/5, sand[ c*numY + numY + d ].z );
      vertex( sand[ c*numY + numY + d + 1 ].x, sand[ c*numY + numY + d + 1 ].y/5, sand[ c*numY + numY + d + 1 ].z );
      vertex( sand[ c*numY + d + 1 ].x, sand[ c*numY + d + 1 ].y/5, sand[ c*numY + d + 1 ].z );
      endShape();
      beginShape();
      vertex( sand[ c*numY + d ].x, sand[ c*numY + d ].y/5, sand[ c*numY + d ].z );
      vertex( sand[ c*numY + d + 1 ].x, sand[ c*numY + d + 1 ].y/5, sand[ c*numY + d + 1 ].z );
      vertex( sand[ c*numY + numY + d ].x, sand[ c*numY + numY + d ].y/5, sand[ c*numY + numY + d ].z );
      vertex( sand[ c*numY + d ].x, sand[ c*numY + d ].y/5, sand[ c*numY + d ].z );
      endShape();
    }
  }
}

void mousePressed()  {  // Restart scene on mouse press
 setup(); 
}

void keyPressed()  {  // Save frame when the 's' key is pressed
 if ( key == 's' )  {
  saveFrame( "cacti_###.jpg" );
 } 
  
}