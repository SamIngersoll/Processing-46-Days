
class Pulse  {  // Pulse class
 ArrayList<Walker> walkers;  // Each pulse contains many walkers
 Pulse()  {  // Pulse begins
   walkers = new ArrayList<Walker>();
   for ( int i = 0 ; i < 10 ; i++ )  {
    walkers.add( new Walker() ); 
   }
 }
 void draw()  {  // Pulse draws each walker
   for ( int i = 0 ; i < walkers.size() ; i++ )  {
    walkers.get( i ).draw();
   }
   this.clean();
 } 
 void move()  {  // Move each walker and randomly divide them
   for ( int i = 0 ; i < walkers.size() ; i++ )  {  
    walkers.get( i ).move(); 
    float temp = random( 10 );
    if ( temp  > 9.9 )   {
     this.divide(i); 
    }
   } 
 }
 void divide( int i )  {  // Divide walkers and give them random directions
   float bound = 3;
   Walker w = walkers.get( i );
   walkers.get( i ).divide();
   walkers.add( new Walker( w.x, w.y, w.z, new PVector( random(-bound, bound), random(-bound, bound), random(-bound, bound) ) ) );
 }
 void clean()  {  // Randomly remove a bunch of walkers
    float temp = random( 10 );
    if ( temp > 9 && walkers.size() > 3  )   {
     walkers.remove( (int)random(walkers.size() ) );
    }
 }
}