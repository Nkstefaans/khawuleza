// include the library code:
#include <LiquidCrystal.h>
#include <Keypad.h>
//#include <FirebaseArduino.h>

// initialize the library by associating any needed LCD interface pin
// with the arduino pin number it is connected to
const int rs = 7, en = 6, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
int count = 0;
char c;
String RFid;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);
//Define two variables ‘ROWS and COLS’ of ‘const byte’ type and assign 4 & 3 to them
const byte ROWS = 4;  // four rows
const byte COLS = 3;  // three columns

/* Define 2-Dimension character type array ‘keys’ of 4 rows and 3 columns and assign values to them (1- #)
*/
char keys[ROWS][COLS] = {
  { '1', '2', '3' },
  { '4', '5', '6' },
  { '7', '8', '9' },
  { '*', '0', '#' }
};

// Define two 1-Dimensional byte type array “rowPins colPins” and assign values to them
byte rowPins[ROWS] = { 11, 10, 9, 8 };  // r1, r2, r3, r4 connect to the row pinouts of the keypad
byte colPins[COLS] = { 12, 13, A5 };    // c1, c2, c3 connect to the column pinouts of the keypad

// Define integer type variable ‘count’ and one character type array ‘typed’ of 5 values
char typed[5];  //to get five numbers in that array

//Keypad::Keypad(char*, byte*, byte*, byte, byte)
//Keypad(char *userKeymap, byte *row, byte *col, byte numRows, byte numCols);
Keypad k = Keypad(makeKeymap(keys), rowPins, colPins, ROWS, COLS);


void setup() {
  Serial.begin(9600);
  lcd.setCursor(0, 0);
  // // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
  // Print a message to the LCD.
  lcd.print("Khawuleza...");
  delay(500);
  for (int positionCounter = 0; positionCounter < 16; positionCounter++) {
    // scroll one position right:
    lcd.scrollDisplayRight();
    // wait a bit:
    delay(50);
  }
  lcd.clear();
  lcd.setCursor(1, 0);
  lcd.print("Tap Your Tag");
  delay(500);
  lcd.clear();
  //Serial.print("Scan your RFID TAG");
  // print the number of seconds since reset:
}
void loop() {
  //1. Listen to the RFID Tag
  //2. Verify the tagID with the DB (check balance and tag validity)
  //2.1 Send data(tagID) to the DB via khawuleza API through GSM
  //2.2 GSM waits for response from API
  //2.3 Check if response is successful or not (registered tagID or not){if-else} (display)
  //2.4 Display the response on LCD


  /*The function getKey() returns a key value as you press the key but it does not repeat automatically.
     Also, when we release the key we can track the key RELEASED event if we are use the eventListener feature of the library.
  */
  char key = k.getKey();
  if (key) {
    //typed[i] = key;      //storing data in character array
    String password = "";
    Serial.println(key);
    lcd.print(key);
    //int y = atoi(key);
    if (password.lenght() > 0) password += key {
      lcd.clear();
    }
  }
  // typed[count] = key;      //storing data in character array
  // Serial.println(key);
  // lcd.print(key);
  // if(key== '*'){
  //   lcd.clear();
  // }
  count++;


  //   while(Serial.available()>0){
  //       c = Serial.read();
  //       count++;
  //       RFid += c;
  //       lcd.cursor();
  //       //12 is lenght of digit
  //       if(RFid ="010D429BBF6A"){
  //       //Serial.print(RFid);
  //         lcd.clear();
  //         lcd.print("Access Allowed! ");
  //         //010D429BBF6A
  //         delay(50);
  //         lcd.clear();
  //         lcd.print("Enter OTP");
  //       }
  //       else if (RFid !="010D429BBF6A"){
  //         lcd.clear();
  //         lcd.print("Insuficient Funds! ");
  //         delay(250);

  //       }

  //     }
  //     count = 0; // reset count for the next read
  //     RFid =""; // reset id for storing the next read
  //     delay(50);
  // }
}