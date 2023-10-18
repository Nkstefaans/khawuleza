#include <LiquidCrystal.h>
#include <Keypad.h>
#include <SoftwareSerial.h>

const byte ROWS = 4;
const byte COLS = 3;
char keys[ROWS][COLS] = {
  { '1', '2', '3' },
  { '4', '5', '6' },
  { '7', '8', '9' },
  { '*', '0', '#' }
};
#define rxpin 14
#define txpin 15
SoftwareSerial RFID_Serial(rxpin, txpin);
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
  //-----------------------------RFID
  // pinMode(rxpin, INPUT);
  // pinMode(txpin, OUTPUT);
  
  RFID_Serial.begin(57600);
  //------------------------------
  lcd.begin(16, 2);
  lcd.clear();
  lcd.print("KHAWULEZA");
  delay(1000);
  for (int positionCounter = 0; positionCounter < 16; positionCounter++) {
    // scroll one to the right position right:
    lcd.scrollDisplayRight();
    // wait a bit:
    delay(50);
  }
  lcd.clear();
  lcd.setCursor(0, 0);
  // lcd.print("Tap your tag");
  // delay(5000);
  // lcd.clear();
  // lcd.print("Tap your tag");
  // delay(3000);
  // lcd.clear();
  // lcd.print("Tap your tag");
  // delay(1000);
  // lcd.clear();
}

void loop() {
  //tag logic comes before the password logic
  //1. Listen to the RFID Tag
  //2. Verify the tagID with the DB (check balance and tag validity)
  //2.1 Send data(tagID) to the DB via khawuleza API through GSM
  //2.2 GSM waits for response from API
  //2.3 Check if response is successful or not (registered tagID or not){if-else} (display)
  //2.4 Display the response on LCD

  // lcd.clear();
  // lcd.print("Tap your tag");
  // delay(500);
  // lcd.clear();
  //logic for tagID
  scanRfid();
}

void scanRfid() {

  while (RFID_Serial.available() > 0) {
    RFID_Serial.read();
    // c = RFID_Serial.read();
    // count++;
    // RFid += c;
    // if (count == 12) {
    //   RFID_Serial.print(RFid);
    //   //break;

    //   if (RFid == "AB123456789A") {
    //     lcd.clear();
    //     RFID_Serial.print("Access Granted");
    //     //lcd.print("Access Granted");
    //     delay(500);
    //     lcd.clear();
    //     enterPassword();
    //   } else {
        RFID_Serial.println("Denied");
      //}
    }
  //}
  // count = 0;
  // RFid = "";
  // delay(500);
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
          delay(1000);
          enteredPass = "";
          passEntered = false;
          setup();  // Restart the setup
          return;
        } else {
          lcd.clear();
          lcd.print("Access Denied");
          delay(1000);
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
