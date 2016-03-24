
class Habitat  {
 float w, h;
 PVector p_, v_, a_;
 float timeSinceLeft;
 boolean isFull;
 int pointx, pointy;
 Habitat( float x, float y, float w, float h, int pointx, int pointy)  {
  this.w = w;
  this.h = h;
  this.p_ = new PVector( x, y );
  timeSinceLeft = 255;
  this.pointx = pointx;
  this.pointy = pointy;
  this.v_ = new PVector(0,0);
  this.a_ = new PVector(0,0);
 } 
 void drawHabitat()  {  // Rectangle
  fill( 255-this.timeSinceLeft,0,0 );
  rect(p_.x, p_.y, w, h );
 }
 void move()  {  // Moves the rectangles, attracts them to center of mass
   PVector move = new PVector(0,0);
   int counter = 0;
   for ( int i=0 ; i<Habitats.length ; i++ )  {
     for ( int j=0 ; j<Habitats[0].length ; j++ )  {
        move.add( PVector.sub( p_, Habitats[i][j].p_ ) );
        counter++;
     }
   }
   move.div( counter );
   move.normalize();
   move.x = move.x;
   move.y = move.y;
   move.mult(-1);
   this.p_.add( move );
 }
}