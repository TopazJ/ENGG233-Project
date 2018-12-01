Date d1=new Date(0,6,50,false);
ParkingLot lot = new ParkingLot ();
ControlPanel control=new ControlPanel ();
Gate gate=new Gate();
CarArray cars=new CarArray();
Street streets=new Street();
boolean isrunning=true;
CarPics pics=new CarPics ();

void setup() {
  size(1000, 750);
  pics.loadPics();
}
void draw() {
 control.running();
}
void mousePressed(){
 if (mouseButton==LEFT)
   if (mouseX>425&&mouseX<500&&mouseY<115&&mouseY>40)
   isrunning=true;
   else if(mouseX>500&&mouseX<575&&mouseY<115&&mouseY>40)
   isrunning=false;
}