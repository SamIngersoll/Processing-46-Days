import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

Point[][] points;
int H = 20;
int W = 20;
Point p;
PeasyCam cam;

void setup()  {
 size( 800, 800, P3D ); 
 cam = new PeasyCam( this, width/2, height/2, 0, 800 );
 points = new Point[W][H];
 p = new Point( width+10, height, 0 );
 for ( int i=0 ; i<W ; i++ )  {
  for ( int j=0 ; j<H ; j++ )  {
   points[i][j] = new Point( width/W*i + width/W/2, height/H*j + height/H/2, 100*noise(i,j));
  }
 }
}
void draw()  {
  stroke( 255, 100, 100 );
  background( 255 );
  followMouse();
  shape( drawShape() );
  stroke( 255, 255, 255 );
  strokeWeight( 10 );
  p.draw();
}

PShape drawShape()  {
  strokeWeight( 1 );
  PShape sh = createShape();
  sh.beginShape( TRIANGLES );
  for ( int i=0 ; i<W ; i++ )  {
    for ( int j=0 ; j<H ; j++ )  {
      points[i][j].draw();
      if ( j > 0 && i > 0 )  {
       sh.fill( 255 - PVector.dist(points[i][j].position, p.position ),
                255 - PVector.dist(points[i][j].position, p.position )/2,
                255 - PVector.dist(points[i][j].position, p.position )/2 );
       sh.stroke( 255 - PVector.dist(points[i][j].position, p.position ),
                255 - PVector.dist(points[i][j].position, p.position )/4,
                255 - PVector.dist(points[i][j].position, p.position )/4 );
       sh.vertex( points[i-1][j-1].position.x, points[i-1][j-1].position.y, points[i-1][j-1].position.z );
       sh.vertex( points[i][j-1].position.x, points[i][j-1].position.y, points[i][j-1].position.z );
       sh.vertex( points[i][j].position.x, points[i][j].position.y );
      }
      if ( j<H-1 && i<W-1 )  {
       sh.stroke( 255 - PVector.dist(points[i][j].position, p.position ),
                255 - PVector.dist(points[i][j].position, p.position )/4,
                255 - PVector.dist(points[i][j].position, p.position )/4 );
       sh.fill( 255 - PVector.dist(points[i][j].position, p.position ),
                255 - PVector.dist(points[i][j].position, p.position )/2,
                255 - PVector.dist(points[i][j].position, p.position )/2 );
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

void followMouse()  {
  PVector click = new PVector( mouseX, mouseY, 0);
  float distance = 100;
  PVector pointHolder = new PVector();;
  for ( int i=0 ; i<W ; i++ )  {
    for ( int j=0 ; j<H ; j++ )  {
      if ( abs(PVector.dist( points[i][j].position, click ) ) < distance )  {
        pointHolder = new PVector( i, j );
        distance = abs(PVector.dist( points[i][j].position, click ) );
      }
    } 
  }
  p = points[(int)pointHolder.x][(int)pointHolder.y];
}

void keyPressed()  {
 if ( key == 's' )  {
  saveFrame( "gridProximity_###.png" );
 } 
}
