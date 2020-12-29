import peasy.*;
PeasyCam cam;
int dim = 3;
Cubie[][][] cube = new Cubie[dim][dim][dim];
float len = 50;

void setup(){
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  for(int i = 0; i< 3; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3; k++){
        cube[i][j][k] = new Cubie(len * i - 1.5 * len, len * j - 1.5 * len, len * k - 1.5 * len, len);
      }
    }
  }

}

void keyPressed(){
  
}



void draw(){
  background(0, 0, 0);
  noFill();
  strokeWeight(3);
  for(int i = 0; i< 3; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3; k++){
        cube[i][j][k].show();
      }
    }
  }
  fill(255);
  box(len);
  fill(255);
  
  
}
