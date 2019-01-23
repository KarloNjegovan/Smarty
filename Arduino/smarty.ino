#include <ESP8266WiFi.h>
#include "DHT.h"
#include "Adafruit_MQTT.h"
#include "Adafruit_MQTT_Client.h"
#include <FS.h>
#include <Wire.h>
#include "SSD1306.h"

SSD1306  display(0x3c, 4, 5);

//WiFi postavke
const char* ssid = "WiFi";
const char* password = "LoZiNkA";

//senzor temperature i vlage
#define DHTPIN 14
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

//Postavke za spajanje na adafruit.io
#define AIO_SERVER      "io.adafruit.com"
#define AIO_SERVERPORT  8883                   // 8883 for MQTTS
#define AIO_USERNAME    "INSERT YOUR AIO_USERNAME"
#define AIO_KEY         "INSERT YOUR AIO_KEY"

unsigned long currentMillis;
long previousMillis = 0;

WiFiClientSecure client;
Adafruit_MQTT_Client mqtt(&client, AIO_SERVER, AIO_SERVERPORT, AIO_USERNAME, AIO_KEY);

// io.adafruit.com SHA1
const char* fingerprint = "INSERT YOUR FINGERPRINT";

//Feed
Adafruit_MQTT_Publish temperature = Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/temperature");
Adafruit_MQTT_Publish humidity = Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/humidity");

void setup() {

  Serial.begin(115200);
  dht.begin();
  
  Serial.println(); Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
 
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println();
 
  Serial.println("WiFi connected");
  Serial.println("IP address: "); Serial.println(WiFi.localIP());

  display.init();
  display.flipScreenVertically();
  display.setFont(ArialMT_Plain_16);
  display.clear();

  SPIFFS.begin();
  {
    Dir dir = SPIFFS.openDir("/");
    while (dir.next()) {
      String fileName = dir.fileName();
      size_t fileSize = dir.fileSize();
    }
  }

  //io.adafruit.com SSL cert
  verifyFingerprint();

  previousMillis = millis();
}



void loop() {
  
  MQTT_connect();

  currentMillis = millis();

  //slanje temperature i vlage ako je prošlo 5 sekunda
    float temp_dht = dht.readTemperature();
    float hum_dht = dht.readHumidity();

    if (isnan(temp_dht) || isnan(hum_dht)) {
      return;
    }
    
    if (currentMillis - previousMillis > 4000 && send_th) {
      previousMillis = currentMillis;
      send_th = false;

      if (!temperature.publish(temp_dht)) {
        Serial.println(F("Failed"));
      }
      else {
        Serial.println(F("OK!"));
      }

      if (!humidity.publish(hum_dht)) {
        Serial.println(F("Failed"));
      }
      else {
        Serial.println(F("OK!"));
      }
    }

}
