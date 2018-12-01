class ControlPanel {
  int minutes=0;
  int hours=0;
  int counter=20;
  float feetotal=0;
  boolean isDay = false;
  int customers = 0;

  void display() {
    fill(0);
    rect(0, 0, 1000, 159); //CP background

    stroke(255, 255, 255);
    strokeWeight(5);
    fill(80);
    rect(30, 30, 300, 100); //ParkingRate Background
    rect(610, 30, 220, 100); //Simulation Values Background
    
    textAlign(LEFT);
    fill(255);
    textSize(16);
    text("Parking Rates: ", 40, 50);
    textSize(12);
    text("$3.00 / Hour", 40, 80);
    text("$1.50 / Hour", 40, 100); 
    text("Mon - Sat", 140, 80);
    text("Sun", 140, 97);
    text("All Day", 240, 80);
    text("All Day", 240, 100);
    
    textSize(14);
    text("Simulation Values: ", 620, 50);
    textSize(12);
    
    counter--;
    fill(0);
    String date="Current Date and Time: "+d1.displaydate();
    textAlign(RIGHT);
    text(date, 1000, 20);
    if (counter==0) {
      d1.addMinute();
      minutes+=1;
      counter=20;
      if (minutes%60==0) {
        hours+=1;
            
   
      }
    }
    
    if (d1.hour >= 8&&d1.before_noon||d1.hour<8&&d1.before_noon==false)
    {
      fill(135, 206, 235);
      strokeWeight(3);
      rect(860, 35, 120, 100);//Day Sky

      strokeWeight(0);
      fill(255, 255, 0);
      ellipse(920, 85, 50, 50);//Day Sun
    } 
    
    else
    {
      fill(0);
      strokeWeight(3);
      rect(860, 35, 120, 100);//Night Sky
      
      strokeWeight(0);
      fill(255);
      ellipse(915, 85, 50, 50); //Night Moon
      fill(0);
      ellipse(900, 85, 50,50);
      noStroke();
      rect(863,38,43,93);
      
    }
    
    fill(255);
    textAlign(LEFT);
    text(d1.displaydate(),873,20);
    String text1="Time Elapsed: Hours: "+hours;
    text(text1, 620, 87);
    String decimalplaces=nf(feetotal,1,2);
    String feetext="Profits: $"+decimalplaces;
    text(feetext,620,70);
    String customercount = "Customers: "+customers;
    text(customercount,620,104);
    
    rect(425,40,75,75);
    fill(0);
    triangle(435,50,490,77.5,435,105);
    fill(255);
    rect(500,40,75,75);
    fill(0);
    rect(515,50,10,55);
    rect(550,50,10,55);
  }
  void running() {
    if (isrunning) {
      lot.displaylot();
      streets.drawStreet();
      control.display();
      cars.MakeCar();
      gate.Display(lot);
    }
    else{
    textSize(100);
    textAlign(CENTER);
    fill(0);
    rectMode(CENTER);
    rect(500,340,400,140);
    fill(200,0,0);
    text("PAUSED",500,375);
    rectMode(CORNER);
    }
  }
}