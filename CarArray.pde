class CarArray {
  int countercar=55;
  Car[] cararray=new Car [1];

  CarArray() {
    cararray[0]=new Car (-40, 200);
  }

  Car CreateCar() {
    Car a=new Car(-40, 200);
    return a;
  }

  void MakeCar() {
    countercar--;
    if (countercar==0) {
      countercar=int(random(40, 70));
      if (rand()) {
        cars.cararray=(Car[])append(cars.cararray, CreateCar());
      }
    }
    DisplayCar();
  }

  void DisplayCar() {
    for (int i=0; i<cararray.length; i++) {
      cararray[i].MoveCar();
    }
  }

  boolean rand() {
    int a=int(random(0, 100));
    if (a<=GenCar())
      return true;
    else
      return false;
  }
  boolean DetectLeave(int a) {
    boolean leaving=true;
    for (int i=0; i<cararray.length; i++) {
      if (a==0&&((cararray[i].leaving&&cararray[i].centreY>=220&&cararray[i].centreY<=420)||(cararray[i].centreY>=220&&cararray[i].centreY<=420&&cararray[i].parked==false))) {
        leaving=false;
      } else if (a==1&&((cararray[i].leaving&&cararray[i].centreY>=340&&cararray[i].centreY<=560)||(cararray[i].centreY>=340&&cararray[i].centreY<=560&&cararray[i].parked==false))) {
        leaving=false;
      } else if (a==2&&((cararray[i].leaving&&cararray[i].centreY>=470&&cararray[i].centreY<=690)||(cararray[i].centreY>=470&&cararray[i].centreY<=690&&cararray[i].parked==false))) {
        leaving=false;
      }
    }
    return leaving;
  }
  int GenCar() {
    if (d1.today<5) {
      if ((d1.hour<=8&&d1.hour>=7&&d1.before_noon)||(d1.hour<=7&&d1.hour>=6&&d1.before_noon==false)) {
        return 99;
      } else if ((d1.hour<7&&d1.before_noon)||(d1.hour>=10&&d1.before_noon==false)) {
        return 20;
      } else
        return 50;
    } else
      return 35;
  }
}