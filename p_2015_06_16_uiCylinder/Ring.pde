

class DotsRing  {
 float x, y, z, r, strokeWeight, offset;
 int numPoints;
 color stroke;
 DotsRing( float x, float y, float z, float r, int numPoints )  {
   this.x = x;
   this.y = y;
   this.z = z;
   this.r = r;
   this.offset = random( -1000, 1000 );
   this.numPoints = numPoints;
   this.strokeWeight = random( 1, 3 );
   this.stroke = color( 100, random( 0, 200 ), random( 200, 255 ) );
 }
 void draw()  {
  strokeWeight( strokeWeight );
  stroke( this.stroke );
  for ( int i = 0 ; i < numPoints ; i++  )  {
   float theta = TWO_PI/numPoints;
   point( this.r*cos(theta*i), y, this.r*sin(theta*i) );
  }
 }
}

class Ring  {
 PShape sh;
 float x, y, z, r1, r2, offset;
 boolean complete;
 int detail, trueDetail;
 Ring( float x, float y, float z, float r1, float r2, boolean complete, int detail )  {
   this.x = x;
   this.y = y;
   this.z = z;
   this.r1 = r1;
   this.r2 = r2;
   this.complete = complete;
   this.detail = detail;
   this.trueDetail = this.detail;
   this.offset = random( -1000, 1000 );
   if ( complete )
     trueDetail /= random( detail );
   this.create();
 }
 void create()  {
  sh = createShape();
  sh.beginShape( QUAD_STRIP );
  sh.stroke( random(100,255), 0, random(100, 255) );
  sh.fill( 0, 0, 255, 50 );
  for ( int i = 0 ; i <= trueDetail ; i++  )  {
   float theta = TWO_PI/detail;
   sh.vertex( this.r1*cos(theta*i), y, this.r1*sin(theta*i) );
   sh.vertex( this.r2*cos(theta*i), y, this.r2*sin(theta*i) );
  } 
  sh.endShape();
 }
 void draw()  {
  shape( sh ); 
 }
}

class Rod  {
 PShape sh;
 float x, y, z, r1, r2, offset, thickness;
 int detail;
 boolean filled;
 Rod( float x, float y, float z, float r1, float r2, float thickness, int detail )  {
   this.x = x;
   this.y = y;
   this.z = z;
   this.r1 = r1;
   this.r2 = r2;
   this.thickness = thickness;
   this.detail = detail;
   this.offset = random( -1000, 1000 );
   this.create();
   int temp = (int)random( -0.4999, 1.4999 );
   if ( temp == 1 )
     filled = true;
   else if ( temp == 0 )
     filled = false;
 }
 void create()  {
  sh = createShape();
  sh.beginShape( QUAD_STRIP );
  sh.stroke( 250, 100, 255 );
  sh.fill( random(255), random(100), 255, random( 255 ) );
  for ( int i = 0 ; i <= detail ; i++ )  {
    float theta = TWO_PI/detail;
    sh.vertex( this.r1*cos(theta*i), y+-thickness/2, this.r1*sin(theta*i)  );
    sh.vertex( this.r1*cos(theta*i), y+thickness/2, this.r1*sin(theta*i) );
  }
  for ( int i = 0 ; i <= detail ; i++ )  {
    float theta = TWO_PI/detail;
    sh.vertex( this.r2*cos(theta*i), y+-thickness/2, this.r2*sin(theta*i)  );
    sh.vertex( this.r2*cos(theta*i), y+thickness/2, this.r2*sin(theta*i) );
  }
  sh.endShape();
 } 
 void draw()  {
  shape( sh ); 
 }
  
}
