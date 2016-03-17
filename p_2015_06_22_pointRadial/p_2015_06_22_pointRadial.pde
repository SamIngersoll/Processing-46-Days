// SAM INGERSOLL //
// Click to create ripple
// Drag to rotate

import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

Point[][] points;
int H = 20;
int W = 20;
Point p;
PeasyCam cam;
PVector origin;
boolean startRipple = false;
float colCo = 0.01;
int distCounter = 0;
float rippleThickness = 100;

void setup()  {
 size( 800, 800, P3D ); 
 cam = new PeasyCam( this, width/2, height/2, 0, 800 );
 points = new Point[W][H];
 p = new Point( width+10, height, 0 );
 for ( int i=0 ; i<W ; i++ )  {  // Create points for plane
  for ( int j=0 ; j<H ; j++ )  {
     points[i][j] = new Point( width/W*i + width/W/2, height/H*j + height/H/2, 0);
  }
 }
}
void draw()  {
  stroke( 255, 100, 100 );
  background( 255 );
//  followMouse();
  shape( drawShape() );
  stroke( 255, 255, 255 );
  strokeWeight( 10 );
  if ( startRipple )  {  // If we have a ripple going on, continue it
    ripple();
  }
}

PShape drawShape()  {
  strokeWeight( 1 );
  PShape sh = createShape();
  sh.beginShape( TRIANGLES );
  sh.fill( 255, 100, 100, 100 );
  for ( int i=0 ; i<W ; i++ )  {  // Creates a grid and connects the points to form triangles
    for ( int j=0 ; j<H ; j++ )  {
      if ( j > 0 && i > 0 )  {
       sh.stroke( points[i][j].str );
       sh.vertex( points[i-1][j-1].position.x, points[i-1][j-1].position.y, points[i-1][j-1].position.z );
       sh.vertex( points[i][j-1].position.x, points[i][j-1].position.y, points[i][j-1].position.z );
       sh.vertex( points[i][j].position.x, points[i][j].position.y );
      }
      if ( j<H-1 && i<W-1 )  {
       sh.stroke( points[i][j].str );
       sh.vertex( points[i+1][j+1].position.x, points[i+1][j+1].position.y, points[i+1][j+1].position.z );
       sh.vertex( points[i][j+1].position.x, points[i][j+1].position.y, points[i][j+1].position.z );
       sh.vertex( points[i][j].position.x, points[i][j].position.y );
      }
    }
  }
  sh.endShape();
  point( p.position.x, p.position.y, p.position.z );
  return sh;
}
void mousePressed()  {  // Onclick, save mouse position
 origin = new PVector( mouseX, mouseY );
 startRipple = true;
 distCounter = 0;
 rippleThickness = 100;
}

void keyPressed()  {  // If the 's' key is pressed, save the current frame
 if ( key == 's' )  {
  saveFrame( "gridProximity_###.png" );
 } 
}