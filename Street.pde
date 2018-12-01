class Street {
  String definition="These are the streets";
  
  void drawStreet() {
    strokeWeight(4);
    stroke(255);
    fill(100, 109, 101);
    rect(-4, 670, 1008, 70);
    rect(460, 650, 75, 20);
    rect(-4, 160, 1008, 70);
    rect(460, 230, 75, 20);
    noStroke();
    rect(462, 225, 72, 30);
    rect(462, 645, 72, 30);
    String SStreet="South Street";
    String NStreet="North Street";
    textAlign(CENTER);
    textSize(20);
    fill(255);
    text(NStreet, 500, 185);
    text(SStreet, 500, 695);
    textSize(12);
  }
}