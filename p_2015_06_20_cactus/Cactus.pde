
class Cactus  {
 PVector position;
 PShape cactus;
 Cactus( float x, float y, float z, 
         float tall, int detailH, int detailR, float radius)  {
   this.position = new PVector( x,y,z );
   cactus = createShape();
   cactus.beginShape( QUAD );
   cactus.noStroke();
   float initialRad = radius/2;
   float step = radius/2/detailH;
   float theta=TWO_PI/detailR;
   int counter = 1;
   int green = 100;
   color[] flowerCol = { color(random(200, 255), random(200),100), color(random(200, 255), random(200),100) };
   boolean goingDown = false;
   for ( int i=0 ; i<=detailH ; i++ )  {
     for ( int j=0 ; j<=detailR ; j++ )  {
       if ( i < detailH-1 && i < detailH-5 )  {
         cactus.fill(0,green,0);
         cactus.vertex( initialRad*cos(theta*j)+x, -tall/detailH*i+y, initialRad*sin(theta*j)+z );
         cactus.vertex( initialRad*cos(theta*(j+1))+x, -tall/detailH*i+y, initialRad*sin(theta*(j+1))+z );
         cactus.vertex( (initialRad)*cos(theta*(j+1))+x, -tall/detailH*(i+1)+y, (initialRad)*sin(theta*(j+1))+z );
         cactus.vertex( (initialRad)*cos(theta*j)+x, -tall/detailH*(i+1)+y, (initialRad)*sin(theta*j)+z );
       }
       else if ( i < detailH-1 )  {
         goingDown = true;
         cactus.fill( 0, green, 0 );
         float count = (initialRad/10)*counter;
         cactus.vertex( (initialRad-counter)*cos(theta*j)+x, -tall/detailH*i+y, (initialRad-counter)*sin(theta*j)+z );
         cactus.vertex( (initialRad-counter)*cos(theta*(j+1))+x, -tall/detailH*i+y, (initialRad-counter)*sin(theta*(j+1))+z );
         cactus.vertex( (initialRad-counter-counter+0.5)*cos(theta*(j+1))+x, -tall/detailH*(i+1)+y, (initialRad-counter-counter+0.5)*sin(theta*(j+1))+z );
         cactus.vertex( (initialRad-counter-counter+0.5)*cos(theta*j)+x, -tall/detailH*(i+1)+y, (initialRad-counter-counter+0.5)*sin(theta*j)+z );
       }
       else if ( i >= detailH-1 )  {
         goingDown = false;
         cactus.fill(flowerCol[ detailH-i ]);
         cactus.vertex( (initialRad-counter)*cos(theta*(j+1))+x, -tall/detailH*(i-1)+y, (initialRad-counter)*sin(theta*(j+1))+z );
         cactus.vertex( (initialRad-counter)*cos(theta*j)+x, -tall/detailH*(i-1)+y, (initialRad-counter)*sin(theta*j)+z );
         cactus.vertex( (initialRad/2)*cos(theta*j)+x, -tall/detailH*(i+1)+y, (initialRad/2)*sin(theta*j)+z );
         cactus.vertex( (initialRad/2)*cos(theta*(j+1))+x, -tall/detailH*(i+1)+y, (initialRad/2)*sin(theta*(j+1))+z );
       }
     }
     if ( goingDown )  {
          counter+=counter+0.5;
     }
     green+=10;
   }
   cactus.endShape();
 }
 void draw()  {
  shape(this.cactus); 
 }
}
