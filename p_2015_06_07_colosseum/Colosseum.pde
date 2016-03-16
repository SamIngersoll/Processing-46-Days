
class Colosseum  {
 PVector position;  // The position
 PShape colosseum;  // The shape
 Colosseum( float x, float y, float z, 
         float tall, int detailH, int detailR, float radius)  {
   this.position = new PVector( x,y,z );
   colosseum = createShape();
   colosseum.beginShape( QUAD );
   float initialRad = (radius/detailH)/2+20;
   float newRad = sq(detailH)/4;
   float theta=TWO_PI/detailR;
   for ( int i=0 ; i<detailH ; i++ )  {  // Iterates over height
     for ( int j=0 ; j<=detailR ; j++ )  {  // Iterates over radius
       if ( i < detailH-1  )  {  // Draws quads to the previous level

         colosseum.vertex( initialRad*i*cos(theta*j), -tall/detailH*i, initialRad*i*sin(theta*j) );
         colosseum.vertex( initialRad*i*cos(theta*(j+1)), -tall/detailH*i, initialRad*i*sin(theta*(j+1)) );
         colosseum.vertex( initialRad*i*cos(theta*(j+1)), -tall/detailH*(i+1), initialRad*i*sin(theta*(j+1)) );
         colosseum.vertex( initialRad*i*cos(theta*j), -tall/detailH*(i+1), initialRad*i*sin(theta*j) );
       }  else if ( i < detailH-1 )  {
         float counter = detailH-i;
         colosseum.vertex( sqrt(newRad*counter)*cos(theta*j), tall/detailH*i, sqrt(newRad*counter)*sin(theta*j) );
         colosseum.vertex( sqrt(newRad*counter)*cos(theta*(j+1)), tall/detailH*i, sqrt(newRad*counter)*sin(theta*(j+1)) );
         colosseum.vertex( sqrt(newRad*counter)*cos(theta*(j+1)), tall/detailH*(i+1), sqrt(newRad*counter)*sin(theta*(j+1)) );
         colosseum.vertex( sqrt(newRad*counter)*cos(theta*j), tall/detailH*(i+1), sqrt(newRad*counter)*sin(theta*j) );
       }  else if ( i == detailH-1 )  {
         
       }
     }
   }
   colosseum.endShape();  // Closes the shape
 }
 void draw()  {
  shape(colosseum); // Draws the shape
 }
}
