void keyPressed() {
  if (key == 'w' || key == 'W') w=true;
  if (key == 'a' || key == 'A') a=true;
  if (key == 's' || key == 'S') s=true;
  if (key == 'd' || key == 'D') d=true;

  if (keyCode == UP) up=true;
  if (keyCode == DOWN) down=true;
  if (keyCode == LEFT) left=true;
  if (keyCode == RIGHT) right=true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') w=false;
  if (key == 'a' || key == 'A') a=false;
  if (key == 's' || key == 'S') s=false;
  if (key == 'd' || key == 'D') d=false;
  //if ((key == 'r' || key == 'R') && mode==2) {
  //  score1=0;
  //  score2=0;
  //  mode=0;
  //}

  if (keyCode == UP) up=false;
  if (keyCode == DOWN) down=false;
  if (keyCode == LEFT) left=false;
  if (keyCode == RIGHT) right=false;
}
