class Car {
  float centreX;
  float centreY;
  float parkingx;
  float parkingy;
  int colour;
  boolean canPark;
  boolean isParking;
  boolean AssignedSpot;
  boolean parked;
  boolean leaving;
  int counter=1000;
  int spot;
  Date taken;
  Date left;
  int lotx;
  int loty;
  int stallx;
  int stally;
  int counterparking;
  float fee;
  PriceCalculator cost;
  boolean justLeaving;
  boolean onwayout;
  boolean didPark;
  boolean active=true;
  String holdfee;

  Car(float x, float y) {

    centreX=x;
    centreY=y;
    isParking=boolean(int(random(0, 2)));
    colour=int(random(1, 12));
  }

  void DisplayCarEW() {
    image(pics.RIEW(colour), centreX-33.5, centreY-16.5);
    if (isParking){
      fill(255);
     text("Parking...",centreX-30,centreY-20); 
    }
  }
  void DisplayCarNS() {
    image(pics.RINS(colour), centreX-16.5, centreY-33.5);
  }

  void MoveCar() {
    counter--;
    if (gate.closed) {
      canPark=false;
      isParking=false;
    } else {
      canPark=true;
    }
    if (isParking&&canPark||AssignedSpot||onwayout) {
      if (counter<=1000&&counter>833) {
        DisplayCarEW();
        centreX+=3;
      } else if (counter<=833&&counter>830) {
        centreX=500;
        DisplayCarNS();
        centreY+=3;
      } else if (counter==829) {
        DisplayCarNS();
        AssignSpot();
      } else if (counter==828) {
        if (left.equal(d1)&&cars.DetectLeave(loty)) {
          Leaving();
        } else if (left.equal(d1)&&cars.DetectLeave(loty)==false) {
          left.addMinute();
          Parking();
          if (parked)
            DisplayCarEW();
          else {
            DisplayCarNS();
          }
          counter=829;
        } else {
          Parking();
          if (parked)
            DisplayCarEW();
          else {
            DisplayCarNS();
          }
          counter=829;
        }
      } else if (counter==827) {
        MoveLeave();
        counter=828;
      } else if (counter<=826) {
        DisplayCarEW();
        centreX=960-counter;
      }
    } else if (centreY==200&&isParking&&canPark==false) {
      DisplayCarEW();
      centreX+=3;
    } else if (centreY>200&&isParking&&canPark==false) {
      DisplayCarNS();
      centreX=500;
      centreY+=3;
    } else if (isParking==false&&didPark==false) {
      if (centreX<1040) {
        DisplayCarEW();
        centreX+=3;
      } else {
        active=false;
        counter=0;
      }
    }
  }

  void AssignSpot() {
    int w=int(random(0, 2));
    int x=int(random(0, 3));
    int y=int(random(0, 2));
    int z=int(random(0, 5));
    DisplayCarNS();
    if (lot.parkinglot[w][x].stall_array[y][z].occupied) {
      DisplayCarNS();
      AssignSpot();
    } else {
      DisplayCarNS();
      isParking=false;
      canPark=false;
      AssignedSpot=true;
      didPark=true;
      lotx=w;
      loty=x;
      stallx=y;
      stally=z;
      parkingx=lot.parkinglot[w][x].stall_array[y][z].posX;
      parkingy=lot.parkinglot[w][x].stall_array[y][z].posY;
      lot.parkinglot[lotx][loty].stall_array[stallx][stally].setStatus(true, d1);
      taken=new Date(d1);
      control.customers+=1;
      AssignLeave();
    }
  }

  void Parking() {  
    if (parked) {
    } else {
      if (loty==0) {
        centreY+=2;
        DisplayCarNS();
        if (centreY==325) {
          centreX=lot.parkinglot[lotx][loty].stall_array[stallx][stally].posX+38.5;
          centreY=lot.parkinglot[lotx][loty].stall_array[stallx][stally].posY+20;
          parked=true;
        }
      }
      if (loty==1) {
        centreY+=2;
        DisplayCarNS();
        if (centreY==445) {
          centreX=lot.parkinglot[lotx][loty].stall_array[stallx][stally].posX+38.5;
          centreY=lot.parkinglot[lotx][loty].stall_array[stallx][stally].posY+20;
          parked=true;
        }
      }
      if (loty==2) {
        centreY+=2;
        DisplayCarNS();
        if (centreY==575) {
          centreX=lot.parkinglot[lotx][loty].stall_array[stallx][stally].posX+38.5;
          centreY=lot.parkinglot[lotx][loty].stall_array[stallx][stally].posY+20;
          parked=true;
        }
      }
    }
  }

  void Leaving() {
    leaving=true;
    AssignedSpot=false;
    lot.parkinglot[lotx][loty].stall_array[stallx][stally].setStatus(false, d1);
    cost=new PriceCalculator(taken, left);
    cost.CalcPrice();
    fee=cost.fee;
    parked=false;
    justLeaving=true;
    onwayout=true;
    holdfee=nf(fee,1,2);
    fee=parseFloat(holdfee);
    counter=828;
  }

  void MoveLeave() {
    if (loty==0&&justLeaving) {
      centreY=325;
      centreX=500;
      DisplayCarNS();
      justLeaving=false;
    } else if (loty==1&&justLeaving) {
      centreY=445;
      centreX=500;
      DisplayCarNS();
      justLeaving=false;
    } else if (loty==2&&justLeaving) {
      centreY=575;
      centreX=500;
      DisplayCarNS();
      justLeaving=false;
    }
    if (justLeaving==false) {
      if (centreY<705) {
        if (600<centreY&&centreY<700&&onwayout) {
          if (centreY==601) {
            control.feetotal+=fee;
          }
          gate.OpenBottomGate(fee);
        }
        DisplayCarNS();
        centreY+=2;
      } else if (centreY==705&&centreX<1040) {
        leaving=false;
        DisplayCarEW();
        centreY=705;
        centreX+=3;
      } else if (centreX>1040) {
        onwayout=false;
        active=false;
      }
    }
  }

  void AssignLeave() {
    DisplayCarNS();
    Date change=new Date (taken);
    for (int i=0; i<15; i++) {
      change.addMinute();
    }
    while (randomgen()) {
      change.addMinute();
    }
    while (randomgen()) {
      change.addHour();
    }
    
    if (change.equal(taken)==false){
    left=new Date (change);}
    else
    AssignLeave();
  }
  boolean randomgen() {
    if (int(random(0, 100))>33) {
      return true;
    }
    return false;
  }
}