#include <Arduino.h>
#if defined(ESP32)
  #include <WiFi.h>
#elif defined(ESP8266)
  #include <ESP8266WiFi.h>
#endif
#include <Firebase_ESP_Client.h>


//Provide the token generation process info.
#include "addons/TokenHelper.h"
//Provide the RTDB payload printing info and other helper functions.
#include "addons/RTDBHelper.h"

// Insert your network credentials
#define WIFI_SSID "WIFI NAME"
#define WIFI_PASSWORD "PASS "

// Insert Firebase project API Key
#define API_KEY "API KEY"

// Insert RTDB URLefine the RTDB URL */
#define DATABASE_URL "DB URL" 
//Define Firebase Data object
FirebaseData fbdo;

FirebaseAuth auth;
FirebaseConfig config;

unsigned long sendDataPrevMillis = 0;
int count = 0;
bool signupOK = false;
const int irSensor1 = 2; //d0
const int irSensor2 = 16;  
//const int irSensor3 = D2;

void setup() {
  // Initialize the serial communication
  Serial.begin(9600);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED){
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  /* Assign the api key (required) */
  config.api_key = API_KEY;

  /* Assign the RTDB URL (required) */
  config.database_url = DATABASE_URL;

  /* Sign up */
  if (Firebase.signUp(&config, &auth, "", "")){
    Serial.println("ok");
    signupOK = true;
  }
  else{
    Serial.printf("%s\n", config.signer.signupError.message.c_str());
  }

  /* Assign the callback function for the long running token generation task */
  config.token_status_callback = tokenStatusCallback; //see addons/TokenHelper.h
  
  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);
  pinMode(irSensor1, INPUT);
  pinMode(irSensor2, INPUT);

}

void loop() {
  // Read the input from each IR sensor and print the result to the serial monitor
  int irValue1 = digitalRead(irSensor1);
  int irValue2 = digitalRead(irSensor2);
//  int irValue3 = digitalRead(irSensor3);

  Serial.print("IR sensor 1: ");
  Serial.println(irValue1);
  Serial.print("IR sensor 2: ");
  Serial.println(irValue2);
  if(irValue1 == 0)
  {
    Serial.println("Slot 1 Occupied");
  }
  else
  {
    Serial.println("Slot 1 Available");
  }
    if(irValue2 == 0)
  {
    Serial.println("Slot 2 Occupied");
  }
  else
  {
    Serial.println("Slot 2 Available");
  }
  delay(1000);

  if (Firebase.ready() && signupOK && (millis() - sendDataPrevMillis > 1000 || sendDataPrevMillis == 0)){
    sendDataPrevMillis = millis();
    // Write an Int number on the database path test/int
    if (Firebase.RTDB.setInt(&fbdo, "Parking lot/lot1", irValue1)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }

    if (Firebase.RTDB.setInt(&fbdo, "Parking lot/lot2", irValue2)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }

  }

}
