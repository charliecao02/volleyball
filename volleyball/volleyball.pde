import fisica.*;

color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

boolean up, down, left, right;
boolean w, a, s, d;

int lscore=0, rscore=0;
int lastscore=2, winner=0;
int mode=0;

FWorld world;
FCircle p1, p2, ball;
FPoly p0, net;

ArrayList<FContact> c1, c2, cball;

PImage ballpic, background, image1, image2, netpic, intropic;

void setup() {
  size(1000, 600, FX2D); 
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
  world.setEdges();
  
  intropic=loadImage("intro.jpg");
  intropic.resize(1000,600);

  ballpic=loadImage("volleyball.png");
  ballpic.resize(30, 30);
  background=loadImage("beach.jpg");
  image1=loadImage("hillary.png");
  image1.resize(75,75);
  image2=loadImage("trump.png");
  image2.resize(110,80);
  netpic=loadImage("net.png");
  netpic.resize(20,100);

  p1= new FCircle(70);
  p1.setName("player1");
  p1.setFillColor(yellow);
  p1.setPosition(250, 400);
  p1.setRotatable(false);
  p1.setGrabbable(false);
  p1.setRestitution(0);
  p1.attachImage(image1);
  world.add(p1);

  p2= new FCircle(70);
  p2.setName("player2");
  p2.setFillColor(red);
  p2.setPosition(750, 400);
  p2.setRotatable(false);
  p2.setGrabbable(false);
  p2.setRestitution(0);
  p2.attachImage(image2);
  world.add(p2);

  ball = new FCircle(30);
  ball.setFillColor(color(128, 128, 128));
  ball.setPosition(750, 200);
  ball.setGrabbable(false);
  ball.setRotatable(true);
  ball.setRestitution(0);
  ball.attachImage(ballpic);
  world.add(ball);


  p0 = new FPoly();
  p0.vertex(-100, height-100);
  p0.vertex(width+100, height-100);
  p0.vertex(width+100, height-90);
  p0.vertex(-100, height-90);
  p0.setStatic(true);
  p0.setGrabbable(false);
  p0.setRotatable(false);
  p0.setFillColor(brown);
  p0.setRestitution(0);
  world.add(p0);

  net = new FPoly();
  net.vertex(width/2-10, height-100);
  net.vertex(width/2-10, height-200);
  net.vertex(width/2+10, height-200);
  net.vertex(width/2+10, height-100);
  net.setStatic(true);
  net.setGrabbable(false);
  net.setRotatable(false);
  net.setFillColor(green);
  net.setRestitution(1);
  net.setFill(0,0,0,0);
  net.setNoStroke();
  world.add(net);
}

void draw() {
  if(mode==0) intro();
  if(mode==1) playing();
  if(mode==2) end();
}

void reset() {
  p1.setPosition(250, 400);
  p1.setVelocity(0, 0);
  p2.setPosition(750, 400);
  p2.setVelocity(0, 0);
  if(lastscore==1) ball.setPosition(250, 200);
  if(lastscore==2) ball.setPosition(750, 200);
  ball.setVelocity(0, 0);
}
