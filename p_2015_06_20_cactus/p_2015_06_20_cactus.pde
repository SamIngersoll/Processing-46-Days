import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PImage bg;
ArrayList<Cactus> cacti;
int numCacti = 10;
PeasyCam cam;
float angle;
float noiseScale = 0.2;
int space = 30;
int numX = 50;
int numY = 50;
int length = numX * numY;
float startX;
float startY;
Point[] sand = new Point[ length ];

void setup()  {
  size(800,800,P3D);
  background( 255 );
  bg = loadImage( "background.png" );
  startX = width/2 - ( ( 0.5 * numX ) * space );
  startY = height/2 - ( ( 0.5 * numY ) * space );
  cacti = new ArrayList<Cactus>();
  for ( int i = 0 ; i < numCacti ; i++ )  {
    cacti.add( new Cactus( random(-100, 100 ), 50, random(-100, 100 ), random( 50, 200 ), 20, 20, 30 ) );
    println( i );
  }
  cam = new PeasyCam( this, 0, -50, 0,300 );
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(500);
  
  for ( int d = 0 ; d < numY ; d++ )
  {
    for ( int c = 0 ; c < numX ; c++ )
    {
      sand[ d*numX + c ] = new Point( ( startX + c*space ), 250*noise( c*noiseScale, d*noiseScale ) , ( startY ));
      sand[ d*numX + c ].display();
    }
    startY += space;
  }
}

void draw()  {
  background( bg );
  cam.rotateY(angle);
  for ( int i = 0 ; i < numCacti ; i++ )  {
    cacti.get( i ).draw();
    
  }
  angle = 0.01;
    
  for ( int c = 0 ; c < ( numY - 1 ) ; c++ )
  {
    for ( int d = 0 ; d < ( numX - 1 ) ; d++ )
    {
      noStroke();
      fill( 255-sand[ c*numY + d ].y, 255-sand[ c*numY + d ].y - 70, 0 );
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

void mousePressed()  {
 setup(); 
}

void keyPressed()  {
 if ( key == 's' )  {
  saveFrame( "cacti_###.jpg" );
 } 
  
}
