#include <Thread.h> // for threading
#include <ThreadController.h>
#include <EEPROM.h> // EEPROM
#include <U8x8lib.h>


/* ------ TEMPORARY VARS AND STUFF --- START ------ */
String serialStr; // String used for feedback over serial
/* ------ TEMPORARY VARS AND STUFF --- STOP ------ */

// Thread controller:
ThreadController threadController = ThreadController();

// Vars for front panel controls (exept displ.)
// Constructors:
Thread* frontPanelThread = new Thread();
// Pins:
int blue_led_pin = 12;
int orag_led_pin = 11;
int blue_sw_pin = 15;
int orag_sw_pin = 16;
int rot_sw_pin = 4;
int mains_sw_pin = 13;
// Values:
bool mains_sw_on = 0;
byte switchState = 0;
bool buttonCoolDown = 0;
long buttonPressedTime = 0;
long currentTime = 0;
long buttonReleaseTime = 0;
bool shortPress = 0;
bool longPress = 0;
bool buttonPressed = 0;
bool activePreset = 1; //True is blue, used as default

// Rotary encoder (excls. switch)
// Pins:
int encoderPin1 = 2; // "Activater"
int encoderPin2 = 3; // Direction
// Values:
volatile long encoderValue = 0;
static unsigned long lastInterruptTime = 0; // Used for velocity (and debounce?)
long lastencoderValue = 0;
unsigned long time_temp_sat = 0;

// Vars for chassis control (temp, fan, mains):
// Constructors:
Thread* chassisThread = new Thread();
// Pins:
int chassis_fan_pin = 9;
int mains_relay_pin = 7;
int chassis_temp_pin = 14;
// Values:
int chassis_fan_speed = 2;
int chassis_temp = 0;
bool mains_realy_on = 0;

// Vars for display
// Constructors:
Thread* displayThread = new Thread();
// Pins:
U8X8_SH1106_128X64_NONAME_HW_I2C u8x8(U8X8_PIN_NONE); //Using HW I2C pins (18 (A4) - SDA, 19 (A5) - SCL)
// Values:
char tmp_char[4];
byte active_val = 1;
int blink_timer;
bool timer_toggle = 0;

// Vars for airgun control:
// Constructors:
Thread* airgunThread = new Thread();
// Pins:
int airgun_sw_pin = 17;
int airgun_fan_pin = 10;
int airgun_ht_pin = 5;
int airgun_relay_pin = 6;
int airgun_tc_pin = 21;
// Values:
int airgun_set_temp = 0;
int airgun_read_temp = 0;
int airgun_used_temp = 0;

int airgun_fan_speed = 0;
int airgun_fan_set_speed = 25;
bool airgun_fan_running = 0;

bool airgun_relay_on = 0;
bool airgun_ht_on = 0;

// Vars for iron control:
// Constructors:
Thread* ironThread = new Thread();
// Pins:
int iron_ht_pin = 8;
int iron_tc_pin = 20;
// Values:
int iron_on_counter = 0;
bool standby_timer_running = 0;
unsigned long standby_timer_start;
unsigned long standby_timer_stop;
int standby_threshold;
bool iron_in_standby = 0;
int iron_read_temp = 0;
int iron_cal_temp = 0;
int iron_used_temp = 0;
int iron_last_temp = 0;
int iron_set_temp;
bool iron_ht_on = 0;

// Declarations of functions:
void fronPanelControl();
void chassisControl();


///////////////////////////////////////////////////////
//                                                   //
//       #####  ####### ####### #     # ######       //
//      #     # #          #    #     # #     #      //
//      #       #          #    #     # #     #      //
//       #####  #####      #    #     # ######       //
//            # #          #    #     # #            //
//      #     # #          #    #     # #            //
//       #####  #######    #     #####  #            //
//                                                   //
///////////////////////////////////////////////////////

// the setup routine runs once when you press reset:
void setup() {
  // Setup for serial comm. and misc. feedback
  Serial.begin(57600);
  Serial.println("Setup begin");

  // Setup for threads:
  // Front panel thread (switches)
  frontPanelThread->setInterval(50);       // Interval in ms to run the fronPanelControl
  frontPanelThread->onRun(fronPanelControl);  // Specifying the function to run
  // Chassis thread (fan, temp, mains)
  chassisThread->setInterval(2000);       // Interval in ms to run thet chassisControl
  chassisThread->onRun(chassisControl);  // Specifying the function to run
  // Display thread
  displayThread->setInterval(10);       // Interval in ms to run the displayControl
  displayThread->onRun(displayControl);  // Specifying the function to run
  // Iron thread
  ironThread->setInterval(100);       // Interval in ms to run the ironControl
  ironThread->onRun(ironControl);   // Specifying the function to run
  // Airgun thread
  airgunThread->setInterval(1000);       // Interval in ms to run the airgunControl
  airgunThread->onRun(airgunControl);  // Specifying the function to run

  threadController.add(frontPanelThread);
  threadController.add(chassisThread);
  threadController.add(displayThread);
  threadController.add(ironThread);
  threadController.add(airgunThread);

  // Display setup:
  u8x8.begin();
  //u8x8.setPowerSave(0);
  blink_timer = 0;

  // Front panel control setup:
  // Leds:
  pinMode(blue_led_pin, OUTPUT);
  pinMode(orag_led_pin, OUTPUT);
  digitalWrite(blue_led_pin, LOW);
  digitalWrite(orag_led_pin, LOW);

  // Switches:
  pinMode(orag_sw_pin, INPUT_PULLUP);
  pinMode(blue_sw_pin, INPUT_PULLUP);
  pinMode(rot_sw_pin, INPUT_PULLUP);
  pinMode(mains_sw_pin, INPUT_PULLUP);

  // Rotary encoder:
  pinMode(encoderPin1, INPUT_PULLUP);
  pinMode(encoderPin2, INPUT_PULLUP);
  attachInterrupt(1, updateEncoder, LOW);

  // Iron setup:
  standby_timer_start = millis(); // Taking the initial time in ms
  standby_timer_stop = 600000; //Timer is set to stop after 1 minute (60000 ms)
  standby_threshold = 500;

  // Airgun setup:
  pinMode(airgun_fan_pin, OUTPUT);
  pinMode(airgun_sw_pin, INPUT_PULLUP);

  // Chassis fan setup
  pinMode(chassis_fan_pin, OUTPUT);
  chassis_fan_init();

  // Loading preset 1 for default values
  // Loading iron temperature
  EEPROM.get(0, iron_set_temp);
  // Loading airgun temperature
  EEPROM.get(2, airgun_set_temp);
  // Loading airgun fan speed
  EEPROM.get(4, airgun_fan_speed);

  // Sends feedback for completed setup
  Serial.println("Setup complete");
}


///////////////////////////////////////////////
//                                           //
//      #       ####### ####### ######       //
//      #       #     # #     # #     #      //
//      #       #     # #     # #     #      //
//      #       #     # #     # ######       //
//      #       #     # #     # #            //
//      #       #     # #     # #            //
//      ####### ####### ####### #            //
//                                           //
///////////////////////////////////////////////

// the loop routine runs over and over again forever:
void loop() {

  // Run threads:
  threadController.run();

}


///////////////////////////////////////////////////////////////////////////////////
//                                                                               //
//      ####### #     # #     #  #####  ####### ### ####### #     #  #####       //
//      #       #     # ##    # #     #    #     #  #     # ##    # #     #      //
//      #       #     # # #   # #          #     #  #     # # #   # #            //
//      #####   #     # #  #  # #          #     #  #     # #  #  #  #####       //
//      #       #     # #   # # #          #     #  #     # #   # #       #      //
//      #       #     # #    ## #     #    #     #  #     # #    ## #     #      //
//      #        #####  #     #  #####     #    ### ####### #     #  #####       //
//                                                                               //
///////////////////////////////////////////////////////////////////////////////////

// Chassis control
// Check temperature and adjust fan accordingly
void chassisControl() {

  chassis_temp = analogRead(chassis_temp_pin);
  Serial.print("Chassis temp: ");
  Serial.println(chassis_temp);
  if (chassis_temp > 300) {
    chassis_fan_set(10);
  } else if ((chassis_temp < 301 && chassis_temp > 250) && (chassis_fan_speed != 75)) {
    chassis_fan_set(75);
  } else if ((chassis_temp < 251 && chassis_temp > 230) && (chassis_fan_speed != 140)) {
    chassis_fan_set(140);
  } else if ((chassis_temp < 231 && chassis_temp > 150) && (chassis_fan_speed != 255)) {
    chassis_fan_set(255);
  } else if (chassis_temp < 150) {
    /* Here it should shut off all heaters and send a warning */
  }

  // This is not used until airgun is in place and working

  mains_sw_on = !digitalRead(mains_sw_pin);
  Serial.print("Mains switch: ");
  Serial.println(mains_sw_on);
 
  if (mains_sw_on) {
    digitalWrite(mains_relay_pin, HIGH);
  } else if (!mains_sw_on) {
    digitalWrite(mains_relay_pin, LOW);
  }

}

// Initializing of the chassis fan.
// "Kicks" it in motion with full speed, then lowers the speed
// (pwm duty cycle) to default speed
void chassis_fan_init() {

  analogWrite(chassis_fan_pin, 255);
  delay(100);
  analogWrite(chassis_fan_pin, chassis_fan_speed);

}
void chassis_fan_set(int speed) {

  chassis_fan_speed = speed;
  analogWrite(chassis_fan_pin, chassis_fan_speed);

}

void ironControl() {

  iron_read_temp = analogRead(iron_tc_pin);
//  Serial.print("Iron read temp: ");
//  Serial.println(iron_read_temp);

  iron_cal_temp = 4.2 * iron_read_temp + 70.5;
  
//  Serial.println("iron_last_temp: ");
//  Serial.println(iron_last_temp);
//  Serial.println("iron_bounce_temp: ");
//  Serial.println(iron_bounce_temp);
  
  // Used to "debounce" some extreme readouts
  if ((iron_cal_temp - iron_last_temp) < 10){
    //Serial.println("change iron temp");
    iron_used_temp = iron_cal_temp;
  }

  // Standby functionality
  if ((millis() > (standby_timer_start + standby_timer_stop))) {
    //Serial.println("Timer has stopped");
    //    Serial.print("iron_on_counter: ");
    //    Serial.println(iron_on_counter);
    if (iron_on_counter < standby_threshold) {
      iron_in_standby = 1;
      digitalWrite(iron_ht_pin, LOW);
      iron_ht_on = 0;
      //Serial.println("Iron in standby");
    } else if (iron_on_counter > standby_threshold) {
      iron_in_standby = 0;
      iron_on_counter = 0;
      standby_timer_start = millis();
      //Serial.println("Iron NOT in standby");
    }
  } else if ((millis() < (standby_timer_start + standby_timer_stop))) {
    //    Serial.print(millis());
    //    Serial.print(" out of ");
    //    Serial.println(standby_timer_start + standby_timer_stop);
  }

  // Heater functionality 
  if (iron_in_standby) {
    // Do nothing
  } else if (!iron_in_standby) {

    if (iron_set_temp > (iron_used_temp)) {
      digitalWrite(iron_ht_pin, HIGH);
      //Serial.println("Iron HEATING");
      iron_on_counter ++;
      iron_ht_on = 1;
    } else if (iron_set_temp < iron_used_temp) {
      digitalWrite(iron_ht_pin, LOW);
      iron_ht_on = 0;
    }
  }

  iron_last_temp = iron_cal_temp;

}

void airgunFanInit(){
  
  analogWrite(airgun_fan_pin, 5);
  delay(100);
  analogWrite(airgun_fan_pin, airgun_fan_speed);
  
}

void airgunControl() {

  // Airgun temp:
  airgun_read_temp = analogRead(airgun_tc_pin);
  //Serial.println(airgun_actual_temp);
  airgun_used_temp = airgun_read_temp;

  // Airgun fan:
//  Serial.print("Fan sat speed: ");
//  Serial.println(airgun_fan_set_speed);
//  Serial.print("Fan calc speed: ");
//  Serial.println(airgun_fan_speed);

  if(airgun_fan_speed>0){
    if(airgun_fan_running){
      analogWrite(airgun_fan_pin, airgun_fan_speed);
    }
    else if(!airgun_fan_running){
      airgunFanInit();
      analogWrite(airgun_fan_pin, airgun_fan_speed);
      airgun_fan_running = 1;
    }
  } else if(airgun_fan_speed == 0){
    analogWrite(airgun_fan_pin, airgun_fan_speed);
    airgun_fan_running = 0;
  }

  //Airgun relay:

  // Checks if the airgun is attached (the thermocouple is read correctly): 
  if (airgun_read_temp < 700){
    Serial.print("Airgun relay: ");
    Serial.println(airgun_relay_on);
    airgun_relay_on = 1;
  } else {
    airgun_relay_on = 0;
    Serial.print("Airgun relay: ");
    Serial.println(airgun_relay_on);
  }

  //digitalWrite(airgun_relay_pin, airgun_relay_on);

  //Airgun heater:
  
  if (airgun_set_temp > (airgun_used_temp)) {
      Serial.println("Airgun heater: ON");
      //digitalWrite(airgun_ht_pin, HIGH);
      airgun_ht_on = 1;
    } else if (airgun_set_temp < airgun_used_temp) {
      Serial.println("Airgun heater: OFF");
      //digitalWrite(airgun_ht_pin, LOW);
      airgun_ht_on = 0;
    }
  
  
}

void standbyReset() {
  iron_on_counter = 0;
  standby_timer_start = millis();
  iron_in_standby = 0;
}

// Front panel control (switches)
void fronPanelControl() {

  if ((scanSwitches() > 0) && iron_in_standby) {
    buttonCoolDown = 1;
    standbyReset();
  }

  if ((scanSwitches() > 0) && !buttonCoolDown) {


    int longPressThresh = 1000;

    switchState = scanSwitches();

    buttonPressedTime = millis();

    while (scanSwitches() > 0) {

      currentTime = millis();

      if (currentTime - buttonPressedTime <= longPressThresh) {
        //Serial.println("short press");
      } else if (currentTime - buttonPressedTime > longPressThresh) {
        if (switchState < 10) {
          switchState += 10;
        }
        //Serial.println("long press");
        buttonCoolDown = 1;
        break;
      } else {
        // Do nothing
      }

    }

    switch (switchState) {
      case 1:
        activePreset = 1; //Preset 1
        loadPreset(activePreset);
        break;
      case 2:
        activePreset = 0; //Preset 2
        loadPreset(activePreset);
        break;
      case 3:
        if (active_val == 1) {
          active_val = 2;
        } else if (active_val == 2) {
          active_val = 3;
        } else if (active_val == 3) {
          active_val = 1;
        }
        
        break;
      case 11:
        savePreset(1);
        break;
      case 12:
        savePreset(0);
        break;
      case 13:
        Serial.println("Wait, what!?");
        break;
      default:
        break;
    }
  } else if (buttonCoolDown) {
    if ((scanSwitches() > 0)) {
      // Wait for release (scanSwitches() == 0)
    } else if (scanSwitches() == 0) {
      buttonCoolDown = 0;
    }
  }
  if (activePreset) {
    digitalWrite(blue_led_pin, HIGH);
    digitalWrite(orag_led_pin, LOW);
  } else if (!activePreset) {
    digitalWrite(blue_led_pin, LOW);
    digitalWrite(orag_led_pin, HIGH);
  }
  switchState = scanSwitches();

}

// Returns true if one of the UI buttons (blue, orag or rot) is pressed
byte scanSwitches() {

  if (!digitalRead(blue_sw_pin)) {
    return 1;
  }
  if (!digitalRead(orag_sw_pin)) {
    return 2;
  }
  if (!digitalRead(rot_sw_pin)) {
    return 3;
  }
  if ((digitalRead(blue_sw_pin) || digitalRead(orag_sw_pin) || digitalRead(rot_sw_pin))) {
    return 0;
  }

}

void savePreset(bool nr) {

  if (nr) { // Preset 01 (blue)
    // Storing iron temperature
    EEPROM.put(0, iron_set_temp);

    // Storing airgun temperature
    EEPROM.put(2, airgun_set_temp);

    // Storing airgun fan speed
    EEPROM.put(4, airgun_fan_speed);

    //    Serial.print("Saved preset as: ");
    //    Serial.print(iron_set_temp);
    //    Serial.print(" and ");
    //    Serial.println(airgun_set_temp);
    blinkLED(nr);

  } else if (!nr) {// Preset 02 (orange)
    // Storing iron temperatures
    EEPROM.put(6, iron_set_temp);
    // Storing airgun temperature
    EEPROM.put(8, airgun_set_temp);
    // Storing airgun fan speed
    EEPROM.put(10, airgun_fan_speed);

    //    Serial.print("Saved airgun as: ");
    //    Serial.print(iron_set_temp);
    //    Serial.print(" and ");
    //    Serial.println(airgun_set_temp);
    blinkLED(nr);

  }

}

void loadPreset(bool nr) {

  if (nr) { // Preset 01 (blue)
    // Loading iron temperatures
    EEPROM.get(0, iron_set_temp);

    // Loading airgun temperatures
    EEPROM.get(2, airgun_set_temp);
    
    // Loading airgun temperatures
    EEPROM.get(4, airgun_fan_speed);

  } else if (!nr) {// Preset 02 (orange)
    // Loading iron temperatures
    EEPROM.get(6, iron_set_temp);

    // Loading airgun temperatures
    EEPROM.get(8, airgun_set_temp);
    
    // Loading airgun temperatures
    EEPROM.get(10, airgun_fan_speed);
  }

}

void blinkLED(bool nr) {

  if (nr) {
    digitalWrite(blue_led_pin, LOW);
    delay(100);
    digitalWrite(blue_led_pin, HIGH);
    delay(100);
    digitalWrite(blue_led_pin, LOW);
    delay(100);
    digitalWrite(blue_led_pin, HIGH);
    delay(100);
    digitalWrite(blue_led_pin, LOW);
  } else if (!nr) {
    digitalWrite(orag_led_pin, LOW);
    delay(100);
    digitalWrite(orag_led_pin, HIGH);
    delay(100);
    digitalWrite(orag_led_pin, LOW);
    delay(100);
    digitalWrite(orag_led_pin, HIGH);
    delay(100);
    digitalWrite(orag_led_pin, LOW);
  }

}

void updateEncoder() {

  standbyReset();

  bool MSB = digitalRead(encoderPin2); //MSB = most significant bit //orange, pin3, encoderPin1

  bool LSB = digitalRead(encoderPin1); //LSB = least significant bit

  unsigned long interruptTime = millis();

  int bounce = interruptTime - lastInterruptTime;

  switch (active_val) {
    case 1:
      encoderValue = iron_set_temp;
      break;
    case 2:
      encoderValue = airgun_set_temp;
      break;
    case 3:
      encoderValue = airgun_fan_set_speed;
      break;
  }

  // If interrupts come faster than 10ms, assume it's a bounce and ignore
  if (bounce > 149) {
    if (!MSB && !LSB) encoderValue -= 5;
    if (!MSB && LSB) encoderValue += 5;
    //Serial.println("vel: 1");
  } else if (bounce > 49 && bounce < 150) {
    if (!MSB && !LSB) encoderValue -= 10;
    if (!MSB && LSB) encoderValue += 10;
    //Serial.println("vel: 2");
  } else if (bounce > 10 && bounce < 50) {
    if (!MSB && !LSB) encoderValue -= 20;
    if (!MSB && LSB) encoderValue += 20;
    //Serial.println("vel: 3");
  }

  time_temp_sat = millis();

  switch (active_val) {
    case 1:
      iron_set_temp = min(500, max(50, encoderValue));
      break;
    case 2:
      airgun_set_temp = min(500, max(0, encoderValue));
      break;
    case 3:
      airgun_fan_set_speed = (min(250, max(0, (encoderValue))));
      airgun_fan_speed = airgun_fan_set_speed/25;
      break;
  }

  lastInterruptTime = interruptTime;

}

void displayControl() {

  // Setting the font to use
  u8x8.setFont(u8x8_font_pcsenior_u);

  switch (active_val) {
    case 1:
      if (iron_ht_on) {
        u8x8.drawString(1, 2, "^");
      } else if (!iron_ht_on) {
        u8x8.drawString(1, 2, "-");
      }
      u8x8.drawString(1, 4, " ");
      u8x8.drawString(1, 6, " ");
      
      break;
    case 2:
      u8x8.drawString(1, 2, " ");
      if (airgun_ht_on) {
        u8x8.drawString(1, 4, "^");
      } else if (!airgun_ht_on) {
        u8x8.drawString(1, 4, "-");
      }
      u8x8.drawString(1, 6, " ");
      break;
    case 3:
      u8x8.drawString(1, 2, " ");
      u8x8.drawString(1, 4, " ");
      u8x8.drawString(1, 6, "-");
      break;
  }

  if (blink_timer >= 40) {
    timer_toggle = !timer_toggle;
    blink_timer = 0;
  }

  // Drawing the iron part
  u8x8.drawString(2, 2, "IRON: ");

  // "Blinking" the temp if iron in standby
  if (timer_toggle && iron_in_standby) {
    u8x8.drawString(11, 2, "   ");
  } else {
  if (active_val != 1) {
      u8x8.drawString(10, 2, " ");
      sprintf(tmp_char, "%03d", iron_used_temp);
      u8x8.drawString(11, 2, tmp_char);
  } else if ((millis() < (time_temp_sat + 2000)) && (active_val==1)) {
      u8x8.drawString(10, 2, "*");
      sprintf(tmp_char, "%03d", iron_set_temp);
      u8x8.drawString(11, 2, tmp_char);
    } else if ((millis() >= (time_temp_sat + 2000))) {
      u8x8.drawString(10, 2, " ");
      sprintf(tmp_char, "%03d", iron_used_temp);
      u8x8.drawString(11, 2, tmp_char);
    }
  }

  // Drawing the airgun part:
  // Airgun temp:
  u8x8.drawString(2, 4, "AIRGUN: ");

  // If the temp have been sat in the last 2 seconds (2000 ms) show set_temp
  // (and star '*'), else show actual_temp.
  if (active_val!=2) {
    u8x8.drawString(10, 4, " ");
    sprintf(tmp_char, "%03d", airgun_used_temp);
    u8x8.drawString(11, 4, tmp_char);
  } else if (((millis() < (time_temp_sat + 2000))) && (active_val==2)) {
    u8x8.drawString(10, 4, "*");
    sprintf(tmp_char, "%03d", airgun_set_temp);
    u8x8.drawString(11, 4, tmp_char);
  } else if ((millis() >= (time_temp_sat + 2000))) {
    u8x8.drawString(10, 4, " ");
    sprintf(tmp_char, "%03d", airgun_used_temp);
    u8x8.drawString(11, 4, tmp_char);
  }
  // Airgun air speed:
  u8x8.drawString(2, 6, "AIR SP: ");

  // If the temp have been sat in the last 2 seconds (2000 ms) show set_temp
  // (and star '*'), else show actual_temp.
  if (active_val!=3) {
    u8x8.drawString(10, 6, " ");
    sprintf(tmp_char, "%03d", airgun_fan_speed);
    u8x8.drawString(11, 6, tmp_char);
  } else if (((millis() < (time_temp_sat + 2000))) && (active_val==3)) {
    u8x8.drawString(10, 6, "*");
    sprintf(tmp_char, "%03d", airgun_fan_speed);
    u8x8.drawString(11, 6, tmp_char);
  } else if ((millis() >= (time_temp_sat + 2000))) {
    u8x8.drawString(10, 6, " ");
    sprintf(tmp_char, "%03d", airgun_fan_speed);
    u8x8.drawString(11, 6, tmp_char);
  }

  blink_timer++;

}
