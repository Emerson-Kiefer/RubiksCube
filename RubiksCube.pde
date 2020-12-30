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
  boolean first = true;
  for(int i = 0; i< 3; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3; k++){
          if(key == 'f'){ 
            if(k == 2){
              cube[i][j][k].rotateFaces('z', true);
            }
            if(first){
              first = false;
              rotateFront();
            }
          }
          if(key == 'F' && k == 2){
            cube[i][j][k].rotateFaces('z', false);
          }
          if(key == 'b' && k == 0){
            cube[i][j][k].rotateFaces('z', true);
          }
          if(key == 'B' && k == 0){
            cube[i][j][k].rotateFaces('z', false);
          }
          if(key == 'l' && i == 0){
            cube[i][j][k].rotateFaces('x', true);
          }
          if(key == 'L' && i == 0){
            cube[i][j][k].rotateFaces('x', false);
          }
          if(key == 'b' && k == 0){
            cube[i][j][k].rotateFaces('z', true);
          }
          if(key == 'B' && k == 0){
            cube[i][j][k].rotateFaces('z', false);
          }
          
          
          
          
      }
    }
  }
}

void rotateFront(){
  color[] buffer1 = cube[0][0][2].colors;
  color[] buffer2 = cube[1][0][2].colors;

  cube[0][0][2].colors = cube[0][2][2].colors;
  cube[0][2][2].colors = cube[2][2][2].colors;
  cube[2][2][2].colors = cube[2][0][2].colors;
  cube[2][0][2].colors = buffer1;
  
  cube[1][0][2].colors = cube[0][1][2].colors;
  cube[0][1][2].colors = cube[1][2][2].colors;
  cube[1][2][2].colors = cube[2][1][2].colors;
  cube[2][1][2].colors = buffer2;
}



void draw(){
  background(0, 0, 0);
  noFill();
  strokeWeight(4);
  for(int i = 0; i< 3; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3; k++){
        //textAlign(LEFT);
        //textSize(15);
        //text("(" + i +","+ j +","+ k + ")", len * i - 1.5 * len, len * j - 1.5 * len, len * k - 1.5 * len);
        //if(k==2 || i ==0){
          
          
          
        cube[i][j][k].show();
        
        
        //}
        //if(frameCount % 300 == 0 && i ==2){
        //  cube[i][j][k].rotateCubie('x', true);
        //}
        //if(frameCount % 300 == 100 && j == 2){
        //  cube[i][j][k].rotateCubie('y', true);
        //}
        //if(frameCount % 300 == 200 && k == 2){
        //  cube[i][j][k].rotateCubie('z', true);
        //}
      }
    }
  }
  
  fill(255);
  box(len);
  fill(255);
  
  
}
