int num_W = 100;
int num_H = 100;
ArrayList<PT> PTs;

void setup()  {
  size( 800, 800, P3D );
  strokeWeight( 2 );
  stroke( 255, 0, 0 );
  PTs = new ArrayList<PT>();
  for ( int i=0 ; i<num_W ; i++ )  {
    for ( int j=0 ; j<num_H ; j++ )  {
      PTs.add( new PT( width/num_W*i+width/num_W/2, 
                       height/num_H*j+height/num_H/2) );
    }
  }
}
void draw()  {
  background( 255 );
  for ( int i=0 ; i<num_W ; i++ )  {
    for ( int j=0 ; j<num_H ; j++ )  {
      strokeWeight(4);
      PTs.get( i*num_H + j).draw();
      PTs.get( i*num_H + j).move( map( noise(i), 0, 1, -1, 1 ), 
                                  map( noise(j), 0, 1, -1, 1 ) );
      strokeWeight(1);
      if ( i > 0 )  {
        line( PTs.get( i*num_H + j).p_.x, PTs.get( i*num_H + j).p_.y,
              PTs.get( i*num_H + j - num_W ).p_.x, PTs.get( i*num_H + j - num_W ).p_.y );
      }
      if ( j > 0 )  {
        line( PTs.get( i*num_H + j).p_.x, PTs.get( i*num_H + j).p_.y,
              PTs.get( i*num_H + j - 1 ).p_.x, PTs.get( i*num_H + j - 1 ).p_.y );
      }
    }
  }
}
