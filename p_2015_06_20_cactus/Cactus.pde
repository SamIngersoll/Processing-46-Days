
class Cactus  {
 PVector position;
 PShape cactus;
 Cactus( float x, float y, float z, 
         float tall, int detailH, int detailR, float radius)  {
   this.position = new PVector( x,y,z );
   cactus = createShape();
   cactus.beginShape( QUAD );  // Drawing quads
   cactus.noStroke();
   float initialRad = radius/2;  // Radius of small end of cactus
   float theta=TWO_PI/detailR;  // Radius increment
   int counter = 1;  
   int green = 100; // Color of cactus
   color[] flowerCol = { color(random(200, 255), random(200),100), color(random(200, 255), random(200),100) };  // Color of the flower
   boolean goingDown = false;  // Boolean to know if the radius should be decreasing
   for ( int i=0 ; i<=detailH ; i++ )  {  // Iterates over vertical layers
     for ( int j=0 ; j<=detailR ; j++ )  {  // Iterates around radius
       if ( i < detailH-1 && i < detailH-5 )  {  // if we the radius should stay the same ie. we are not tapering or drawing the flower
         cactus.fill(0,green,0);
         cactus.vertex( initialRad*cos(theta*j)+x, -tall/detailH*i+y, initialRad*sin(theta*j)+z );
         cactus.vertex( initialRad*cos(theta*(j+1))+x, -tall/detailH*i+y, initialRad*sin(theta*(j+1))+z );
         cactus.vertex( (initialRad)*cos(theta*(j+1))+x, -tall/detailH*(i+1)+y, (initialRad)*sin(theta*(j+1))+z );
         cactus.vertex( (initialRad)*cos(theta*j)+x, -tall/detailH*(i+1)+y, (initialRad)*sin(theta*j)+z );
       }
       else if ( i < detailH-1 )  {  // If we are tapering near the top of the cactus
         goingDown = true;
         cactus.fill( 0, green, 0 );
         float count = (initialRad/10)*counter;
         cactus.vertex( (initialRad-counter+0.5)*cos(theta*j)+x, -tall/detailH*i+y, (initialRad-counter+0.5)*sin(theta*j)+z );
         cactus.vertex( (initialRad-counter+0.5)*cos(theta*(j+1))+x, -tall/detailH*i+y, (initialRad-counter+0.5)*sin(theta*(j+1))+z );
         cactus.vertex( (initialRad-counter-counter+0.5)*cos(theta*(j+1))+x, -tall/detailH*(i+1)+y, (initialRad-counter-counter+0.5)*sin(theta*(j+1))+z );
         cactus.vertex( (initialRad-counter-counter+0.5)*cos(theta*j)+x, -tall/detailH*(i+1)+y, (initialRad-counter-counter+0.5)*sin(theta*j)+z );
       }
       else if ( i >= detailH-1 )  {  // If we are drawing the flower
         goingDown = false;
         cactus.fill(flowerCol[ detailH-i ]);
         cactus.vertex( (initialRad-counter)*cos(theta*(j+1))+x, -tall/detailH*(i-1)+y, (initialRad-counter)*sin(theta*(j+1))+z );
         cactus.vertex( (initialRad-counter)*cos(theta*j)+x, -tall/detailH*(i-1)+y, (initialRad-counter)*sin(theta*j)+z );
         cactus.vertex( (initialRad/2)*cos(theta*j)+x, -tall/detailH*(i+1)+y, (initialRad/2)*sin(theta*j)+z );
         cactus.vertex( (initialRad/2)*cos(theta*(j+1))+x, -tall/detailH*(i+1)+y, (initialRad/2)*sin(theta*(j+1))+z );
       }
     }
     if ( goingDown )  {  // If we are tapering, decrease our radius
          counter+=counter+0.5;  
     }
     green+=10;  // Make our green color lighter
   }
   cactus.endShape();  // Closes cactus shape
 }
 void draw()  {  // Draws cactus
  shape(this.cactus); 
 }
}