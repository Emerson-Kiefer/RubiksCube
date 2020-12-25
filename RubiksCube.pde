import peasy.*;
PeasyCam cam;
int dim = 3;
Cubie[][][] cube = new Cubie[dim][dim][dim];

void setup(){
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(500);
}

void keyPressed(){
  
}



void draw(){
  background(0, 0, 0);
  noFill();
  strokeWeight(2);
  float len = 50;
  float adjLen = len/2;
  for(int i = 0; i< 3; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3; k++){ 
        pushMatrix();
        translate(-len+i*len,-len+j*len, -len+k*len);
        if(k == 0){
          fill(orange);
          beginShape(); //front
          vertex(-adjLen, -adjLen, -adjLen);
          vertex(adjLen, -adjLen, -adjLen);
          vertex(adjLen, adjLen, -adjLen);
          vertex(-adjLen, adjLen, -adjLen);
          endShape();
        }
          if(k == 2){
          fill(red);
          beginShape(); //back
          vertex(-adjLen, -adjLen, adjLen);
          vertex(adjLen, -adjLen, adjLen);
          vertex(adjLen, adjLen, adjLen);
          vertex(-adjLen, adjLen, adjLen);
          endShape();
        }
        
        if(j == 0){
          fill(yellow); //top
          beginShape();
          vertex(-adjLen, -adjLen, -adjLen);
          vertex(adjLen, -adjLen, -adjLen);
          vertex(adjLen, -adjLen, adjLen);
          vertex(-adjLen, -adjLen, adjLen);
          endShape();
        }
        
        if(j == 2){
          fill(white); //bottom
          beginShape();
          vertex(-adjLen, adjLen, -adjLen);
          vertex(adjLen, adjLen, -adjLen);
          vertex(adjLen, adjLen, adjLen);
          vertex(-adjLen, adjLen, adjLen);
          endShape();
        }
        
        if(i == 0){
          fill(blue); //left
          beginShape();
          vertex(-adjLen, -adjLen, -adjLen);
          vertex(-adjLen, adjLen, -adjLen);
          vertex(-adjLen, adjLen, adjLen);
          vertex(-adjLen, -adjLen, adjLen);
          endShape();
        }
        
        if(i == 2){
          fill(green); //right
          beginShape();
          vertex(adjLen, -adjLen, -adjLen);
          vertex(adjLen, adjLen, -adjLen);
          vertex(adjLen, adjLen, adjLen);
          vertex(adjLen, -adjLen, adjLen);
          endShape();
        }
        
        //x = -len+i*len
        //y = -len+j*len
        //z = -len+k*len
        //cube[i][j][k] = 
        noFill();
        box(len);
        popMatrix();
      }
    }
  }
  fill(0);
  box(len);
  fill(255);
}
