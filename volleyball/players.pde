boolean lcanjump=true;
boolean rcanjump=true;
void player1() {
  
  if (w && lcanjump) p1.addImpulse(0, -1500);
  if (a) p1.setVelocity(-400, p1.getVelocityY());
  if (d && p1.getX()<width/2-47) p1.setVelocity(400, p1.getVelocityY());
  if (!a && !d) p1.setVelocity(0, p1.getVelocityY());
}

void player2() {
  if (up && rcanjump) p2.addImpulse(0, -1500);
  if (left) p2.setVelocity(-400, p2.getVelocityY());
  if (right) p2.setVelocity(400, p2.getVelocityY());
  if (!left&& !right) p2.setVelocity(0, p2.getVelocityY());
  
}
