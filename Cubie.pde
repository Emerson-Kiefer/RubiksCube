color white = color(255);
color yellow = color(255, 213, 0);
color blue = color(0, 70, 173);
color orange = color(255, 88, 0);
color red = color(183, 18, 52);
color green = color(0, 155, 72);

class Cubie{
  int[][][] rubiks;
  float x = 0;
  float y = 0;
  float z = 0;
  float len;
  color[] colors = new color[6];//front, back, left, right, up, down
  
  Cubie(float x, float y, float z, float len){
    this.x = x;
    this.y = y;
    this.z = z;
    this.len = len;
    colors[0] = red;
    colors[1] = orange;
    colors[2] = blue;
    colors[3] = green;
    colors[4] = yellow;
    colors[5] = white;
  }
  
  void rotateFaces(char rotation, boolean clockwise){
    color buffer;
    switch(rotation){
      case 'x':
        buffer = colors[0];
        if(clockwise){
          colors[0] = colors[4];
          colors[4] = colors[1];
          colors[1] = colors[5];
          colors[5] = buffer;
        } else{
          colors[0] = colors[5];
          colors[5] = colors[1];
          colors[1] = colors[4];
          colors[4] = buffer;
        }
        break;
      case 'y':
        buffer = colors[0];
        if(!clockwise){
          colors[0] = colors[2];
          colors[2] = colors[1];
          colors[1] = colors[3];
          colors[3] = buffer;
        } else{
          colors[0] = colors[3];
          colors[3] = colors[1];
          colors[1] = colors[2];
          colors[2] = buffer;
        }
        break;
      case 'z':
        buffer = colors[2];
        if(clockwise){
          colors[2] = colors[5];
          colors[5] = colors[3];
          colors[3] = colors[4];
          colors[4] = buffer;
        } else {
          colors[2] = colors[4];
          colors[4] = colors[3];
          colors[3] = colors[5];
          colors[5] = buffer;
        }
        break;
    }
  }
  
  void show(){
    fill(colors[0]);
    beginShape(); //front
    vertex(x, y, z + len);
    vertex(x + len, y, z + len);
    vertex(x + len, y + len, z + len);
    vertex(x, y + len, z + len);
    endShape(CLOSE);
    
    
    fill(colors[1]);
    beginShape(); //back
    vertex(x, y, z);
    vertex(x + len, y, z);
    vertex(x + len, y + len, z);
    vertex(x, y + len, z);
    endShape(CLOSE);
    
    fill(colors[2]);
    beginShape(); //left
    vertex(x, y, z);
    vertex(x, y + len, z);
    vertex(x, y + len, z + len);
    vertex(x, y, z + len);
    endShape(CLOSE);
    
    fill(colors[3]);
    beginShape(); //right
    vertex(x + len, y, z);
    vertex(x + len, y + len, z);
    vertex(x + len, y + len, z + len);
    vertex(x + len, y, z + len);
    endShape(CLOSE);
    
    fill(colors[4]);
    beginShape(); //right
    vertex(x, y, z);
    vertex(x + len, y, z);
    vertex(x + len, y, z + len);
    vertex(x, y, z + len);
    endShape(CLOSE);
    
    fill(colors[5]);
    beginShape(); //right
    vertex(x, y + len, z);
    vertex(x + len, y + len, z);
    vertex(x + len, y + len, z + len);
    vertex(x, y + len, z + len);
    endShape(CLOSE);
  }
  //24 orientations of a cube
  
  
}
