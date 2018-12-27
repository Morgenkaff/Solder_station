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
int blue_led_pin = 4;
int orag_led_pin = 5;
int blue_sw_pin = 8;
int orag_sw_pin = 7;
int rot_sw_pin = 6;
int mains_sw_pin = 20;
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
int encoderPin1 = 3; // "Activater"
int encoderPin2 = 2; // Direction
// Values:
volatile long encoderValue = 0;
static unsigned long lastInterruptTime = 0; // Used for velocity (and debounce?)
long lastencoderValue = 0;
unsigned long time_temp_sat = 0;

// Vars for chassis control (temp, fan, mains):
// Constructors:
Thread* chassisThread = new Thread();
// Pins:
int chassis_fan_pin = 10;
int mains_relay_pin = 15;
int chassis_temp_pin = 21;
// Values:
int chassis_fan_speed = 2;
int chassis_temp = 0;

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
int airgun_sw_pin = 11;
int airgun_fan_pin = 9;
int airgun_ht_pin = 13;
int airgun_relay_pin = 14; // A0
int airgun_tc_pin = 17;
// Values:
int airgun_set_temp = 0;
int airgun_actual_temp = 0;
int airgun_fan_speed = 0;

// Vars for iron control:
// Constructors:
Thread* ironThread = new Thread();
// Pins:
int iron_ht_pin = 12;
int iron_tc_pin = 16;
// Values:
int iron_on_counter = 0;
bool standby_timer_running = 0;
unsigned long standby_timer_start;
unsigned long standby_timer_stop;
int standby_threshold;
bool iron_in_standby = 0;
int iron_actual_temp = 0;
int iron_set_temp;
bool iron_ht_on = 0;

// Vars for EEPROM
int preset_01_iron_addr = 0;
int preset_01_air_addr = 3;
int preset_02_iron_addr = 5;
int preset_02_air_addr = 7;
byte byte_val;

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
  Serial.begin(115200);
  Serial.println("Setup begin");

  // Setup for threads:
  // Front panel thread (switches)
  frontPanelThread->setInterval(50);       // Interval in ms to run the fronPanelControl
  frontPanelThread->onRun(fronPanelControl);  // Specifying the function to run
  // Chassis thread (fan, temp, mains)
  chassisThread->setInterval(2000);       // Interval in ms to run the chassisControl
  chassisThread->onRun(chassisControl);  // Specifying the function to run
  // Display thread
  displayThread->setInterval(10);       // Interval in ms to run the displayControl
  displayThread->onRun(displayControl);  // Specifying the function to run
  // Iron thread
  ironThread->setInterval(50);       // Interval in ms to run the displayControl
  ironThread->onRun(ironControl);   // Specifying the function to run
  // Airgun thread
  airgunThread->setInterval(500);       // Interval in ms to run the displayControl
  airgunThread->onRun(airgunControl);  // Specifying the function to run

  threadController.add(frontPanelThread);
  threadController.add(chassisThread);
  threadController.add(displayThread);
  //threadController.add(ironThread);
  //threadController.add(airgunThread);

  // Display setup:
  u8x8.begin();
  u8x8.setPowerSave(0);
  blink_timer = 0;

  // Front panel control setup:
  // Leds:
  pinMode(blue_led_pin, OUTPUT);
  pinMode(orag_led_pin, OUTPUT);
  digitalWrite(blue_led_pin, LOW);
  digitalWrite(orag_led_pin, LOW);

  pinMode(orag_sw_pin, INPUT_PULLUP);
  pinMode(blue_sw_pin, INPUT_PULLUP);
  pinMode(rot_sw_pin, INPUT_PULLUP);
  pinMode(airgun_sw_pin, INPUT_PULLUP);

  // Rotary encoder:
  pinMode(encoderPin1, INPUT_PULLUP);
  pinMode(encoderPin2, INPUT_PULLUP);
  attachInterrupt(1, updateEncoder, LOW);

  // Iron setup:
  standby_timer_start = millis(); // Taking the initial time in ms
  standby_timer_stop = 600000; //Timer is set to stop after 1 minute (60000 ms)
  standby_threshold = 500;

  // Airgun setup:
  //pinMode(airgun_fan_pin, OUTPUT);

  // Chassis fan setup
  pinMode(chassis_fan_pin, OUTPUT);
  chassis_fan_init();

  // Loading preset 1 for default values
  // Loading iron temperature
  EEPROM.get(0, iron_set_temp);
  // Loading airgun temperature
  EEPROM.get(2, airgun_set_temp);

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

  int airgun_set = airgun_fan_speed;
  
  analogWrite(airgun_fan_pin, airgun_set);

  //  Serial.print("Blink timer: ");
  //  Serial.println(blink_timer);
  //  Serial.print("Timer toggle: ");
  //  Serial.println(timer_toggle);

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
  Serial.println(chassis_temp);

  chassis_temp = analogRead(chassis_temp_pin);
  if (chassis_temp > 300) {
    /* Do nothing (keeping the default speed set from beginning) */
  } else if ((chassis_temp < 301 && chassis_temp > 250) && (chassis_fan_speed != 50)) {
    chassis_fan_set(50);
  } else if ((chassis_temp < 251 && chassis_temp > 230) && (chassis_fan_speed != 140)) {
    chassis_fan_set(140);
  } else if ((chassis_temp < 231 && chassis_temp > 150) && (chassis_fan_speed != 255)) {
    chassis_fan_set(255);
  } else if (chassis_temp < 150) {
    /* Here it should shut off all heaters and send a warning */
  }

  mains_sw_on = analogRead(A6) > 100 ? 0 : 1;

  // This is not used until airgun is in place and working
  if (mains_sw_on) {
    //digitalWrite(mains_relay_pin, HIGH);
  } else if (!mains_sw_on) {
    //digitalWrite(mains_relay_pin, LOW);
  }

}

// Initializing of the chassis fan.
// "Kicks" it in motion with full speed, then lowers the speed
// (pwm duty cycle) to default speed
void chassis_fan_init() {

  analogWrite(chassis_fan_pin, 255);
  delay(500);
  analogWrite(chassis_fan_pin, chassis_fan_speed);

}
void chassis_fan_set(int speed) {

  chassis_fan_speed = speed;
  analogWrite(chassis_fan_pin, chassis_fan_speed);

}

void ironControl() {

  int iron_temp_read = 1.23 * analogRead(iron_tc_pin) - 183.;
  iron_actual_temp = (iron_temp_read / 5 + (iron_temp_read % 5 > 2)) * 5; // Reads in 5 incrimentals

  if ((millis() > (standby_timer_start + standby_timer_stop))) {
    //Serial.println("Timer has stopped");
    //    Serial.print("iron_on_counter: ");
    //    Serial.println(iron_on_counter);
    if (iron_on_counter < standby_threshold) {
      iron_in_standby = 1;
      digitalWrite(iron_ht_pin, LOW);
      iron_ht_on = 0;
      //      Serial.println("Iron in standby");
    } else if (iron_on_counter > standby_threshold) {
      iron_in_standby = 0;
      iron_on_counter = 0;
      standby_timer_start = millis();
      //      Serial.println("Iron NOT in standby");
    }
  } else if ((millis() < (standby_timer_start + standby_timer_stop))) {
    //    Serial.print(millis());
    //    Serial.print(" out of ");
    //    Serial.println(standby_timer_start + standby_timer_stop);
  }

  if (iron_in_standby) {
    // Do nothing
  } else if (!iron_in_standby) {

    if (iron_set_temp > iron_actual_temp) {
      digitalWrite(iron_ht_pin, HIGH);
      iron_on_counter ++;
      iron_ht_on = 1;
    } else if (iron_set_temp < iron_actual_temp) {
      digitalWrite(iron_ht_pin, LOW);
      iron_ht_on = 0;
    }

    //Serial.print("iron_on_counter: ");
    //Serial.println(iron_on_counter);
  }

}

void airgunControl() {

  int airgun_set = airgun_fan_speed;
  airgun_actual_temp = analogRead(airgun_tc_pin);
  Serial.println(airgun_actual_temp);
  
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

    //    Serial.print("Saved preset as: ");
    //    Serial.print(iron_set_temp);
    //    Serial.print(" and ");
    //    Serial.println(airgun_set_temp);
    blinkLED(nr);

  } else if (!nr) {// Preset 02 (orange)
    // Storing iron temperatures
    EEPROM.put(4, iron_set_temp);
    // Storing airgun temperature
    EEPROM.put(6, airgun_set_temp);

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

    //    Serial.print("Loaded iron as: ");
    //    Serial.print(iron_set_temp);
    //    Serial.print(" and ");
    //    Serial.println(airgun_set_temp);

  } else if (!nr) {// Preset 02 (orange)
    // Loading iron temperatures
    EEPROM.get(4, iron_set_temp);

    // Loading airgun temperatures
    EEPROM.get(6, airgun_set_temp);

    //    Serial.print("Loaded iron as: ");
    //    Serial.print(iron_set_temp);
    //    Serial.print(" and ");
    //    Serial.println(airgun_set_temp);

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

  bool MSB = digitalRead(encoderPin1); //MSB = most significant bit //orange, pin3, encoderPin1

  bool LSB = digitalRead(encoderPin2); //LSB = least significant bit

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
      encoderValue = airgun_fan_speed;
      break;
  }

  // If interrupts come faster than 5ms, assume it's a bounce and ignore
  if (bounce > 199) {
    if (!MSB && !LSB) encoderValue += 5;
    if (!MSB && LSB) encoderValue -= 5;
    Serial.println("vel: 1");
  } else if (bounce > 49 && bounce < 200) {
    if (!MSB && !LSB) encoderValue += 10;
    if (!MSB && LSB) encoderValue -= 10;
    Serial.println("vel: 2");
  } else if (bounce > 10 && bounce < 50) {
    if (!MSB && !LSB) encoderValue += 20;
    if (!MSB && LSB) encoderValue -= 20;
    Serial.println("vel: 3");
  }

  //encoderValue = min(500, max(0, encoderValue));

  time_temp_sat = millis();

  switch (active_val) {
    case 1:
      iron_set_temp = min(500, max(0, encoderValue));
      break;
    case 2:
      airgun_set_temp = min(500, max(0, encoderValue));
      break;
    case 3:
      airgun_fan_speed = min(255, max(0, encoderValue));
      break;
  }

  lastInterruptTime = interruptTime;

}

void displayControl() {

  switch (active_val) {
    case 1:
      if (iron_ht_on) {
        u8x8.drawString(1, 1, "^");
      } else if (!iron_ht_on) {
        u8x8.drawString(1, 1, "-");
      }
      u8x8.drawString(1, 3, " ");
      u8x8.drawString(1, 5, " ");
      break;
    case 2:
      u8x8.drawString(1, 1, " ");
      u8x8.drawString(1, 3, "-");
      u8x8.drawString(1, 5, " ");
      break;
    case 3:
      u8x8.drawString(1, 1, " ");
      u8x8.drawString(1, 3, " ");
      u8x8.drawString(1, 5, "-");
      break;
  }

  if (blink_timer >= 40) {
    timer_toggle = !timer_toggle;
    blink_timer = 0;
  }

  // Setting the font to use
  u8x8.setFont(u8x8_font_pcsenior_u);

  // Drawing the iron part
  u8x8.drawString(2, 1, "IRON: ");

  // "Blinking" the temp if iron in standby
  if (timer_toggle && iron_in_standby) {
    u8x8.drawString(11, 1, "   ");
  } else {
  if (active_val != 1) {
      u8x8.drawString(10, 1, " ");
      sprintf(tmp_char, "%03d", iron_actual_temp);
      u8x8.drawString(11, 1, tmp_char);
  } else if ((millis() < (time_temp_sat + 2000)) && (active_val==1)) {
      u8x8.drawString(10, 1, "*");
      sprintf(tmp_char, "%03d", iron_set_temp);
      u8x8.drawString(11, 1, tmp_char);
    } else if ((millis() >= (time_temp_sat + 2000))) {
      u8x8.drawString(10, 1, " ");
      sprintf(tmp_char, "%03d", iron_actual_temp);
      u8x8.drawString(11, 1, tmp_char);
    }
  }
  //u8x8.drawString(13, 2, "\n");

  // Drawing the airgun part:
  // Airgun temp:
  u8x8.drawString(2, 3, "AIRGUN: ");

  // If the temp have been sat in the last 2 seconds (2000 ms) show set_temp
  // (and star '*'), else show actual_temp.
  if (active_val!=2) {
    u8x8.drawString(10, 3, " ");
    sprintf(tmp_char, "%03d", airgun_actual_temp);
    u8x8.drawString(11, 3, tmp_char);
  } else if (((millis() < (time_temp_sat + 2000))) && (active_val==2)) {
    u8x8.drawString(10, 3, "*");
    sprintf(tmp_char, "%03d", airgun_set_temp);
    u8x8.drawString(11, 3, tmp_char);
  } else if ((millis() >= (time_temp_sat + 2000))) {
    u8x8.drawString(10, 3, " ");
    sprintf(tmp_char, "%03d", airgun_actual_temp);
    u8x8.drawString(11, 3, tmp_char);
  }
  // Airgun air speed:
  u8x8.drawString(2, 5, "AIR SP: ");

  // If the temp have been sat in the last 2 seconds (2000 ms) show set_temp
  // (and star '*'), else show actual_temp.
  if (active_val!=3) {
    u8x8.drawString(10, 5, " ");
    sprintf(tmp_char, "%03d", airgun_fan_speed);
    u8x8.drawString(11, 5, tmp_char);
  } else if (active_val==3) {
    u8x8.drawString(10, 5, "*");
    sprintf(tmp_char, "%03d", airgun_fan_speed);
    u8x8.drawString(11, 5, tmp_char);
  }
  //u8x8.drawString(13,4," \n");

  blink_timer++;

}
