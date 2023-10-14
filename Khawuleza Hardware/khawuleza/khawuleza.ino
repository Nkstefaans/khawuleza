// // include the library code:
// #include <LiquidCrystal.h>
// #include <Keypad.h>
// //#include <FirebaseArduino.h>

// // initialize the library by associating any needed LCD interface pin
// // with the arduino pin number it is connected to
// const int rs = 7, en = 6, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
// int count = 0;
// char c;
// const String password = "1234";
// String enteredPass = "";
// bool passEntered = false;
// String RFid;
// LiquidCrystal lcd(rs, en, d4, d5, d6, d7);
// //Define two variables ‘ROWS and COLS’ of ‘const byte’ type and assign 4 & 3 to them
// const byte ROWS = 4;  // four rows
// const byte COLS = 3;  // three columns

// /* Define 2-Dimension character type array ‘keys’ of 4 rows and 3 columns and assign values to them (1- #)
// */
// char keys[ROWS][COLS] = {
//   { '1', '2', '3' },
//   { '4', '5', '6' },
//   { '7', '8', '9' },
//   { '*', '0', '#' }
// };

// // Define two 1-Dimensional byte type array “rowPins colPins” and assign values to them
// byte rowPins[ROWS] = { 11, 10, 9, 8 };  // r1, r2, r3, r4 connect to the row pinouts of the keypad
// byte colPins[COLS] = { 12, 13, A5 };    // c1, c2, c3 connect to the column pinouts of the keypad

// // Define integer type variable ‘count’ and one character type array ‘typed’ of 5 values
// char typed[5];  //to get five numbers in that array

// //Keypad::Keypad(char*, byte*, byte*, byte, byte)
// //Keypad(char *userKeymap, byte *row, byte *col, byte numRows, byte numCols);
// Keypad k = Keypad(makeKeymap(keys), rowPins, colPins, ROWS, COLS);


// void setup() {
//   Serial.begin(9600);
//   // // set up the LCD's number of columns and rows:
//   lcd.begin(16, 2);
//   lcd.clear();
//   // Print a message to the LCD.
//   lcd.print("Khawuleza...");
//   delay(50);
//   for (int positionCounter = 0; positionCounter < 16; positionCounter++) {
//     // scroll one position right:
//     lcd.scrollDisplayRight();
//     // wait a bit:
//     delay(50);
//   }
//   lcd.clear();
//   lcd.setCursor(0, 0);
//   lcd.print("Tap Your Tag");
//   delay(500);
//   lcd.clear();
//   //Serial.print("Scan your RFID TAG");
//   // print the number of seconds since reset:
//   //after verifying tag enter password
// }
// void loop() {
//   //tag logic comes before the password logic
//   //1. Listen to the RFID Tag
//   //2. Verify the tagID with the DB (check balance and tag validity)
//   //2.1 Send data(tagID) to the DB via khawuleza API through GSM
//   //2.2 GSM waits for response from API
//   //2.3 Check if response is successful or not (registered tagID or not){if-else} (display)
//   //2.4 Display the response on LCD


//   /*The function getKey() returns a key value as you press the key but it does not repeat automatically.
//      Also, when we release the key we can track the key RELEASED event if we are use the eventListener feature of the library.
//   */
//   char key = k.getKey();

//   // if (key) {
//   //   if (key == '#') {
//   //     if (passEntered) {
//   //       if (enteredPass == password) {
//   //         lcd.clear();
//   //         lcd.print("Access Granted");
//   //         delay(1000);
//   //         lcd.clear();
//   //         lcd.print("You may board...");
//   //         delay(2000); // Display "Terminating..." for 2 seconds
//   //         lcd.clear();
//   //         setup();
//   //         //exit(0); // Terminate the code
//   //       } else {
//   //         lcd.clear();
//   //         lcd.print("Access Denied");
//   //       }
//   //       delay(2000);  // Display result for 2 seconds
//   //       lcd.clear();
//   //       lcd.print("Enter password:");
//   //       lcd.setCursor(0, 1);
//   //       passEntered = false;
//   //     }
//   //     enteredPass = "";
//   //   } else {
//   //     enteredPass += key;
//   //     lcd.print('*');  // Display an asterisk for each key press
//   //     passEntered = true;
//   //   }
//   // }

//   count++;


//   while (Serial.available() > 0) {
//     c = Serial.read();
//     count++;
//     RFid += c;
//     lcd.cursor();
//     //12 is lenght of digit
//     if (RFid = "010D429BBF6A") {
//       //Serial.print(RFid);
//       // lcd.clear();
//       // lcd.print("Access Allowed! ");
//       // //010D429BBF6A
//       // delay(50);
//       // lcd.clear();
//       //lcd.print("Enter OTP");
//       lcd.clear();
//       lcd.print("Enter password:");
//       lcd.setCursor(0, 1);
//       if (key) {
//         if (key == '#') {
//           if (passEntered) {
//             if (enteredPass == password) {
//               lcd.clear();
//               lcd.print("Access Granted");
//               delay(1000);
//               lcd.clear();
//               lcd.print("You may board...");
//               delay(2000);  // Display "Terminating..." for 2 seconds
//               lcd.clear();
//               setup();
//               //exit(0); // Terminate the code
//             } else {
//               lcd.clear();
//               lcd.print("Access Denied");
//             }
//             delay(2000);  // Display result for 2 seconds
//             lcd.clear();
//             lcd.print("Enter password:");
//             lcd.setCursor(0, 1);
//             passEntered = false;
//           }
//           enteredPass = "";
//         } else {
//           enteredPass += key;
//           lcd.print('*');  // Display an asterisk for each key press
//           passEntered = true;
//         }
//       }
//     } else if (RFid != "010D429BBF6A") {
//       lcd.clear();
//       lcd.print("Insuficient Funds! ");
//       delay(250);

//       //       }

//       //     }
//       //     count = 0; // reset count for the next read
//       //     RFid =""; // reset id for storing the next read
//       //     delay(50);
//       // }
//     }
//   }
// }
#include <LiquidCrystal.h>
#include <Keypad.h>

const byte ROWS = 4;
const byte COLS = 3;
char keys[ROWS][COLS] = {
  { '1', '2', '3' },
  { '4', '5', '6' },
  { '7', '8', '9' },
  { '*', '0', '#' }
};

byte rowPins[ROWS] = { 11, 10, 9, 8 };  // Row pins
byte colPins[COLS] = { 12, 13, A5 };    // Column pins

Keypad keypad = Keypad(makeKeymap(keys), rowPins, colPins, ROWS, COLS);

LiquidCrystal lcd(7, 6, 5, 4, 3, 2);  // LCD pins

const String password = "1234";
String enteredPass = "";
bool passEntered = false;
String RFid = "";
int count = 0;
char c;

void setup() {
  Serial.begin(9600);
  lcd.begin(16, 2);
  lcd.clear();
  lcd.print("KHAWULEZA");
  delay(2000);
  for (int positionCounter = 0; positionCounter < 16; positionCounter++) {
    // scroll one to the right position right:
    lcd.scrollDisplayRight();
    // wait a bit:
    delay(50);
  }
  lcd.clear();
  lcd.setCursor(0, 0);
}

void loop() {


  //logic for tagID
  //scanRfid();


  // Logic for password input
  enterPassword();
}
void scanRfid() {

  while (Serial.available() > 0) {

    lcd.print("TAP YOUR TAG");
    c = Serial.read();
    count++;
    RFid += c;
    // Logic for RFID tag handling
    //if (RFid.length() > 0) {
    // Handle the RFID tag logic
    if (RFid == "010D429BBF6A") {

      lcd.clear();
      lcd.print("Enter password:");
      lcd.setCursor(0, 1);
      enterPassword();
      RFid = "";  // Reset RFID tag
    } else {
      lcd.clear();
      lcd.print("Insufficient Funds!");
      delay(2000);
      RFid = "";  // Reset RFID tag
    }
    //}
  }
}
void enterPassword() {

  char key;
  lcd.print("Enter password:");
  lcd.setCursor(0, 1);
  while (true) {
    key = keypad.getKey();
    if (key == '#') {
      if (passEntered) {
        if (enteredPass == password) {
          lcd.clear();
          lcd.print("Access Granted");
          delay(1000);
          lcd.clear();
          lcd.print("You may board...");
          delay(2000);
          enteredPass = "";
          passEntered = false;
          setup();  // Restart the setup
          return;
        } else {
          lcd.clear();
          lcd.print("Access Denied");
          delay(2000);
          lcd.clear();
          lcd.print("Enter password:");
          lcd.setCursor(0, 1);
          enteredPass = "";
          passEntered = false;
        }
      }
    } else if (key) {
      enteredPass += key;
      lcd.print('*');
      passEntered = true;
    }
  }
}
