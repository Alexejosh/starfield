Particle [] blueBalls;
double color1 = Math.random()*255;
double color2 = Math.random()*255;
double color3 = Math.random()*255;
double color4 = Math.random()*255;
double color5 = Math.random()*255;
double color6 = Math.random()*255;
double color7 = Math.random()*50 + 105;
double color8 = Math.random()*50 + 105;
double color9 = Math.random()*50 + 105;
double color10 = 30;
double color11 = 240;
double color12 = 255;
double xb;
double yb;

Firework[] f = new Firework[100];
boolean once;
float xpos = (float)Math.random()*width;
float ypos = (float)Math.random()*height;

void setup() {
  size(800, 800);
  //fill(255,255,255,20);


  blueBalls = new Particle[60];
  for (int j = 0; j < blueBalls.length; j++)
  {
    blueBalls[j]=new NormalParticle();
  }

  for (int j = 20; j < 40; j++)
  {
    blueBalls[j]=new OddballParticle();
  }
  for (int j = 59; j <blueBalls.length; j++)
  {
    blueBalls[j]=new JumboParticle();
  }

  for (int i = 0; i < f.length; i++) {
    f[i] = new Firework();
  }
}

void draw() {

  stroke((int)color10, (int)color11, (int)color12);
  strokeWeight(6);
  line(width/2, height/2, (float)xb, (float)yb);



  if (mousePressed==true) {
    //delay(100);
    color1 = Math.random()*255;
    color2 = Math.random()*255;
    color3 = Math.random()*255;
    color4 = color1;
    color5 = color2;
    color6 = color3;
    color7 = color1;
    color8 = color2;
    color9 = color3;
    color10 = color1;
    color11 = color2;
    color12 = color3;

    frameRate(100);
    fill(0, 0, 0, 20);
    rect(0, 0, width, height);
    for (int i = 0; i < f.length; i++) {
      f[i].show();
    }
  }
  if (mousePressed==false) {
    frameRate(25);
    fill(0);
    rect(0, 0, width, height);
    color4 = 255;
    color5 = 255;
    color6 = 255;
    color7 = Math.random()*50 + 105;
    color8 = Math.random()*50 + 105;
    color9 = Math.random()*50 + 105;
    color10 = Math.random()*155 + 0;
    color11 = Math.random()*55 + 0;
    color12 = Math.random()*255 + 200;


    for (int i = 0; i < f.length; i++) {
      f[i].show();
    }
  }


  for (int j = 0; j < blueBalls.length; j++)
  {
    blueBalls[j].show();
    blueBalls[j].move();
    blueBalls[j].keyPressed();
  }
}
void keyPressed() { //crtl
  if (key == CODED) {
    if (keyCode == CONTROL) {
      color10 = Math.random()*155 + 0;
      color11 = Math.random()*55 + 0;
      color12 = Math.random()*255 + 200;
    }
  }
  if (key == CODED) {//option
    if (keyCode == ALT) {
      color1 = Math.random()*255;
      color2 = Math.random()*255;
      color3 = Math.random()*255;
    }
  }
  if (key == CODED) {//shift
    if (keyCode == SHIFT) {
      fill(0, 0, 0, 40);
      rect(0, 0, width, height);
      ypos=height;
      xpos = (float)Math.random()*width;
      once = false;
      for (int i = 0; i < f.length; i++) {
        if ((f[i].hidden)&&(!once)) {
          f[i].show();
          f[i].move();
          once = true;
        }
      }
    }
  }
  if (key == CODED) {//down
    if (keyCode == DOWN) {
    }
  }
  if (key == CODED) {//right
    if (keyCode == RIGHT) {
    }
  }
  if (key == CODED) {//left
    if (keyCode == LEFT) {
    }
  }
}

class NormalParticle implements Particle {
  double x;
  double y;
  double speed;
  double angle;

  public NormalParticle() {
    x = width/2;
    y = height/2;
    speed = Math.random()*10;
    angle = Math.random()*Math.PI*4+1.5;
  }
  void keyPressed() {
  }
  void show() {
    noStroke();
    fill((int)color1, (int)color2, (int)color3);
    ellipse((int)x, (int)y, 20, 20);
  }
  void move () {
    x+=Math.cos(angle)*speed;
    y+=Math.sin(angle)*speed;
    angle+=0.05;
  }
}
interface Particle {
  void show();
  void move();
  void keyPressed();
}
class OddballParticle implements Particle//uses an interface
{
  double x;
  double y;
  double ox;
  double oy;
  double xSpeed;
  double ySpeed;
  double speed;
  double angle;
  double size = (Math.random()*5);

  public OddballParticle() {
    x = width/2;
    y = width/2;
    angle = Math.random()*Math.PI*2;
    xSpeed = Math.cos(angle)*16;
    ySpeed = Math.sin(angle)*16;
    angle = Math.random()*Math.PI*2;
  }
  void keyPressed() {
  }
  void show() {
    fill((int)color4, (int)color5, (int)color6);
    //fill(255);
    x=x+xSpeed;
    y=y+ySpeed;
    line((int)ox, (int)oy, (int)x, (int)y);
    strokeWeight((int)size/4);
    stroke((int)color4, (int)color5, (int)color6);
    ellipse((int)x, (int)y, (int)size, (int)size);
  }
  void move() {

    if (x>=width) {
      xSpeed= -(xSpeed);
      ox=x;
      oy=y;
    }
    if (x<=0) {
      xSpeed= -(xSpeed);
      ox=x;
      oy=y;
    }
    if (y<=0) {
      ySpeed= -(ySpeed);
      ox=x;
      oy=y;
    }
    if (y>=height) {
      ySpeed= -(ySpeed);
      ox=x;
      oy=y;
    }
  }
}
class JumboParticle extends NormalParticle//uses inheritance
{
  double x;
  double y;
  double ox;
  double oy;
  double speed;
  double angle;
  double xSpeed=Math.cos(angle)*speed;
  double ySpeed=Math.sin(angle)*speed;
  double xSpeed2;

  public JumboParticle() {
    x =ox = width/2;
    y =oy = width/2;
    //speed = Math.random()*10;
    //angle = Math.random()*Math.PI*4;
    //xSpeed=Math.cos(angle)*speed;
    //ySpeed=Math.sin(angle)*speed;
    xSpeed=10;
    ySpeed=10;
  }

  void show() {
    fill((int)color10, (int)color11, (int)color12);
    ellipse((int)x, (int)y, 10, 10);
    //stroke((int)color10, (int)color11, (int)color12);
    //strokeWeight(6);
    //line((float)ox, (float)oy, (float)x, (float)y);
  }
  void move () {
    x+=xSpeed;
    y+=ySpeed;
    angle+=0.05;
    xb=x;
    yb=y;




    if (x>=width) {
      xSpeed= -10;
    }
    if (x<=0) {
      xSpeed= 10;
    }
    if (y<=0) {
      ySpeed= 10;
    }
    if (y>=height) {
      ySpeed= -10;
    }
  }
  void keyPressed() {
    if (key == CODED) {//up
      if (keyCode == UP) {
        ySpeed=-10;
        xSpeed=0;

        if (y<=0) {
          ySpeed= 10;
        }
      }
    }
    if (key == CODED) {//down
      if (keyCode == DOWN) {
        ySpeed=10;
        xSpeed=0;

        if (y>=height) {
          ySpeed= -10;
        }
      }
    }
    if (key == CODED) {//right
      if (keyCode == RIGHT) {
        ySpeed=0;
        xSpeed=10;
        if (x>=width) {
          xSpeed=width;
          xSpeed= -10;
        }
      }
    }
    if (key == CODED) {//left
      if (keyCode == LEFT) {
        ySpeed=0;
        xSpeed=xSpeed2;

        if (x<=0) {
          xSpeed2= 10;
        }
        if (x>0&&x<width) {
          xSpeed2= -10;
        }
      }
    }
  }
}



class Firework {
  float x, y, oldX, oldY, ySpeed, targetX, targetY, Timer, fWeight, fAngle;
  int flareAmount, duration;
  boolean launched, exploded, hidden;
  color flare;
  Firework() {
    launched = false;
    exploded = false;
    hidden = true;
  }
  void keyPressed() {
  }
  void show() {

    if ((launched)&&(!exploded)&&(!hidden)) {
      launchMaths();
      strokeWeight(5);
      stroke(255);
      line(x, y, oldX, oldY);
    }
    if ((!launched)&&(exploded)&&(!hidden)) {
      explodeMaths();
      noStroke();
      strokeWeight(fWeight);
      stroke(flare);
      for (int i = 0; i < flareAmount + 1; i++) {
        pushMatrix();
        translate(x, y);
        point(sin(radians(i*fAngle))*Timer, cos(radians(i*fAngle))*Timer);
        popMatrix();
      }
    }
    if ((!launched)&&(!exploded)&&(hidden)) {
    }
  }
  void move() {
    //fill(0, 0, 0, 20);
    //rect(0, 0, width, height);
    x  = xpos ;
    y  = ypos;
    targetX = (float)Math.random()*width;
    targetY = (float)Math.random()*height+20;
    ySpeed = random(3) + 2;
    flare = color((int)color7, (int)color8, (int)color9);
    flareAmount = ceil(random(100)) + 50;
    fWeight = (float)Math.random()*4;
    duration = ceil(random(8))*20 + 30;
    fAngle = 500/flareAmount;
    launched = true;
    exploded = false;
    hidden = false;
  }
  void launchMaths() {
    oldX = x;
    oldY = y;
    if (dist(x, y, targetX, targetY) > 6) {
      x += (targetX - x)/2;
      y += -ySpeed;
    } else {
      explode();
    }
  }
  void explode() {
    Timer = 0;
    launched = false;
    exploded = true;
    hidden = false;
  }
  void explodeMaths() {
    if (Timer < duration) {
      Timer+= 0.4;
    } else {
      hide();
    }
  }
  void hide() {
    launched = false;
    exploded = false;
    hidden = true;
  }
}