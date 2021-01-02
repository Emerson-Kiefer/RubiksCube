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
        cube[i][j][k] = new Cubie((i - 1.5) * len, (j - 1.5) * len, (k - 1.5) * len, len);
      }
    }
  }

}

void keyPressed(){
  char rotation = ' ';
  char lowercaseKey = key;
  boolean clockwise = true;
  int val = 0;
  if((int)key < 97){  //is uppercase
    clockwise = false;
    lowercaseKey = (char)((int)key + 32);
  }
  switch(lowercaseKey){
    case 'f':
      rotation = 'z';
      val = 2;
      break;
    case 'b':
      rotation = 'z';
      break;
    case 'l':
      rotation = 'x';
      break;
    case 'r':
      rotation = 'x';
      val = 2;
      break;
    case 'u':
      rotation = 'y';
      break;
    case 'd':
      rotation = 'y';
      val = 2;
  }
    
  rotateCubies(rotation, val, clockwise);
  for(int i = 0; i< 3; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3; k++){
        if((lowercaseKey == 'f' || lowercaseKey == 'b') && k == val){
          cube[i][j][k].rotateFaces(rotation, clockwise);
        }
        if((lowercaseKey == 'l' || lowercaseKey == 'r') && i == val){
          cube[i][j][k].rotateFaces(rotation, clockwise);
        }
        if((lowercaseKey =='u' || lowercaseKey =='d') && j == val){
          cube[i][j][k].rotateFaces(rotation, clockwise);
        }
      }
    }
  }
}

void rotateCubies(char rotation, int val, boolean clockwise){ //temporary hard coding
  //////////////////////////////////////////
  //Cubie1, Cubie2, Cubie3, Cubie4, Cubie5, Cubie6, Cubie7, Cubie8, buffer1, buffer2
  Cubie[] cubieArr1 = {};
  Cubie[] cubieArr2 = {};
  color[] buffer1 = null;
  color[] buffer2 = null;
  //////////////////////////////////////////
  
  if(rotation == ' '){
  
    return;
  }
  if(rotation == 'z'){
    
    ///////////////////////////////////////////
    buffer1 = cube[0][0][val].colors;
    buffer2 = cube[1][0][val].colors;
    cubieArr1 = new Cubie[]{cube[0][0][val], cube[0][2][val], cube[2][2][val], cube[2][0][val], cube[0][0][val]};
    cubieArr2 = new Cubie[]{cube[1][0][val], cube[0][1][val], cube[1][2][val], cube[2][1][val], cube[1][0][val]};
    //////////////////////////////////////////
    
  } else if(rotation == 'x'){
    buffer1 = cube[val][0][0].colors;
    buffer2 = cube[val][1][0].colors;
    cubieArr1 = new Cubie[]{cube[val][0][0], cube[val][2][0], cube[val][2][2], cube[val][0][2], cube[val][0][0]};
    cubieArr2 = new Cubie[]{cube[val][1][0], cube[val][2][1], cube[val][1][2], cube[val][0][1],  cube[val][1][0]};
    
    //color[] colBuf1 = cube[val][0][0].colors;            //counter
    //color[] colBuf2 = cube[val][1][0].colors;
  
    //cube[val][0][0].colors = cube[val][0][2].colors;
    //cube[val][0][2].colors = cube[val][2][2].colors;
    //cube[val][2][2].colors = cube[val][2][0].colors;
    //cube[val][2][0].colors = colBuf1;
    
    //cube[val][1][0].colors = cube[val][0][1].colors;
    //cube[val][0][1].colors = cube[val][1][2].colors;
    //cube[val][1][2].colors = cube[val][2][1].colors;
    //cube[val][2][1].colors = colBuf2;
    
    
  } else if(rotation == 'y'){
    buffer1 = cube[0][val][0].colors;
    buffer2 = cube[1][val][0].colors;
    cubieArr1 = new Cubie[]{cube[0][val][0], cube[2][val][0], cube[2][val][2], cube[0][val][2], cube[0][val][0]};
    cubieArr2 = new Cubie[]{cube[1][val][0], cube[2][val][1], cube[1][val][2], cube[0][val][1],  cube[1][val][0]};
    
    
  }
  ///////////////////////////////////
  for(int i = 0; i < 3; i++){
    if(clockwise){
      cubieArr1[i].colors = cubieArr1[i + 1].colors;
      cubieArr2[i].colors = cubieArr2[i + 1].colors;
    } else {
      cubieArr1[4 - i] = cubieArr1[3 - i];
      cubieArr2[4 - i] = cubieArr2[3 - i];
    }
  }
  if(clockwise){
    cubieArr1[3].colors = buffer1;
    cubieArr2[3].colors = buffer2;
  } else{
    cubieArr1[1].colors = buffer1;
    cubieArr2[1].colors = buffer2;
  }
  
  ///////////////////////////////////
  
}



void draw(){
  background(0, 0, 0);
  noFill();
  strokeWeight(4);
  for(int i = 0; i< 3; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3; k++){
        text("(" + i +","+ j +","+ k + ")", len * i - 1.5 * len, len * j - 1.5 * len, len * k - 1.5 * len);
        cube[i][j][k].show();
      }
    }
  }
  
  fill(255);
  box(len);
  fill(255);
  
  
}
