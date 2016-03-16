
class TRI  {
 PT[] PTS;
 PShape TRI;
 color fill;
 TRI( PT p_1, PT p_2, PT p_3 )  {
   this.PTS = new PT[3];
   PTS[0] = p_1;
   PTS[1] = p_2;
   PTS[2] = p_3;
   TRI = createShape();
   TRI.beginShape();
   TRI.fill(255,0,0);
   TRI.vertex( PTS[0].p_.x, PTS[0].p_.y, PTS[0].p_.z );
   TRI.vertex( PTS[1].p_.x, PTS[1].p_.y, PTS[1].p_.z );
   TRI.vertex( PTS[2].p_.x, PTS[2].p_.y, PTS[2].p_.z );
   TRI.endShape();
   this.fill = color( map(this.PTS[0].p_.y, -rad_, rad_, 255, 0), 
                      0, 
                      map(this.PTS[0].p_.y, -rad_, rad_, 0, 255) );
 }
 void draw()  {
  for ( int i=0 ; i<PTS.length ; i++ )  {
    shape( TRI );
    PTS[i].draw();
  }
 }
 void applyForce()  {
   for ( int i=0 ; i<PTS.length ; i++ )  {
     PTS[i].applyForce( force ); 
   }
 }
 void dissapateForces()  {
   for ( int i=0 ; i<PTS.length ; i++ )  {
     PTS[i].dissapateForces( forceDissapationCoefficient ); 
   }
 }
 void updateShape()  {
    TRI = createShape();
    TRI.beginShape();
    TRI.stroke(0);
    TRI.fill( this.fill );
    TRI.vertex( PTS[0].p_.x, PTS[0].p_.y, PTS[0].p_.z );
    TRI.vertex( PTS[1].p_.x, PTS[1].p_.y, PTS[1].p_.z );
    TRI.vertex( PTS[2].p_.x, PTS[2].p_.y, PTS[2].p_.z );
    TRI.endShape();
 }
 void increaseMagnitude( float coefficient)  {
   for ( int i=0 ; i<PTS.length ; i++ )  {
     PTS[i].p_.setMag( PTS[i].p_.mag()*coefficient ); 
   }
   this.fill = color( map(this.PTS[0].p_.y, -rad_, rad_, 255, 0), 
                      0, 
                      map(this.PTS[0].p_.y, -rad_, rad_, 0, 255) );
   updateShape();
 }
}
