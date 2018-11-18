

//#include <U8g2lib.h>
#include <U8x8lib.h>
#include <SPI.h>
#include <EEPROM.h>

// Rotary (and rotary-switch) vars
//these pins can not be changed 2/3 are special pins
int encoderPin1 = 3; // "Activater"
int encoderPin2 = 2; // Direction
const uint8_t encoder_switch = A1;
volatile long encoderValue = 0;
static unsigned long lastInterruptTime = 0; // Used for velocity (and debounce?)

// UX vars
unsigned int stored_temp;



// Constructor for display
//U8G2_SSD1306_128X64_NONAME_F_4W_SW_SPI u8g2(U8G2_R0, /* clock=*/ 13, /* data=*/ 11, /* cs=*/ 10, /* dc=*/ 9, /* reset=*/ 8);
U8X8_SSD1306_128X64_NONAME_4W_SW_SPI u8x8(/* clock=*/ 12, /* data=*/ 11, /* cs=*/ 10, /* dc=*/ 9, /* reset=*/ 8); //clock er skiftet fra 13 til 12


void setup() {
  // Serial setup
  Serial.begin (9600);

  byte a = EEPROM.read(0);
  byte b = EEPROM.read(1);

  encoderValue = a * 256 + b;

  String tmp = "Read ";
  tmp += encoderValue;
  Serial.println(tmp);

  // u8x8 setup (display)
  u8x8.begin();
  u8x8.setPowerSave(0);

  // Rotary encoder stup
  pinMode(encoderPin1, INPUT_PULLUP);
  pinMode(encoderPin2, INPUT_PULLUP);
  pinMode(encoder_switch, INPUT_PULLUP);

  attachInterrupt(1, updateEncoder, LOW); //orange, pin3, encoderPin1
  //attachInterrupt(1, updateEncoder, CHANGE);

  // LED setup
  //pinMode(A7, OUTPUT);



}

void loop() {

  // Display logic
  u8x8.setFont(u8x8_font_torussansbold8_r);
  u8x8.draw1x2String(0, 0, "Iron:");
  // only required for SSD1606/7
  char charBuf[3];
  if (encoderValue < 10) {
    sprintf(charBuf, "%03d", encoderValue);
    u8x8.refreshDisplay();
  } else if (encoderValue > 9 && encoderValue < 100) {
    sprintf(charBuf, "%03d", encoderValue);
    u8x8.refreshDisplay();
  } else if (encoderValue > 99) {
    sprintf(charBuf, "%03d", encoderValue);
    u8x8.refreshDisplay();
  }

  u8x8.draw2x2String(0, 3, charBuf);
  //Serial.println(charBuf);
  //delay(500);

  if (!(digitalRead(encoder_switch))) {
    delay(1000);
    if (!(digitalRead(encoder_switch))) {

      byte a = encoderValue / 256;
      byte b = encoderValue % 256;

      EEPROM.write(0, a);
      EEPROM.write(1, b);

      String tmp = "Wrote ";
      tmp += encoderValue;
      Serial.println(tmp);

      a = EEPROM.read(0);
      b = EEPROM.read(1);

      encoderValue = a * 256 + b;

      tmp = "Read ";
      tmp += encoderValue;
      Serial.println(tmp);
    };
    u8x8.clearLine(3);
    u8x8.clearLine(4);
    delay(100);
    u8x8.draw2x2String(0, 3, charBuf);
    delay(100);
    u8x8.clearLine(3);
    u8x8.clearLine(4);
    delay(100);
    u8x8.draw2x2String(0, 3, charBuf);
    delay(100);
    u8x8.clearLine(3);
    u8x8.clearLine(4);
    delay(100);
    u8x8.draw2x2String(0, 3, charBuf);
    delay(100);
  };



}

void updateEncoder() {

  bool MSB = digitalRead(encoderPin1); //MSB = most significant bit //orange, pin3, encoderPin1

  bool LSB = digitalRead(encoderPin2); //LSB = least significant bit

  unsigned long interruptTime = millis();

  Serial.println(interruptTime - lastInterruptTime);
  int bounce = interruptTime - lastInterruptTime;

  // If interrupts come faster than 5ms, assume it's a bounce and ignore
  if (bounce > 199) {
    if (!MSB && !LSB) encoderValue += 5;
    if (!MSB && LSB) encoderValue -= 5;
    Serial.println("vel: 1");
  } else if (bounce > 99 && bounce < 200) {
    if (!MSB && !LSB) encoderValue += 10;
    if (!MSB && LSB) encoderValue -= 10;
    Serial.println("vel: 5");
  } else if (bounce > 10 && bounce < 100) {
    if (!MSB && !LSB) encoderValue += 50;
    if (!MSB && LSB) encoderValue -= 50;
    Serial.println("vel: 50");
  }


  encoderValue = min(500, max(0, encoderValue));

  lastInterruptTime = interruptTime;
}
