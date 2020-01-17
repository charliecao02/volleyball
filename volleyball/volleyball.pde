import fisica.*;

color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

boolean up, down, left, right;
boolean w, a, s, d;

int lscore=0, rscore=0;

FWorld world;
FCircle p1, p2, ball;
FPoly p0, net;

ArrayList<FContact> c1, c2, cball;

void setup() {
  size(1000, 600, FX2D); 
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
  world.setEdges();

  p1= new FCircle(70);
  p1.setName("player1");
  p1.setFillColor(yellow);
  p1.setPosition(250, 400);
  p1.setRotatable(false);
  p1.setGrabbable(false);
  p1.setRestitution(0);
  world.add(p1);

  p2= new FCircle(70);
  p2.setName("player2");
  p2.setFillColor(red);
  p2.setPosition(750, 400);
  p2.setRotatable(false);
  p2.setGrabbable(false);
  p2.setRestitution(0);
  world.add(p2);

  ball = new FCircle(30);
  ball.setFillColor(color(128, 128, 128));
  ball.setPosition(750, 200);
  ball.setGrabbable(false);
  ball.setRotatable(false);
  ball.setRestitution(0);
  world.add(ball);


  p0 = new FPoly();
  p0.vertex(-100, height-100);
  p0.vertex(width+100, height-100);
  p0.vertex(width+100, height);
  p0.vertex(-100, height);
  p0.setStatic(true);
  p0.setFillColor(brown);
  p0.setRestitution(0);
  world.add(p0);

  net = new FPoly();
  net.vertex(width/2-10, height-100);
  net.vertex(width/2-10, height-200);
  net.vertex(width/2+10, height-200);
  net.vertex(width/2+10, height-100);
  net.setStatic(true);
  net.setFillColor(green);
  net.setRestitution(1);
  world.add(net);
}

void draw() {
  background(0);

  player1();
  player2();

  textSize(100);
  textAlign(CENTER);
  text(lscore, 70, 100);
  text(rscore, width-70, 100);

  c1=p1.getContacts();
  c2=p2.getContacts();
  cball=ball.getContacts();

  lcanjump=false;
  rcanjump=false;

  for (FContact c : c1) {
    if (c.contains(p0)) lcanjump=true;
    else lcanjump=false;
  }
  for (FContact c : c2) {
    if (c.contains(p0)) rcanjump=true;
    else rcanjump=false;
  }
  for (FContact c : cball) {
    if (c.contains(p1)) {
      ball.addImpulse( (p1.getX()-ball.getX()) * -20, -500);
    }
    if (c.contains(p2)) {
      ball.addImpulse( (p2.getX()-ball.getX()) * -20, -500);
    }

    if (c.contains(p0) && ball.getX()<width/2) {
      lscore++;
      reset();
    } else if (c.contains(p0) && ball.getX()>width/2) {
      rscore++;
      reset();
    }
  }

  world.step();
  world.draw();
}

void reset() {
  p1.setPosition(250, 400);
  p1.setVelocity(0, 0);
  p2.setPosition(750, 400);
  p2.setVelocity(0, 0);
  ball.setPosition(750, 200);
  ball.setVelocity(0, 0);
}
