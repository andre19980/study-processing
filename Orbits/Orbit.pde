class Orbit {
  PVector center;
  PVector c1, c2;
  int minR, maxR, ext;
  float ext1, ext2;
  int RLimit, LLimit;
  float v = 0.2;
  int dir = 1;
  
  Orbit(PVector c, PVector argC1, PVector argC2, int rl, int ll) {
    center = c;
    c1 = argC1;
    c2 = argC2;
    RLimit = rl;
    LLimit = ll;
    ext1 = 60;
    ext2 = 60;
    minR = 10;
    maxR = 90;
  }
  
  void display() {  
    fill(255, 100);
    circle(c1.x, c1.y, ext1);

    fill(255, 100);
    circle(c2.x, c2.y, ext2);
  }
  
  void moveUniform() {    
    if (c1.x + v > RLimit) {
      dir = -1;
    } else if (c1.x + v < LLimit) {
      dir = 1;
    }
   
    c1.x = c1.x + dir*v;
    c2.x = c2.x - dir*v;
  }
  
  void updateExt(float t) {
    ext1 = map(cos(t+HALF_PI), -1, 1, minR, maxR);
    ext2 = map(sin(t+HALF_PI), -1, 1, minR, maxR);
  }
  
  void moveWave(float t) {
    c1.x = map(sin(t), -1, 1, LLimit + ext1/2, RLimit - ext1/2);
    c2.x = map(cos(t), -1, 1, LLimit + ext2/2, RLimit - ext2/2);
  }
}
