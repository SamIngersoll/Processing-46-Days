
class Pulse  {
 Walker[] walkers;  // Array of walkers
 Pulse()  {
   walkers = new Walker[50];  // Initializes array
   for ( int i = 0 ; i < walkers.length ; i++ )  {
    walkers[i] = new Walker(); 
   }
 }
 void draw()  {  // Draws all of the walkers in the pulse
   for ( int i = 0 ; i < walkers.length ; i++ )  {
    walkers[i].draw();
   }
 } 
 void move()  {  // Moves all of the walkers in the pulse
   for ( int i = 0 ; i < 50 ; i++ )  {
    walkers[i].move(); 
   } 
 }
}
