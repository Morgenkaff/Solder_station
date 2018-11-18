#include <Arduino.h>
#include <U8g2lib.h>
#include <SPI.h>

/*
  U8glib Example Overview:
    Frame Buffer Examples: clearBuffer/sendBuffer. Fast, but may not work with all Arduino boards because of RAM consumption
    Page Buffer Examples: firstPage/nextPage. Less RAM usage, should work with all Arduino boards.
    U8x8 Text Only Example: No RAM usage, direct communication with display controller. No graphics, 8x8 Text only.
    
*/


U8G2_SSD1306_128X64_NONAME_F_4W_SW_SPI u8g2(U8G2_R0, /* clock=*/ 13, /* data=*/ 11, /* cs=*/ 10, /* dc=*/ 9, /* reset=*/ 8);

void setup(void) {
  u8g2.begin();
}

void loop(void) {
  u8g2.clearBuffer();					// clear the internal memory
  u8g2.setFont(u8g2_font_8x13B_mr);	// choose a suitable font
  u8g2.drawUTF8(10,10,"Hello World!");	// write something to the internal memory
  u8g2.drawUTF8(10,50,"Næste linje!"); // write something to the internal memory
  u8g2.sendBuffer();					// transfer internal memory to the display
  delay(1000);  
}
