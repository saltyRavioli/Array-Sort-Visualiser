class ArrayEntry {
  String index;
  int value;
  public ArrayEntry (String i, int v) {
    index = i;
    value = v;
  }
  public ArrayEntry (int i, int v) {
    index = i+"";
    value = v;
  }
  public void displaySmall(int x, int y, boolean isRed) {
    //drawing index
    textSize(16);
    fill(255);
    textAlign(CENTER);
    text(index+"", x+25, y-5);
      
    //drawing the rectangle
    rectMode(CORNER);
    if (!isRed) {
      fill(50,100,164); //"light" blue
      stroke(50,100,164);
    }
    else {
      fill(235,109,109); //light red
      stroke(235,109,109);
    }
    rect(x, y, 50, 50);
    
    //drawing value
    textSize(20);
    fill(255);
    text(value+"", x+25, y+33);
  }
  public void display(int x, int y) { //isRed determines whether this is highlighted or not
    //drawing index
    textSize(25);
    fill(255);
    textAlign(CENTER);
    text(index+"", x+100, y-10);
      
    //drawing the rectangle
    rectMode(CORNER);
    fill(50,100,164); //"light" blue
    stroke(50,100,164);
    rect(x, y, 200, 200);
    
    //drawing value
    textSize(50);
    fill(255);
    text(value+"", x+100, y+120);
  }
}
