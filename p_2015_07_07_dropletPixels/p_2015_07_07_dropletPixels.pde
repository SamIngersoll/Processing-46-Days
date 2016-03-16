int HabitatsWidth = 10;
int HabitatsHeight = 10;
Habitat[][] Habitats = new Habitat[(int)random(HabitatsWidth)][(int)random(HabitatsHeight)];

void setup()  {
  size( 800, 800 );
  background( 255 );
  noStroke();
  rectMode( CORNER );
  for ( int i=0 ; i<Habitats.length ; i++ )  {
   for ( int j=0 ; j<Habitats[0].length ; j++ )  {
    Habitats[i][j] = new Habitat( width/HabitatsWidth*((int)random(HabitatsWidth) ), 
                           height/HabitatsHeight*((int)random(HabitatsHeight) ),
                           width/HabitatsWidth,
                           height/HabitatsHeight,
                           i,
                           j );
   } 
  }
//  Habitats[10][10].inhabitHabitat( Habitats );
}
void draw()  {
  background( 255 );
  for ( int i=0 ; i<Habitats.length ; i++ )  {
   for ( int j=0 ; j<Habitats[0].length ; j++ )  {
     Habitats[i][j].drawHabitat(); 
     Habitats[i][j].move(); 
   }
  }
}
