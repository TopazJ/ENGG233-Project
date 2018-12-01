class Gate {
  int counterclosed=30;
  int available;
  float fee=0;
  boolean closed=false;
  boolean bottomClosed=true;
  int counter=0;
  String display="0.00";

  void OpenBottomGate(float fee) {
    display=nf(fee, 1, 2);
    bottomClosed=false; 
    counter++;
    if (counter%50==0) {
      bottomClosed=true;
    }
  }


  void Display(ParkingLot lot) {
    int occcounter=0;

    for (int i=0; i<lot.parkinglot.length; i++) {
      for (int j=0; j<lot.parkinglot[i].length; j++) {
        for (int k=0; k<lot.parkinglot[i][j].stall_array.length; k++) {
          for (int l=0; l<lot.parkinglot[i][j].stall_array[k].length; l++) {
            if (lot.parkinglot[i][j].stall_array[k][l].occupied) {
              occcounter+=1;
            }
          }
        }
      }
    }

    strokeWeight(2);
    stroke(0);
    fill(255);
    rect(390, 620, 75, 15);
    textAlign(LEFT, TOP);
    fill(0);
    text("EXIT", 415, 620);
    fill(255, 250, 50);
    rect(390, 635, 75, 15);
    String feetext=("Fee: $"+display);
    fill(0);
    text(feetext, 395, 635);

    fill(255);
    rect(400, 250, 64, 15);
    textAlign(LEFT, TOP);
    fill(0);
    text("ENTER", 412, 250);
    fill(255, 250, 50);
    rect(400, 265, 65, 15);
    String spaces=("Spaces: "+(60-occcounter));
    fill(0);

    if (occcounter==60) {
      closed=true;
      text("Full", 423, 265);
      counterclosed--;
      if (counterclosed==0) {
        strokeWeight(0);
        fill(0);
        rect(465, 246, 65, 8);
        fill(0, 200, 0);
        ellipse(470, 249.5, 5, 5); 
        counterclosed=1;
      } else {
        strokeWeight(0);
        stroke(0);
        fill(0);
        rect(474, 255, -8, -65);
        fill(0, 200, 0);
        ellipse(470, 249.5, 5, 5);
      }
    }

    if (occcounter<60) {
      counterclosed=30;
      closed=false;
      fill(0);
      text(spaces, 402, 265);
      strokeWeight(0);
      stroke(0);
      fill(0);
      rect(474, 255, -8, -65);
      fill(0, 200, 0);
      ellipse(470, 249.5, 5, 5);
    }

    if (bottomClosed) {
      fill(0);
      strokeWeight(0);
      fill(0);
      rect(465, 646, 65, 8);
      fill(0, 200, 0);
      ellipse(470, 650, 5, 5);
    }
    if (bottomClosed==false) {
      strokeWeight(0);
      stroke(0);
      fill(0);
      rect(474, 655, -8, -65);
      fill(0, 200, 0);
      ellipse(470, 650, 5, 5);
    }
  }
}