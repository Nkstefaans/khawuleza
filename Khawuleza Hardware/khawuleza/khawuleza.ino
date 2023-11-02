#include <LiquidCrystal.h>
#include <Keypad.h>
#include <AltSoftSerial.h>

#include <SPI.h>
#include <MFRC522.h>
#define RST_PIN 9                  // Configurable, see typical pin layout above
#define SS_PIN 10                  // Configurable, see typical pin layout above
MFRC522 mfrc522(SS_PIN, RST_PIN);  // Create MFRC522 instance

AltSoftSerial RFID_Serial;

const byte ROWS = 4;
const byte COLS = 3;
char keys[ROWS][COLS] = {
  { '1', '2', '3' },
  { '4', '5', '6' },
  { '7', '8', '9' },
  { '*', '0', '#' }
};

byte rowPins[ROWS] = { A4, 8, A0, A2 };  // Row pins
byte colPins[COLS] = { A3, A5, A1 };     // Column pins

Keypad keypad = Keypad(makeKeymap(keys), rowPins, colPins, ROWS, COLS);

LiquidCrystal lcd(2, 3, 4, 5, 6, 7);  // LCD pins

const String password = "1234";
String enteredPass = "";
bool passEntered = false;
String RFid = "";
int count = 0;
char c;

void setup() {
  //.begin(9600);
  //---------RFID--------------------
  //RFID_Serial.begin(9600);

  Serial.begin(115200);  // Initialize serial communications with the PC
  while (!Serial)
    ;                                 // Do nothing if no serial port is opened (added for Arduinos based on ATMEGA32U4)
  SPI.begin();                        // Init SPI bus
  mfrc522.PCD_Init();                 // Init MFRC522
  delay(4);                           // Optional delay. Some board do need more time after init to be ready, see Readme
  mfrc522.PCD_DumpVersionToSerial();  // Show details of PCD - MFRC522 Card Reader details
  Serial.println(F("Scan PICC to see UID, SAK, type, and data blocks..."));
  //------------------------------
  lcd.begin(16, 2);
  lcd.clear();
  lcd.print("KHAWULEZA");
  //delay(1000);
  for (int positionCounter = 0; positionCounter < 16; positionCounter++) {
    // scroll one to the right position right:
    lcd.scrollDisplayRight();
    // wait a bit:
    delay(100);
  }
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Tap your tag");
}

void loop() {
  // tag logic comes before the password logic
  // 1. Listen to the RFID Tag
  // 2. Verify the tagID with the DB (check balance and tag validity)
  // 2.1 Send data(tagID) to the DB via khawuleza API through GSM
  // 2.2 GSM waits for response from API
  // 2.3 Check if response is successful or not (registered tagID or not){if-else} (display)
  // 2.4 Display the response on LCD

  // lcd.clear();
  // lcd.print("Tap your tag");
  // delay(500);
  // lcd.clear();

  // logic for tagID
  //scanRfid();
  // Reset the loop if no new card present on the sensor/reader. This saves the entire process when idle.
  if (!mfrc522.PICC_IsNewCardPresent()) {
    return;
  }
  // Select one of the cards
  if (!mfrc522.PICC_ReadCardSerial()) {
    return;
  }
  // Dump debug info about the card; PICC_HaltA() is automatically called
  mfrc522.PICC_DumpToSerial(&(mfrc522.uid));
}

void scanRfid() {

  while (RFID_Serial.available() && Serial.available()) {
    Serial.println(RFID_Serial.read());
    //c = RFID_Serial.read();
    // count++;
    // RFid += c;
    // if (count == 12)
    // {
    //   RFID_Serial.println(RFid);
    //   //RFID_Serial.println(RFid);
    //   // break;

    //   if (RFid == "AB123456789A")
    //   {
    //     lcd.clear();
    //     RFID_Serial.println("Access Granted");
    //     // lcd.print("Access Granted");
    //     delay(500);
    //     lcd.clear();
    //     enterPassword();
    //   }
    //   else
    //   {
    //     RFID_Serial.println("Denied");
    //   }
    //}
  }
  count = 0;
  RFid = "";
  delay(500);
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
