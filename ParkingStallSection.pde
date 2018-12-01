class ParkingStallSection {
  ParkingStall [][] stall_array;
  float posX;
  float posY;

  ParkingStallSection(float x, float y) {
    posX=x;
    posY=y;
    stall_array=new ParkingStall[2][5]; 
    for (int i=0; i<stall_array.length; i++) {
      for (int j=0; j<stall_array[i].length; j++) {
        stall_array[i][j]=new ParkingStall(posX, posY, 77, 40);
        posX+=77;
      }
      posX=x;
      posY+=40;
    }
  }

  void drawSection() {
    for (int i=0; i<stall_array.length; i++) {
      for (int j=0; j<stall_array[i].length; j++) {
        stall_array[i][j].drawStall();
      }
    }
  }
}