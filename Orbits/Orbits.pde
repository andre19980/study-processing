int W, H;
int cols, rows;
float t;
ArrayList<Orbit> field;

void setup() {
  size(360, 640);
  background(51);
  noStroke();
  
  field = new ArrayList<Orbit>();

  cols = 4;
  rows = 16;
  W = width/cols;
  H = height/rows;
  t = 0;
  
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      int x = j*W + W/2;
      int y = i*H + H/2;
      PVector c = new PVector(x, y);
      PVector c1 = new PVector(x, y);
      PVector c2 = new PVector(x, y);
      field.add(new Orbit(c, c1, c2, j*W + W, j*W));
    }
  }
}

void draw() {
  background(51);

  for (Orbit orbit: field) {
    orbit.display();
    // orbit.moveUniform();
    orbit.updateExt(t);
    orbit.moveWave(t);
  }
  
  t += 0.01;
}
