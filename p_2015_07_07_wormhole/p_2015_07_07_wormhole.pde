int HabitatsWidth = 100;
int HabitatsHeight = 100;
Habitat[][] Habitats = new Habitat[(int)random(HabitatsWidth)][(int)random(HabitatsHeight)];

void setup()  {
  size( 800, 800 );
  background( 255 );
  noStroke();
  rectMode( CORNER );
  for ( int i=0 ; i<Habitats.length ; i++ )  {  // Iterates through height, width creates squares
   for ( int j=0 ; j<Habitats[0].length ; j++ )  {
    Habitats[i][j] = new Habitat( width/HabitatsWidth*((int)random(HabitatsWidth) ), 
                           height/HabitatsHeight*((int)random(HabitatsHeight) ),
                           width/HabitatsWidth,
                           height/HabitatsHeight,
                           i,
                           j );
   } 
  }
}
void draw()  {
  background( 255 );
  for ( int i=0 ; i<Habitats.length ; i++ )  {  // Iterates through all squares, attracts them
   for ( int j=0 ; j<Habitats[0].length ; j++ )  {
     Habitats[i][j].drawHabitat(); 
     Habitats[i][j].move(); 
   }
  }
  saveFrame( "wormhole_gif_###.png" ); 
}