// Vars for RGB_led
int red = 3;
int green = 5;
int blue = 6;
int brightness = 38;
int color_set = 0;

void setup()
{
  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(blue, OUTPUT);

  Serial.begin(9600);
}

void loop()
{


  setColor(color_set, brightness);
  delay(250);
  if (color_set < 5) {
    color_set ++;
  } else if (color_set = 6) {
    color_set = 0;
  }




}

// Color: 0 = red, 1 = yellow, 2 = green, 3 = aqua, 4 = blue, 5 = purple
void setColor(int color, int intens)
{
  switch (color) {
    case 0: //red
      analogWrite(red, 1 * intens);
      analogWrite(green, 0);
      analogWrite(blue, 0);
      break;
    case 1: //yellow
      analogWrite(red, 1 * intens);
      analogWrite(green, (intens / 10));
      analogWrite(blue, 0);
      break;
    case 2: //green
      analogWrite(red, 0);
      analogWrite(green, 1 * (intens / 5));
      analogWrite(blue, 0);
      break;
    case 3: //aqua
      analogWrite(red, 0);
      analogWrite(green, 1 * (intens / 3));
      analogWrite(blue, 1 * (intens / 7));
      break;
    case 4: //blue
      analogWrite(red, 0);
      analogWrite(green, 0);
      analogWrite(blue, 1 * (intens / 2));
      break;
    case 5: //purple
      analogWrite(red, 1 * (intens / 3));
      analogWrite(green, 0);
      analogWrite(blue, 1 * (intens / 3));
      break;
    default:
      // statements
      break;
  }
}
