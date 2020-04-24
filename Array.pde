class Array {
  ArrayList<ArrayEntry> array = new ArrayList<ArrayEntry>();
  int prevDisplayNextFiveStartIndex = 0; //added this late into the project because I realized I need to highlight stuff
  public Array (int [] input) {
    for (int x=0; x<input.length; x++) {
      array.add(new ArrayEntry (x+"", input[x]));
    }
  }
  public Array (ArrayEntry [] input) {
    for (ArrayEntry x : input) {
      array.add(x);
    }
  }
  
  public void displayNextFive(int startIndex, int x, int y) {
    prevDisplayNextFiveStartIndex = startIndex;
    for (int i=startIndex; i<startIndex+5; i++) {
      if (i>=array.size()) {
        return;
      }
      array.get(i).display(x+210*(i-startIndex), y);//note that the dimensions of the square drawn is 200*200
    }
  }
  
  public void displayWhole(int x, int y) {
    int curYValue = y; //formatting purposes
    if (array.size()>25) {
      curYValue-=80*(array.size()/25);
      if (array.size()%25==0) {
        curYValue+=80;
      }
    }
    int cur = 0;
    while (cur<array.size()) {
      for (int i=cur; i<Math.min(array.size(), 26+cur); i++) {
        if (prevDisplayNextFiveStartIndex!=-1 && i>=prevDisplayNextFiveStartIndex && i<prevDisplayNextFiveStartIndex+5)
          array.get(i).displaySmall(x+55*(i-cur), curYValue, true); //note that the dimensions of the square drawn is 50*50
        else
          array.get(i).displaySmall(x+55*(i-cur), curYValue, false);
      }
      curYValue+=80;
      cur+=26;
    }
  }
}
