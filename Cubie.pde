color white = color(235, 234, 225);
color yellow = color(211, 220, 78);
color blue = color(71, 126, 246);
color orange = color(255, 121, 71);
color red = color(255, 58, 56);
color green = color(98, 217, 107);

class Cubie{
  int[][][] rubiks;
  int x = 0;
  int y = 0;
  int z = 0;
  int len;
  color c;
  Face[] faces = new Face[6];
  
  Cubie(int x, int y, int z, int len){
    this.x = x;
    this.y = y;
    this.z = z;
    this.len = len;
    
  }
  
  
}
