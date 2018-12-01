class ParkingLot {
  float posX;
  float posY;

  ParkingStallSection[][]parkinglot=new ParkingStallSection[2][3];
  ParkingLot() {
    posY=275;
    posX=80;
    float store=posY;
    for (int i=0; i<parkinglot.length; i++) {
      for (int j=0; j<parkinglot[i].length; j++) {
        parkinglot[i][j]=new ParkingStallSection (posX, posY);
        posY+=132.5;
      }
      posY=store;
      posX+=450;
    }
  }

  void displaylot() {
    background(63, 226, 80);
    fill(100, 109, 101);
    strokeWeight(4);
    stroke(255);
    rect(50, 250, 900, 400);
    noFill();

    for (int i=0; i<parkinglot.length; i++) {
      for (int j=0; j<parkinglot[i].length; j++) {
        parkinglot[i][j].drawSection();
      }
    }
  }
  void setOccupied(Date a) {
    int w=int(random(0, 2));
    int x=int(random(0, 3));
    int y=int(random(0, 2));
    int z=int(random(0, 5));
    lot.parkinglot[w][x].stall_array[y][z].setStatus(true, a);
  }
  void setUnoccupied(Date a) {
    int w=int(random(0, 2));
    int x=int(random(0, 3));
    int y=int(random(0, 2));
    int z=int(random(0, 5));
    lot.parkinglot[w][x].stall_array[y][z].setStatus(false, a);
  }
}