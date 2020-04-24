String input = "";
int inputState = 0; //why are there so many state variables
//0 is number of numbers
//1 is the array
int numberOfNumbers = 0;
int numbersInputted = 0;
String numbersInputtedSoFar = ""; 
String curNumber = ""; //so many global variables...
int [] pigeonHoleInputArray;
public void getInput() { //sometimes this bugs out for no reason
  if (numbersInputted>=numberOfNumbers && inputState == 1) { //for checking if we've inputted enough
    sortState = 1;
  }
  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("Pigeonhole Sort", 800, 130);
  if (keyPressed) {
    if (inputState == 0) {
      if (key>='0' && key<='9' && input.length()<3) {
        input += key;
      }
      else if (key == BACKSPACE && input.length()!=0) {
        input = input.substring(0, input.length()-1);
      }
      else if ((key == ENTER || key == RETURN) && input.length()>0) {
        int temp = Integer.parseInt(input);
        if (temp<=20 && temp>0) {
          numberOfNumbers = temp;
          pigeonHoleInputArray = new int [numberOfNumbers];
          inputState = 1;
        }
      }
    }
    else if (inputState == 1) { //yay copy pasted code very good program design
      if (key>='0' && key<='9' && curNumber.length()<3) {
        curNumber += key;
      }
      else if (key == BACKSPACE && curNumber.length()!=0) {
        curNumber = curNumber.substring(0, curNumber.length()-1);
      }
      else if ((key == ENTER || key == RETURN || key == ' ') && curNumber.length()>0) {
        int temp = Integer.parseInt(curNumber);
        if (temp>=0 && temp<=50) {
          pigeonHoleInputArray[numbersInputted] = temp;
          numbersInputtedSoFar+=curNumber+", ";
          curNumber = "";
          numbersInputted++;
        } 
      }
    }
  }
  textSize(50);
  text("Enter the amount of numbers in your array: ", 800, 250);
  textSize(40);
  text("The maximum limit is 20.", 800, 300);
  textSize(30);
  text(input, 800, 350);
  if (input.length()>2 || (input.length()==2 && input.charAt(0)>'2') || (input.length()==2 && input.charAt(0)=='2' && input.charAt(1)>'0')) {//i love easily readable code!
    text("Invalid input!", 800, 400);
  }
  
  if (inputState == 1) {
      textSize(50);
      text("Enter the numbers in your array: ", 800, 500);
      textSize(40);
      text("Keep it between 0 and 50 (inclusive).", 800, 550);
      textSize(30);
      text(numbersInputtedSoFar+curNumber, 800, 600);
      if (curNumber.length()>2 || (curNumber.length()==2 && curNumber.charAt(0)>'5') || (curNumber.length()==2 && curNumber.charAt(0)=='5' && curNumber.charAt(1)>'0')) {//i love easily readable code!
        text("Invalid input!", 800, 650);
      }
  }
}
