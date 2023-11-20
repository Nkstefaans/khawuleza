#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>
#include <SPI.h>
#include <MFRC522.h>

#define FIREBASE_HOST "khawuleza-app-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "AIzaSyBZbS4pVmHppGcbj0kxq0n2OHq13fDIAN4"
#define WIFI_SSID "AWE"
#define WIFI_PASSWORD "12345678a"
#define SS_PIN D4
#define RST_PIN D3
#define RFID_MOSI_PIN D7
#define RFID_MISO_PIN D6

MFRC522 mfrc522(SS_PIN, RST_PIN);
int statuss = 0;
int out = 0;

void setup() {
  Serial.begin(9600);
  SPI.begin();
  mfrc522.PCD_Init();
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);

  // Wait for WiFi connection
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("Connected to WiFi");
}

void sendFCM(String content) {
  // Assuming you have a "users" node in your database
  // Replace "user123" with the UID of the specific user
  String userId = "iVui92XKr7VoIjNBpGWCIu4yAnh2";

  // Build the FCM message
  String fcmMessage = "{ \"data\": { \"tag_id\": \"" + content + "\" }, \"to\": \"/topics/" + userId + "\" }";

  // Send the FCM message
  Firebase.setString("fcm", fcmMessage);

  // Handle error
  if (Firebase.failed()) {
    Serial.print("Setting FCM failed:");
    Serial.println(Firebase.error());
  }
}

void loop() {
  // Look for new cards
  if (!mfrc522.PICC_IsNewCardPresent()) {
    return;
  }
  // Select one of the cards
  if (!mfrc522.PICC_ReadCardSerial()) {
    return;
  }

  Serial.println();
  Serial.print(" UID tag :");
  String content = "";
  for (byte i = 0; i < mfrc522.uid.size; i++) {
    Serial.print(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " ");
    Serial.print(mfrc522.uid.uidByte[i], HEX);
    content.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " "));
    content.concat(String(mfrc522.uid.uidByte[i], HEX));
  }
  content.toUpperCase();
  Serial.println();

  // SEND TAG ID TO FIREBASE UNDER SPECIFIC USER
  sendFCM(content);

  // Handle access based on the received tag_id
  if (content.substring(1) == "1C E6 E9 37") {
    Serial.println(" Access Granted ");
  } else {
    Serial.println(" Access Denied ");
  }

  delay(3000);
}


// #include <ESP8266WiFi.h>
// #include <FirebaseArduino.h>
// #include <SPI.h>
// #include <MFRC522.h>
// #include <LiquidCrystal_I2C.h>
// #include <Keypad.h>

// LiquidCrystal_I2C lcd(0x27, 16, 2);

// #define FIREBASE_HOST "khawuleza-app-default-rtdb.firebaseio.com"
// #define FIREBASE_AUTH "AIzaSyBZbS4pVmHppGcbj0kxq0n2OHq13fDIAN4"
// #define WIFI_SSID "AWE"
// #define WIFI_PASSWORD "12345678a"
// #define SS_PIN D4
// #define RST_PIN D3
// #define RFID_MOSI_PIN D7
// #define RFID_MISO_PIN D6

// MFRC522 mfrc522(SS_PIN, RST_PIN);
// int statuss = 0;
// int out = 0;

// void setup() {
//   Serial.begin(9600);
//   SPI.begin();
//   mfrc522.PCD_Init();
//   WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

//   lcd.init();
//   lcd.backlight();
//   lcd.clear();
//   lcd.setCursor(0, 0);
//   lcd.print("Connecting to");
//   lcd.setCursor(0, 1);
//   lcd.print("WiFi...");
//   while (WiFi.status() != WL_CONNECTED) {
//     Serial.print(".");
//     delay(500);
//   }
//   Serial.println();
//   Serial.print("connected: ");
//   lcd.clear();
//   lcd.setCursor(0, 0);
//   lcd.print("connected: ");
//   lcd.setCursor(0, 1);
//   Serial.println(WiFi.localIP());
//   lcd.println(WiFi.localIP().toString());
//   lcd.println();

//   Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
// }



// void loop() {
//   if (!mfrc522.PICC_IsNewCardPresent()) {
//     return;
//   }
//   if (!mfrc522.PICC_ReadCardSerial()) {
//     return;
//   }

//   Serial.println();
//   Serial.print(" UID tag :");
//   String content = "";
//   for (byte i = 0; i < mfrc522.uid.size; i++) {
//     Serial.print(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " ");
//     Serial.print(mfrc522.uid.uidByte[i], HEX);
//     content.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " "));
//     content.concat(String(mfrc522.uid.uidByte[i], HEX));
//   }
//   content.toUpperCase();
//   Serial.println();

//   // Assuming you have a "users" node in your database
//   // Replace "user123" with the UID of the specific user
//   String userId = "iVui92XKr7VoIjNBpGWCIu4yAnh2";

//   // SEND TAG ID TO FIREBASE UNDER SPECIFIC USER
//   Firebase.setString("users/" + userId + "/tag_id", content);

//   // handle error
//   if (Firebase.failed()) {
//     Serial.print("setting tag_id failed:");
//     Serial.println(Firebase.error());
//     return;
//   }
//   delay(1000);

//   if (content.substring(1) == "1C E6 E9 37") {
//     lcd.clear();
//     lcd.println("UID" + content.substring(1));
//     lcd.println();
//     delay(3000);
//     lcd.clear();
//     Serial.println(" Access Granted ");
//     String given_access = "GRANTED";
//     Firebase.setString("users/" + userId + "/access", given_access);
//   } else {
//     Serial.println(" Access Denied ");
//     String given_access = "DENIED";
//     Firebase.setString("users/" + userId + "/access", given_access);
//     delay(3000);
//   }
// }


// // #include <ESP8266WiFi.h>
// // #include <FirebaseArduino.h>
// // #include <SPI.h>
// // #include <MFRC522.h>
// // #include <LiquidCrystal_I2C.h>
// // #include <Keypad.h>

// // LiquidCrystal_I2C lcd(0x27, 16, 2);  // set the LCD address to 0x27 for a 16 chars and 2 line display


// // #define FIREBASE_HOST "khawuleza-app-default-rtdb.firebaseio.com"
// // #define FIREBASE_AUTH "AIzaSyBZbS4pVmHppGcbj0kxq0n2OHq13fDIAN4"
// // #define WIFI_SSID "AWE"            //wifi ussd
// // #define WIFI_PASSWORD "12345678a"  // wifi password
// // #define SS_PIN D4
// // #define RST_PIN D3
// // #define RFID_MOSI_PIN D7
// // #define RFID_MISO_PIN D6

// // MFRC522 mfrc522(SS_PIN, RST_PIN);  // Create MFRC522 instance.
// // int statuss = 0;
// // int out = 0;

// // void setup() {

// //   Serial.begin(9600);  // Initiate a serial communication
// //   SPI.begin();         // Initiate  SPI bus
// //   mfrc522.PCD_Init();  // Initiate MFRC522
// //   WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
// //   Serial.print("connecting");
// //   lcd.init();
// //   // turn on the backlight
// //   lcd.backlight();
// //   lcd.clear();
// //   lcd.setCursor(0, 0);  //col=0 row=0
// //   lcd.print("Connecting to");
// //   lcd.setCursor(0, 1);  //col=0 row=0
// //   lcd.print("WiFi...");
// //   while (WiFi.status() != WL_CONNECTED) {
// //     Serial.print(".");
// //     delay(500);
// //   }
// //   Serial.println();
// //   Serial.print("connected: ");
// //   lcd.clear();
// //   lcd.setCursor(0, 0);  //col=0 row=0
// //   lcd.print("connected: ");
// //   lcd.setCursor(0, 1);
// //   Serial.println(WiFi.localIP());
// //   lcd.println(WiFi.localIP().toString());
// //   lcd.println();

// //   Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
// // }

// // void loop() {
// //   // Look for new cards
// //   if (!mfrc522.PICC_IsNewCardPresent()) {
// //     return;
// //   }
// //   // Select one of the cards
// //   if (!mfrc522.PICC_ReadCardSerial()) {
// //     return;
// //   }
// //   //Show UID on serial monitor
// //   Serial.println();
// //   Serial.print(" UID tag :");
// //   String content = "";
// //   byte letter;

// //   for (byte i = 0; i < mfrc522.uid.size; i++) {
// //     Serial.print(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " ");
// //     Serial.print(mfrc522.uid.uidByte[i], HEX);
// //     content.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " "));
// //     content.concat(String(mfrc522.uid.uidByte[i], HEX));
// //   }
// //   content.toUpperCase();
// //   Serial.println();
// //   //SENDING TAG ID TO FIREBASE
// //   Firebase.setString("tag_id", content);
// //   // handle error
// //   if (Firebase.failed()) {
// //     Serial.print("setting /number failed:");
// //     Serial.println(Firebase.error());
// //     return;
// //   }
// //   delay(1000);

// //   if (content.substring(1) == "1C E6 E9 37")  //change UID of the card that you want to give access
// //   {
// //     lcd.clear();
// //     lcd.println("UID" + content.substring(1));
// //     lcd.println();
// //     delay(3000);
// //     lcd.clear();
// //     Serial.println(" Access Granted ");
// //     String given_access = "GRANTED";
// //     Firebase.setString("access", given_access);
// //   }
// //     else {
// //       Serial.println(" Access Denied ");
// //         String given_access = "DENIED";
// //     Firebase.setString("access", given_access);
// //       delay(3000);
// //     }
  
// // }