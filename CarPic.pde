class CarPics {
  PImage CarOEW, CarONS; 
  PImage CarBEW, CarBNS;
  PImage CarGEW, CarGNS;
  PImage CarDBEW, CarDBNS;
  PImage CarDGEW, CarDGNS;
  PImage CarPEW, CarPNS;
  PImage CarVEW, CarVNS;
  PImage CarREW, CarRNS;
  PImage CarTEW, CarTNS;
  PImage CarYEW, CarYNS;
  PImage CarYSEW, CarYSNS;

  void loadPics() {
    CarOEW=loadImage("CarOEW.png");
    CarONS=loadImage("CarONS.png");
    CarBEW=loadImage("CarBEW.png"); 
    CarBNS=loadImage("CarBNS.png");
    CarGEW=loadImage("CarGEW.png");
    CarGNS=loadImage("CarGNS.png");
    CarDBEW=loadImage("CarDBEW.png");
    CarDBNS=loadImage("CarDBNS.png");
    CarDGEW=loadImage("CarDGEW.png");
    CarDGNS=loadImage("CarDGNS.png");
    CarPEW=loadImage("CarPEW.png");
    CarPNS=loadImage("CarPNS.png");
    CarVEW=loadImage("CarVEW.png");
    CarVNS=loadImage("CarVNS.png");
    CarREW=loadImage("CarREW.png");
    CarRNS=loadImage("CarRNS.png");
    CarTEW=loadImage("CarTEW.png");
    CarTNS=loadImage("CarTNS.png");
    CarYEW=loadImage("CarYEW.png");
    CarYNS=loadImage("CarYNS.png");
    CarYSEW=loadImage("CarYSEW.png");
    CarYSNS=loadImage("CarYSNS.png");
  }

  PImage RIEW(int a) {
    if (a==1)
    return CarOEW;
    else if(a==2)
    return CarYEW;
    else if(a==3)
    return CarBEW;
    else if(a==4)
    return CarGEW;
    else if(a==5)
    return CarDBEW;
    else if(a==6)
    return CarDGEW;
    else if(a==7)
    return CarPEW;
    else if(a==8)
    return CarVEW;
    else if(a==9)
    return CarREW;
    else if(a==10)
    return CarTEW;
    else
    return CarYSEW;
  }
  
  PImage RINS(int a){
    if (a==1)
    return CarONS;
    else if(a==2)
    return CarYNS;
    else if(a==3)
    return CarBNS;
    else if(a==4)
    return CarGNS;
    else if(a==5)
    return CarDBNS;
    else if(a==6)
    return CarDGNS;
    else if(a==7)
    return CarPNS;
    else if(a==8)
    return CarVNS;
    else if(a==9)
    return CarRNS;
    else if(a==10)
    return CarTNS;
    else
    return CarYSNS;
  }
}