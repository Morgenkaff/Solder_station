#include <RotaryEncoder.h>

#define ROTARYSTEPS 2
#define ROTARYMIN 0
#define ROTARYMAX 16

//Rotary vars
RotaryEncoder encoder(2, 4);// Setup a RoraryEncoder for pins 2, 4:
int lastPos = -1;// Last known rotary position.

// Analog in test
int analogPin = 17;
int val = 0;

// Toggle part
bool light_on_off = false;
bool set_ready = true;
int toggle_pin = 13;

// Vars for RGB_led

int red = 3;
int green = 5;
int blue = 6;

int light_intens = 0;
byte R_amt = 0;
byte G_amt = 0;
byte B_amt = 0;

void setup() {


  Serial.begin(9600);              //  setup serial
  Serial.print("Set i gang!");

  pinMode(analogPin, INPUT);

  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(blue, OUTPUT);

  pinMode(toggle_pin, INPUT_PULLUP);

}

void loop() {


  val = analogRead(analogPin) / 4;   // read the input pin
  //Serial.println(val/4);             // debug value

  toggle_light();

  if (digitalRead(toggle_pin) == HIGH) {
    if (light_on_off == true) {
      light_intens = 200;
    } else if (light_on_off == LOW) {
      light_intens = 0;
    }

    set_ready = true;
  } else if (digitalRead(toggle_pin) == LOW) {
  }


      analogWrite(red, 115);
      delay(1000);
      analogWrite(green, 50);

  //RGB_write(3, light_intens);
  
}

//byte RGB_write(int color, int intens) {
//  
//switch (color) {
//  case 0:
//      analogWrite(red, 128);
//      analogWrite(green, 0);
//      analogWrite(blue, 0);
//    break;
//  case 1:
//      analogWrite(red, 0);
//      analogWrite(green, 128);
//      analogWrite(blue, 0);
//    break;
//  case 2:
//      analogWrite(red, 0);
//      analogWrite(green, 0);
//      analogWrite(blue, 128);
//    break;
//  case 3:
//      analogWrite(blue, 0);
//    break;
//  default:
//    break;
//}
//
//}
