class PriceCalculator {
  Date initial;
  Date end;
  float fee=0;
  double fee2;
  int minutesStayed=0;
  int counter=0;


  PriceCalculator(Date d1, Date d2) {
    initial=new Date (d1);
    end=new Date (d2);
  }
  void CalcPrice() {
    if (initial.equal(end)){
     fee=468; 
    }
    else{
    while (end.equal(initial)==false) {
      
    fee2+=CheckDate()/60.0;
    initial.addMinute();
    }
  fee=(float)fee2;}
  }


  float CheckDate() {
    if (initial.today<6&&initial.today>=0)
      return 3;
    return 1.5;
  }
}