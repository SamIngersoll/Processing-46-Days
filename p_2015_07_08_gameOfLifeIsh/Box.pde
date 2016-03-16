
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
 void drawHabitat()  {
  fill( 255-this.timeSinceLeft,0,0 );
//  fill( 255*noise(x,y),0,0 );
  rect(p_.x, p_.y, w, h );
//  if ( left && timeSinceLeft <= 255 )  {
//   timeSinceLeft++; 
//  }
 }
 void move()  {
   PVector move = new PVector(0,0);
   int counter = 0;
   for ( int i=0 ; i<Habitats.length ; i++ )  {
     for ( int j=0 ; j<Habitats[0].length ; j++ )  {
       if ( PVector.dist( p_, Habitats[i][j].p_ ) < 200 )  {
        move.add( PVector.sub( p_, Habitats[i][j].p_ ) );
        counter++;
       }
     }
   }
   move.div( counter );
   move.normalize();
   move.mult( 1.5 );
   move.x = (int)move.x;
   move.y = (int)move.y;
   move.x = move.x*width/HabitatsWidth;
   move.y = move.y*width/HabitatsWidth;
   move.mult(-1);
   this.p_.add( move );
 }
 void inhabitHabitat( Habitat[][] Habitats )  {
//   left = false;
    
 }
 void leaveHabitat()  {
   
 }
 void ripple( Habitat[][] Habitats, int fromx, int fromy )  {
  
 }
}
