// include the library code:
#include <LiquidCrystal.h>
// initialize the library by associating any needed LCD interface pin
// with the arduino pin number it is connected to
const int rs = 12, en = 11, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);
void setup() {
  // set up the LCD's number of columns and rows:
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
  // print the number of seconds since reset:
}
void loop() {
  //1. Listen to the RFID Tag
  //2. Verify the tagID with the DB (check balance and tag validity)
  //2.1 Send data(tagID) to the DB via khawuleza API through GSM
  //2.2 GSM waits for response from API 
  //2.3 Check if response is successful or not (registered tagID or not){if-else} (display)
  //2.4 Display the response on LCD

}