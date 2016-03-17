
class Rope  {  // Rope
 int numKnots;
 ArrayList<Integer> anchored;
 ArrayList<Knot> knots;
 Rope( ArrayList<Knot> knots )  {
   this.knots = knots;
 }
 void draw()  {
   for ( int i=0 ; i<knots.size() ; i++ )  {
     if ( i > 0 )  {
      strokeWeight( 1 );
      line( knots.get( i ).position.x, knots.get( i ).position.y, 
            knots.get( i-1 ).position.x, knots.get( i-1 ).position.y );
      this.knots.get( i ).draw();
     }
   }
 }
 void move()  {  // Move all knots in rope, knots exert forces on other knots
   for ( int i=0 ; i<knots.size() ; i++ )  {
     if ( i > 0 && i < knots.size()-1 )  {
       Knot future = knots.get(i+1);
       Knot current = knots.get(i);
       Knot past = knots.get(i-1);
       if ( abs(PVector.dist(current.position, past.position)) >= past.maxLength || 
            abs(PVector.dist(current.position, future.position)) >= future.maxLength )  {
         PVector f1 = current.applyForce( past.position );
         PVector f2 = current.applyForce( future.position );
         current.move();
         for ( int j = i + 1 ; j < knots.size() ; j++ )  {
          knots.get(i).acceleration.add(f1);
          knots.get(i).acceleration.add(PVector.div( f2, 2+j));
          knots.get(i).move(); 
         }
       }
     }
     else if ( i > 0 )  {
       Knot current = knots.get(i);
       Knot past = knots.get(i-1);
       current.move();
       if ( abs(PVector.dist(current.position, past.position)) > past.maxLength )  {
         PVector f1 = current.applyForce( past.position );
         for ( int j = i+1 ; j < knots.size() ; j++ )  {
          knots.get(i).acceleration.add(f1);
          knots.get(i).move(); 
         }
       }
     }
   }
 }
}