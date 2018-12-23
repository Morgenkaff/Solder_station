

//#include <U8g2lib.h>
#include <U8x8lib.h>
#include <SPI.h>
#include <EEPROM.h>

// Rotary (and rotary-switch) vars
//these pins can not be changed 2/3 are special pins
int encoderPin1 = 3; // "Activater"
int encoderPin2 = 2; // Direction
volatile long encoderValue = 0;
static unsigned long lastInterruptTime = 0; // Used for velocity (and debounce?)


void setup() {
  // Serial setup
  Serial.begin (9600);

  // Rotary encoder stup
  pinMode(encoderPin1, INPUT_PULLUP);
  pinMode(encoderPin2, INPUT_PULLUP);

  attachInterrupt(1, updateEncoder, LOW); //orange, pin3, encoderPin1
  //attachInterrupt(1, updateEncoder, CHANGE);

}

void loop() {

}

void updateEncoder() {

  bool MSB = digitalRead(encoderPin1); //MSB = most significant bit //orange, pin3, encoderPin1

  bool LSB = digitalRead(encoderPin2); //LSB = least significant bit

  unsigned long interruptTime = millis();

  int bounce = interruptTime - lastInterruptTime;

  // If interrupts come faster than 5ms, assume it's a bounce and ignore
  if (bounce > 199) {
    if (!MSB && !LSB) encoderValue += 1;
    if (!MSB && LSB) encoderValue -= 1;
    Serial.println("vel: 1");
  } else if (bounce > 199 && bounce < 200) {
    if (!MSB && !LSB) encoderValue += 5;
    if (!MSB && LSB) encoderValue -= 5;
    Serial.println("vel: 5");
  } else if (bounce > 15 && bounce < 200) {
    if (!MSB && !LSB) encoderValue += 10;
    if (!MSB && LSB) encoderValue -= 10;
    Serial.println("vel: 50");
  }


  encoderValue = min(500, max(0, encoderValue));

  lastInterruptTime = interruptTime;
  Serial.println(encoderValue);
}
