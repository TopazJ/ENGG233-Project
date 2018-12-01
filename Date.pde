class Date {
  final String [] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
  int today;
  int hour;
  int minute;
  boolean before_noon;

  Date (int d, int h, int m, boolean beforeNoon) {
    today=d%7;
    hour =h%12;
    minute=m%60;
    before_noon=beforeNoon;
  }
  Date (Date d) {
    today=d.today; 
    hour=d.hour;
    minute=d.minute;
    before_noon=d.before_noon;
  }

  void addHour() {
    if (hour==11&&before_noon==true) {
      hour = 0;
      before_noon=false;
    } else if (hour==11&&today==6&&before_noon==false) {
      hour =0;
      today=0;
      before_noon=true;
    } else if (hour==11&&before_noon==false) {
      hour=0;
      today +=1;
      before_noon=true;
    } else {
      hour+=1;
    }
  }

  void addMinute() {
    if (minute==59) {
      minute=0;
      addHour();
    } else
    {
      minute+=1;
    }
  }
  String displaydate() {
    String date=days[today];
    if (hour<10&&hour>0) {
      date += " 0"+hour;
    } else if (hour==0)
      date+=" 12";
    else
      date +=" "+hour;
    if (minute<10) {
      date+=":0"+minute;
    } else
      date+=":"+minute;
    if (before_noon) {
      date +=" AM";
    } else {
      date +=" PM";
    }

    return date;
  }
  String toString() {
    String date=days[today];
    if (hour<10&&hour>0) {
      date += " 0"+hour;
    } else if (hour==0)
      date+=" 12";
    else
      date +=" "+hour;
    if (minute<10) {
      date+=":0"+minute;
    } else
      date+=":"+minute;
    if (before_noon) {
      date +=" AM";
    } else {
      date +=" PM";
    }

    return date;
  }

  boolean equal(Date date) {
    if (date.today==today&&date.hour==hour&&date.minute==minute&&date.before_noon==before_noon) {
      return true;
    }
    return false;
  }
}