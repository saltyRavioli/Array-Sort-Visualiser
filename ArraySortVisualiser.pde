int programState = 0;
int sortState = 0;
//0 is input
//1 is find max/min
//2 is range
//3 is frequency
//4 is printing the sorted array
Array inputArray;
ArrayEntry min;
ArrayEntry max;
ArrayEntry range;
Array frequencyArray;
final int FRAME_RATE = 10; //probably not useful, but whatever
//0 is main menu
//1 is sort
//2 is description of algorithm
//3 is description of variables
//4 is exit
void setup() {
  //https://www.color-hex.com/color-palette/90273 colour scheme is here btw
  size(1600, 1000);
  background(0,21,48); //"dark" blue
  textSize(25);
  fill(255);
  textAlign(LEFT);
  text("Press any key to continue", 50, 50);
  textAlign(RIGHT);
  text("Press any key to continue", 1550, 50);
  if (keyPressed||mousePressed) {
    programState = 0;
  }
  frameRate(FRAME_RATE);
}
void draw() {
  background(0, 21, 48);
  if (programState==0) {
    mainMenu();
  }
  else if (programState==1) {
    sort();
  }
  else if (programState==2) {
    descriptionOfAlgorithm();
  }
  else if (programState==3) {
    descriptionOfVariables();
  }
  else if (programState==4) {
    //uh idk what to put here
  }
}
public void mainMenu() {
  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("Pigeonhole Sort", 800, 130);
  //a selection box that appears if the mouse hovers over one of the options
  stroke(0,49,113);
  fill(0,49,113);
  rectMode(CENTER);
  if (mouseX>350 && mouseX<1050 && mouseY>250 && mouseY<370) {
    rect(800, 280, 700, 150);
  }
  else if (mouseX>350 && mouseX<1050 && mouseY>350 && mouseY<500) {
    rect(800, 430, 700, 150);
  }
  else if (mouseX>350 && mouseX<1050 && mouseY>450 && mouseY<650) {
    rect(800, 580, 700, 150);
  }
  else if (mouseX>350 && mouseX<1050 && mouseY>550 && mouseY<800) {
    rect(800, 730, 700, 150);
  }
  
  //checking for clicks and changing program state
  //0 is main menu
  //1 is sort
  //2 is description of algorithm
  //3 is description of variables
  //4 is exit
  if (mousePressed) {
    if (mouseX>350 && mouseX<1050 && mouseY>250 && mouseY<370) {
      programState = 1;
    }
    else if (mouseX>350 && mouseX<1050 && mouseY>350 && mouseY<500) {
      programState = 2;
    }
    else if (mouseX>350 && mouseX<1050 && mouseY>450 && mouseY<650) {
      descriptionOfVariablesSetup();
      programState = 3;
    }
    else if (mouseX>350 && mouseX<1050 && mouseY>550 && mouseY<800) {
      programState = 4;
    }
  }
  
  textSize(50);
  fill(255);
  text("Sort", 800, 300);
  text("Description of Algorithm", 800, 450);
  text("Description of Variables", 800, 600);
  text("Exit", 800, 750);
  textAlign(LEFT);
}

public void descriptionOfAlgorithm() {
  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("Pigeonhole Sort", 800, 130);
  textSize(30);
  textAlign(LEFT);
  //gonna have to update this later, if I have time...
  text("The pigeonhole sort is a good method to use when the range, the difference between the largest ", 100, 250);
  text("and smallest values, in the input array isn’t too large. It works by storing the frequency of ", 100, 350);
  text("each number in the array (which is like counting the number of pigeons in each hole) in a ", 100, 450);
  text("separate array. Then you can print each number the specified number of times in the frequency ", 100, 550);
  text("array. The time complexity is O(size of input array + range).", 100, 650);
  textSize(50);
  fill(255);
  textAlign(CENTER);
  text("Press any key to continue", 800, 900);
  if (keyPressed||mousePressed) {
    programState = 0;
  }
}

public void descriptionOfVariablesSetup() { //why did I decide to randomize the display arrays and why does frameRate hate me
  //well at least my methods are more readable now
  //input array
  int [] input = new int [7];
  int minValue = 20;
  int maxValue = 0;
  for(int x=0; x<7; x++) {
    input[x] = (int)(Math.random()*21);
    if (input[x]<minValue) {
      minValue = input[x];
    }
    if (input[x]>maxValue) {
      maxValue = input[x];
    }
  }
  inputArray = new Array(input);
  //max and min
  min = new ArrayEntry("min", minValue);
  max = new ArrayEntry("max", maxValue);
  //range
  range = new ArrayEntry("range", maxValue-minValue+1);
  //frequency
  ArrayEntry [] frequency = new ArrayEntry [range.value];
  for (int x=0; x<frequency.length; x++) {
    frequency[x] = new ArrayEntry (x+minValue, 0);
  }
  for (int x : input) {
    frequency[x-minValue].value++;
  }
  frequencyArray = new Array(frequency);
}

public void descriptionOfVariables() {
  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("Pigeonhole Sort", 800, 130);
  
  //input array
  inputArray.prevDisplayNextFiveStartIndex = -1;
  inputArray.displayWhole(605, 210);
  textAlign(CENTER);
  textSize(25);
  text("input", 800, 180);
  textSize(30);
  text("input: the array to be sorted.", 800, 310);
  
  //max and min
  min.display(1100, 360);
  max.display(1310, 360);
  textAlign(CORNER);
  textSize(30);
  text("min: stores the smallest element in the input array.", 310, 400);
  text("In the array above, it is "+min.value+".", 480, 440);
  text("max: stores the largest element in the input array.", 310, 490);
  text("In the array above, it is "+max.value+".", 480, 530);
   
  //range
  range.display(100, 600);
  textSize(30);
  textAlign(CORNER);
  text("range: the difference between the max and min values of the array.", 350, 700);
  
  //frequency (why did the variables take up so much space)
  frequencyArray.prevDisplayNextFiveStartIndex = -1;
  frequencyArray.displayWhole(800-55*(frequencyArray.array.size()/2), 860);
  textSize(25);
  text("frequency", 800, 830);
  textSize(30);
  text("frequency: an array storing the amount of occurences of each number in the range of the input array.", 800, 960);
  
  textSize(25);
  fill(255);
  textAlign(LEFT);
  text("Press any key to continue", 50, 50);
  textAlign(RIGHT);
  text("Press any key to continue", 1550, 50);
  if (keyPressed||mousePressed) {
    programState = 0;
  }
}
