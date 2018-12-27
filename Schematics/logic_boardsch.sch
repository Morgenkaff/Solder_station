EESchema Schematic File Version 4
LIBS:Solder station-cache
LIBS:Power board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title "Logic board"
Date "2018-12-27"
Rev "0,8"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v2.x A?
U 1 1 5C288449
P 5800 3000
AR Path="/5C273FF1/5C274725/5C288449" Ref="A?"  Part="1" 
AR Path="/5C287C9A/5C288449" Ref="A?"  Part="1" 
F 0 "A?" H 5800 3000 50  0000 C CNN
F 1 "Arduino" H 5800 2850 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5950 2050 50  0001 L CNN
F 3 "https://www.arduino.cc/en/uploads/Main/ArduinoNanoManual23.pdf" H 5800 2000 50  0001 C CNN
	1    5800 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:Rotary_Encoder_Switch SW?
U 1 1 5C288450
P 2150 1700
AR Path="/5C273FF1/5C274725/5C288450" Ref="SW?"  Part="1" 
AR Path="/5C287C9A/5C288450" Ref="SW?"  Part="1" 
F 0 "SW?" H 2150 2067 50  0000 C CNN
F 1 "Rotary_Switch" H 2150 1976 50  0000 C CNN
F 2 "" H 2000 1860 50  0001 C CNN
F 3 "~" H 2150 1960 50  0001 C CNN
	1    2150 1700
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_LED SW_blue?
U 1 1 5C288457
P 3200 4600
AR Path="/5C273FF1/5C274725/5C288457" Ref="SW_blue?"  Part="1" 
AR Path="/5C287C9A/5C288457" Ref="SW_blue?"  Part="1" 
F 0 "SW_blue?" H 3200 4985 50  0000 C CNN
F 1 "blue_sw" H 3200 4894 50  0000 C CNN
F 2 "" H 3200 4900 50  0001 C CNN
F 3 "" H 3200 4900 50  0001 C CNN
	1    3200 4600
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_LED SW_orag?
U 1 1 5C28845E
P 3200 5400
AR Path="/5C273FF1/5C274725/5C28845E" Ref="SW_orag?"  Part="1" 
AR Path="/5C287C9A/5C28845E" Ref="SW_orag?"  Part="1" 
F 0 "SW_orag?" H 3200 5785 50  0000 C CNN
F 1 "orag_sw" H 3200 5694 50  0000 C CNN
F 2 "" H 3200 5700 50  0001 C CNN
F 3 "" H 3200 5700 50  0001 C CNN
	1    3200 5400
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5C288465
P 2850 1600
AR Path="/5C273FF1/5C274725/5C288465" Ref="R?"  Part="1" 
AR Path="/5C287C9A/5C288465" Ref="R?"  Part="1" 
F 0 "R?" V 2643 1600 50  0000 C CNN
F 1 "1k" V 2734 1600 50  0000 C CNN
F 2 "" V 2780 1600 50  0001 C CNN
F 3 "~" H 2850 1600 50  0001 C CNN
	1    2850 1600
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5C28846C
P 2850 1800
AR Path="/5C273FF1/5C274725/5C28846C" Ref="R?"  Part="1" 
AR Path="/5C287C9A/5C28846C" Ref="R?"  Part="1" 
F 0 "R?" V 2950 1800 50  0000 C CNN
F 1 "1k" V 3050 1800 50  0000 C CNN
F 2 "" V 2780 1800 50  0001 C CNN
F 3 "~" H 2850 1800 50  0001 C CNN
	1    2850 1800
	0    -1   1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5C288473
P 3700 2100
AR Path="/5C273FF1/5C274725/5C288473" Ref="C?"  Part="1" 
AR Path="/5C287C9A/5C288473" Ref="C?"  Part="1" 
F 0 "C?" H 3450 2150 50  0000 L CNN
F 1 "0,1uF" H 3350 2050 50  0000 L CNN
F 2 "" H 3738 1950 50  0001 C CNN
F 3 "~" H 3700 2100 50  0001 C CNN
	1    3700 2100
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5C28847A
P 3200 2100
AR Path="/5C273FF1/5C274725/5C28847A" Ref="C?"  Part="1" 
AR Path="/5C287C9A/5C28847A" Ref="C?"  Part="1" 
F 0 "C?" H 2950 2150 50  0000 L CNN
F 1 "0,1uF" H 2850 2050 50  0000 L CNN
F 2 "" H 3238 1950 50  0001 C CNN
F 3 "~" H 3200 2100 50  0001 C CNN
	1    3200 2100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3700 2400 3700 2250
Wire Wire Line
	3200 2250 3200 2400
Wire Wire Line
	3200 1950 3200 1800
Wire Wire Line
	3000 1600 3700 1600
Wire Wire Line
	3700 1600 3700 1950
Wire Wire Line
	2700 1600 2450 1600
Wire Wire Line
	2700 1800 2450 1800
$Comp
L DIV_custom:AD_tmp_sens U?
U 1 1 5C28848A
P 10350 2150
AR Path="/5C273FF1/5C274725/5C28848A" Ref="U?"  Part="1" 
AR Path="/5C287C9A/5C28848A" Ref="U?"  Part="1" 
F 0 "U?" V 10500 2400 60  0000 R CNN
F 1 "Chassis_temp" V 10650 2500 60  0000 R CNN
F 2 "" H 10500 2200 60  0001 C CNN
F 3 "" H 10500 2200 60  0001 C CNN
	1    10350 2150
	0    1    -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5C288491
P 5800 2350
AR Path="/5C273FF1/5C274725/5C288491" Ref="#PWR?"  Part="1" 
AR Path="/5C287C9A/5C288491" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5800 2200 50  0001 C CNN
F 1 "+5V" H 5815 2523 50  0000 C CNN
F 2 "" H 5800 2350 50  0001 C CNN
F 3 "" H 5800 2350 50  0001 C CNN
	1    5800 2350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5800 4000 5800 4050
Wire Wire Line
	5800 4050 5900 4050
Wire Wire Line
	5900 4050 5900 4000
Wire Wire Line
	1850 1800 1800 1800
$Comp
L Amplifier_Operational:TL072 U?
U 1 1 5C28849B
P 8500 3600
AR Path="/5C273FF1/5C274725/5C28849B" Ref="U?"  Part="1" 
AR Path="/5C287C9A/5C28849B" Ref="U?"  Part="1" 
F 0 "U?" H 8600 3950 50  0000 C CNN
F 1 "TL082" H 8600 3850 50  0000 C CNN
F 2 "" H 8500 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 8500 3600 50  0001 C CNN
	1    8500 3600
	-1   0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U?
U 2 1 5C2884A2
P 8100 5400
AR Path="/5C273FF1/5C274725/5C2884A2" Ref="U?"  Part="2" 
AR Path="/5C287C9A/5C2884A2" Ref="U?"  Part="2" 
F 0 "U?" H 8200 5750 50  0000 C CNN
F 1 "TL082" H 8200 5650 50  0000 C CNN
F 2 "" H 8100 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 8100 5400 50  0001 C CNN
	2    8100 5400
	-1   0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U?
U 3 1 5C2884A9
P 8700 3600
AR Path="/5C273FF1/5C274725/5C2884A9" Ref="U?"  Part="3" 
AR Path="/5C287C9A/5C2884A9" Ref="U?"  Part="3" 
F 0 "U?" H 8658 3646 50  0001 L CNN
F 1 "TL082" H 8658 3555 50  0001 L CNN
F 2 "" H 8700 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 8700 3600 50  0001 C CNN
	3    8700 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5C2884AF
P 10400 5300
AR Path="/5C273FF1/5C274725/5C2884AF" Ref="J?"  Part="1" 
AR Path="/5C287C9A/5C2884AF" Ref="J?"  Part="1" 
F 0 "J?" H 10479 5292 50  0000 L CNN
F 1 "Iron_temp" H 10479 5201 50  0000 L CNN
F 2 "" H 10400 5300 50  0001 C CNN
F 3 "~" H 10400 5300 50  0001 C CNN
	1    10400 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 5500 8500 5500
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5C2884B8
P 10400 3500
AR Path="/5C273FF1/5C274725/5C2884B8" Ref="J?"  Part="1" 
AR Path="/5C287C9A/5C2884B8" Ref="J?"  Part="1" 
F 0 "J?" H 10480 3492 50  0000 L CNN
F 1 "Airgun_temp" H 10480 3401 50  0000 L CNN
F 2 "" H 10400 3500 50  0001 C CNN
F 3 "~" H 10400 3500 50  0001 C CNN
	1    10400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 3600 8100 3600
Wire Wire Line
	8100 3600 8100 4000
Connection ~ 3200 1800
Wire Wire Line
	3200 1800 3000 1800
Connection ~ 3200 2400
Wire Wire Line
	3200 2400 3700 2400
Wire Wire Line
	5800 2350 5800 2500
$Comp
L power:+5V #PWR?
U 1 1 5C2884E2
P 5700 1700
AR Path="/5C273FF1/5C274725/5C2884E2" Ref="#PWR?"  Part="1" 
AR Path="/5C287C9A/5C2884E2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5700 1550 50  0001 C CNN
F 1 "+5V" H 5715 1873 50  0000 C CNN
F 2 "" H 5700 1700 50  0001 C CNN
F 3 "" H 5700 1700 50  0001 C CNN
	1    5700 1700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2450 1700 2500 1700
Wire Wire Line
	2500 1700 2500 2400
$Comp
L power:GNDREF #PWR?
U 1 1 5C2884EA
P 8600 3900
AR Path="/5C273FF1/5C274725/5C2884EA" Ref="#PWR?"  Part="1" 
AR Path="/5C287C9A/5C2884EA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8600 3650 50  0001 C CNN
F 1 "GNDREF" H 8605 3727 50  0001 C CNN
F 2 "" H 8600 3900 50  0001 C CNN
F 3 "" H 8600 3900 50  0001 C CNN
	1    8600 3900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8250 4150 8900 4150
$Comp
L Device:R R?
U 1 1 5C2884F1
P 8700 5750
AR Path="/5C273FF1/5C274725/5C2884F1" Ref="R?"  Part="1" 
AR Path="/5C287C9A/5C2884F1" Ref="R?"  Part="1" 
F 0 "R?" H 8900 5800 50  0000 R CNN
F 1 "1k" H 8900 5700 50  0000 R CNN
F 2 "" V 8630 5750 50  0001 C CNN
F 3 "~" H 8700 5750 50  0001 C CNN
	1    8700 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT_TRIM RV?
U 1 1 5C2884F8
P 7700 5800
AR Path="/5C273FF1/5C274725/5C2884F8" Ref="RV?"  Part="1" 
AR Path="/5C287C9A/5C2884F8" Ref="RV?"  Part="1" 
F 0 "RV?" V 7600 5850 50  0000 R CNN
F 1 "20k" V 7500 5850 50  0000 R CNN
F 2 "" H 7700 5800 50  0001 C CNN
F 3 "~" H 7700 5800 50  0001 C CNN
	1    7700 5800
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5C2884FF
P 9500 6100
AR Path="/5C273FF1/5C274725/5C2884FF" Ref="#PWR?"  Part="1" 
AR Path="/5C287C9A/5C2884FF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9500 5850 50  0001 C CNN
F 1 "GNDREF" H 9505 5927 50  0000 C CNN
F 2 "" H 9500 6100 50  0001 C CNN
F 3 "" H 9500 6100 50  0001 C CNN
	1    9500 6100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7700 5400 7700 5650
Wire Wire Line
	7700 5400 7800 5400
Wire Wire Line
	7850 5800 8500 5800
Wire Wire Line
	8500 5800 8500 5500
Wire Wire Line
	8800 3700 8900 3700
Wire Wire Line
	8900 3700 8900 4150
Connection ~ 8900 3700
Connection ~ 8500 5500
Wire Wire Line
	2500 2400 3200 2400
$Comp
L DIV_custom:SH1106 U?
U 1 1 5C288516
P 10350 2850
AR Path="/5C273FF1/5C274725/5C288516" Ref="U?"  Part="1" 
AR Path="/5C287C9A/5C288516" Ref="U?"  Part="1" 
F 0 "U?" V 10700 2650 60  0000 L CNN
F 1 "SH1106" V 10700 2800 60  0000 L CNN
F 2 "" H 10400 2900 60  0001 C CNN
F 3 "" H 10400 2900 60  0001 C CNN
	1    10350 2850
	0    1    -1   0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J?
U 1 1 5C28851F
P 6800 3000
AR Path="/5C273FF1/5C274725/5C28851F" Ref="J?"  Part="1" 
AR Path="/5C287C9A/5C28851F" Ref="J?"  Part="1" 
F 0 "J?" H 6850 3000 50  0000 C CNN
F 1 "airgun_sw" H 7100 3000 50  0000 C CNN
F 2 "" H 6800 3000 50  0001 C CNN
F 3 "~" H 6800 3000 50  0001 C CNN
	1    6800 3000
	1    0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5C288526
P 9500 5050
AR Path="/5C273FF1/5C274725/5C288526" Ref="R?"  Part="1" 
AR Path="/5C287C9A/5C288526" Ref="R?"  Part="1" 
F 0 "R?" H 9700 5100 50  0000 R CNN
F 1 "10k" H 9750 5000 50  0000 R CNN
F 2 "" V 9430 5050 50  0001 C CNN
F 3 "~" H 9500 5050 50  0001 C CNN
	1    9500 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 5200 9500 5300
Connection ~ 9500 5300
Wire Wire Line
	9500 5300 8400 5300
$Comp
L power:+5V #PWR?
U 1 1 5C288530
P 9500 4850
AR Path="/5C273FF1/5C274725/5C288530" Ref="#PWR?"  Part="1" 
AR Path="/5C287C9A/5C288530" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9500 4700 50  0001 C CNN
F 1 "+5V" H 9515 5023 50  0000 C CNN
F 2 "" H 9500 4850 50  0001 C CNN
F 3 "" H 9500 4850 50  0001 C CNN
	1    9500 4850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9500 4850 9500 4900
$Comp
L Device:CP C?
U 1 1 5C28853F
P 9500 5650
AR Path="/5C273FF1/5C274725/5C28853F" Ref="C?"  Part="1" 
AR Path="/5C287C9A/5C28853F" Ref="C?"  Part="1" 
F 0 "C?" H 9250 5700 50  0000 L CNN
F 1 "0,1uF" H 9150 5600 50  0000 L CNN
F 2 "" H 9538 5500 50  0001 C CNN
F 3 "~" H 9500 5650 50  0001 C CNN
	1    9500 5650
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5C288563
P 2850 5400
AR Path="/5C273FF1/5C274725/5C288563" Ref="R?"  Part="1" 
AR Path="/5C287C9A/5C288563" Ref="R?"  Part="1" 
F 0 "R?" V 3057 5400 50  0000 C CNN
F 1 "1k" V 2966 5400 50  0000 C CNN
F 2 "" V 2780 5400 50  0001 C CNN
F 3 "~" H 2850 5400 50  0001 C CNN
	1    2850 5400
	0    -1   1    0   
$EndComp
Connection ~ 3700 1600
Wire Wire Line
	2500 2400 1800 2400
Wire Wire Line
	1800 1800 1800 2400
Connection ~ 2500 2400
Wire Wire Line
	8600 2900 8600 3300
Wire Wire Line
	4200 2400 4200 1800
Wire Wire Line
	3200 1800 4200 1800
Wire Wire Line
	4300 1600 4300 2300
Wire Wire Line
	3700 1600 4300 1600
$Comp
L Device:R R?
U 1 1 5C288575
P 2850 4600
AR Path="/5C273FF1/5C274725/5C288575" Ref="R?"  Part="1" 
AR Path="/5C287C9A/5C288575" Ref="R?"  Part="1" 
F 0 "R?" V 3057 4600 50  0000 C CNN
F 1 "1k" V 2966 4600 50  0000 C CNN
F 2 "" V 2780 4600 50  0001 C CNN
F 3 "~" H 2850 4600 50  0001 C CNN
	1    2850 4600
	0    -1   1    0   
$EndComp
$Comp
L Transistor_Array:ULN2803A U?
U 1 1 5C28857E
P 4300 3100
AR Path="/5C273FF1/5C274725/5C28857E" Ref="U?"  Part="1" 
AR Path="/5C287C9A/5C28857E" Ref="U?"  Part="1" 
F 0 "U?" H 4550 3600 50  0000 C CNN
F 1 "ULN2803A" H 4200 3600 50  0000 C CNN
F 2 "" H 4350 2450 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2803a.pdf" H 4400 2900 50  0001 C CNN
	1    4300 3100
	-1   0    0    -1  
$EndComp
Connection ~ 8100 3600
Wire Wire Line
	1700 1600 1850 1600
Wire Wire Line
	9500 2900 8600 2900
Wire Wire Line
	10050 2900 9500 2900
Wire Wire Line
	10050 3000 9950 3000
Connection ~ 7700 5400
Wire Wire Line
	10050 2100 9950 2100
Wire Wire Line
	9950 2100 9950 3000
Wire Wire Line
	1700 1600 1700 2500
Wire Wire Line
	5300 2900 4700 2900
Wire Wire Line
	5300 3100 4700 3100
Wire Wire Line
	4700 3000 5300 3000
Wire Wire Line
	4700 3200 5300 3200
Wire Wire Line
	5300 3300 4700 3300
Wire Wire Line
	4700 3400 5300 3400
Wire Wire Line
	5300 3500 4700 3500
Wire Wire Line
	4700 3600 5300 3600
Wire Wire Line
	5300 2800 5000 2800
Wire Wire Line
	5000 2800 5000 2500
Wire Wire Line
	5100 2400 5100 2700
Wire Wire Line
	5100 2700 5300 2700
Wire Wire Line
	5300 2600 5200 2600
Wire Wire Line
	5200 2600 5200 2300
Wire Wire Line
	1700 2500 5000 2500
Wire Wire Line
	4200 2400 5100 2400
Wire Wire Line
	4300 2300 5200 2300
$Comp
L Connector:Conn_01x01_Female J?
U 1 1 5C2885B8
P 4900 3900
AR Path="/5C273FF1/5C274725/5C2885B8" Ref="J?"  Part="1" 
AR Path="/5C287C9A/5C2885B8" Ref="J?"  Part="1" 
F 0 "J?" H 4950 3900 50  0000 C CNN
F 1 "mains_sw" H 5200 3900 50  0000 C CNN
F 2 "" H 4900 3900 50  0001 C CNN
F 3 "~" H 4900 3900 50  0001 C CNN
	1    4900 3900
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Counter_Clockwise J?
U 1 1 5C2885C8
P 2900 3100
AR Path="/5C273FF1/5C274725/5C2885C8" Ref="J?"  Part="1" 
AR Path="/5C287C9A/5C2885C8" Ref="J?"  Part="1" 
F 0 "J?" H 2950 3550 50  0000 C CNN
F 1 "To power board" H 3100 3450 50  0000 C CNN
F 2 "" H 2900 3100 50  0001 C CNN
F 3 "~" H 2900 3100 50  0001 C CNN
	1    2900 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5C2885CF
P 5800 4100
AR Path="/5C273FF1/5C274725/5C2885CF" Ref="#PWR?"  Part="1" 
AR Path="/5C287C9A/5C2885CF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5800 3850 50  0001 C CNN
F 1 "GNDREF" H 5805 3927 50  0000 C CNN
F 2 "" H 5800 4100 50  0001 C CNN
F 3 "" H 5800 4100 50  0001 C CNN
	1    5800 4100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5800 4050 5800 4100
Wire Wire Line
	8700 5500 8700 5600
Wire Wire Line
	8500 5500 8700 5500
Wire Wire Line
	8700 5900 8700 6000
Wire Wire Line
	10100 5400 10100 6000
Wire Wire Line
	9500 6000 9500 6100
Wire Wire Line
	8700 6000 9500 6000
Wire Wire Line
	9500 5800 9500 6000
Connection ~ 9500 6000
Wire Wire Line
	9500 6000 10100 6000
Wire Wire Line
	9500 5500 9500 5300
$Comp
L Device:R_POT_TRIM RV?
U 1 1 5C445779
P 8100 4150
AR Path="/5C273FF1/5C274725/5C445779" Ref="RV?"  Part="1" 
AR Path="/5C287C9A/5C445779" Ref="RV?"  Part="1" 
F 0 "RV?" V 8000 4200 50  0000 R CNN
F 1 "20k" V 7900 4200 50  0000 R CNN
F 2 "" H 8100 4150 50  0001 C CNN
F 3 "~" H 8100 4150 50  0001 C CNN
	1    8100 4150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10200 5400 10100 5400
Wire Wire Line
	9500 5300 10200 5300
$Comp
L Device:R R?
U 1 1 5C452FD9
P 9100 3950
AR Path="/5C273FF1/5C274725/5C452FD9" Ref="R?"  Part="1" 
AR Path="/5C287C9A/5C452FD9" Ref="R?"  Part="1" 
F 0 "R?" H 9300 4000 50  0000 R CNN
F 1 "1k" H 9300 3900 50  0000 R CNN
F 2 "" V 9030 3950 50  0001 C CNN
F 3 "~" H 9100 3950 50  0001 C CNN
	1    9100 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5C452FE0
P 9500 4300
AR Path="/5C273FF1/5C274725/5C452FE0" Ref="#PWR?"  Part="1" 
AR Path="/5C287C9A/5C452FE0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9500 4050 50  0001 C CNN
F 1 "GNDREF" H 9505 4127 50  0000 C CNN
F 2 "" H 9500 4300 50  0001 C CNN
F 3 "" H 9500 4300 50  0001 C CNN
	1    9500 4300
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5C452FE6
P 9500 3250
AR Path="/5C273FF1/5C274725/5C452FE6" Ref="R?"  Part="1" 
AR Path="/5C287C9A/5C452FE6" Ref="R?"  Part="1" 
F 0 "R?" H 9700 3300 50  0000 R CNN
F 1 "10k" H 9750 3200 50  0000 R CNN
F 2 "" V 9430 3250 50  0001 C CNN
F 3 "~" H 9500 3250 50  0001 C CNN
	1    9500 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 3400 9500 3500
Connection ~ 9500 3500
Wire Wire Line
	9500 3500 8800 3500
$Comp
L Device:CP C?
U 1 1 5C452FF7
P 9500 3850
AR Path="/5C273FF1/5C274725/5C452FF7" Ref="C?"  Part="1" 
AR Path="/5C287C9A/5C452FF7" Ref="C?"  Part="1" 
F 0 "C?" H 9250 3900 50  0000 L CNN
F 1 "0,1uF" H 9150 3800 50  0000 L CNN
F 2 "" H 9538 3700 50  0001 C CNN
F 3 "~" H 9500 3850 50  0001 C CNN
	1    9500 3850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9100 3700 9100 3800
Wire Wire Line
	9100 4100 9100 4200
Wire Wire Line
	10100 3600 10100 4200
Wire Wire Line
	9500 4200 9500 4300
Wire Wire Line
	9100 4200 9500 4200
Wire Wire Line
	9500 4000 9500 4200
Connection ~ 9500 4200
Wire Wire Line
	9500 4200 10100 4200
Wire Wire Line
	9500 3700 9500 3500
Wire Wire Line
	10200 3600 10100 3600
Wire Wire Line
	9500 3500 10200 3500
Wire Wire Line
	9500 2900 9500 3100
Connection ~ 5800 4050
Wire Wire Line
	8900 3700 9100 3700
Wire Wire Line
	5700 1700 5700 1800
Wire Wire Line
	3200 2900 3900 2900
Wire Wire Line
	3200 3000 3900 3000
Wire Wire Line
	3200 3200 3300 3200
Wire Wire Line
	3300 3200 3300 3100
Wire Wire Line
	3300 3100 3900 3100
Wire Wire Line
	3200 3300 3400 3300
Wire Wire Line
	3400 3300 3400 3200
Wire Wire Line
	3400 3200 3900 3200
Wire Wire Line
	2700 3200 2400 3200
Wire Wire Line
	2400 3200 2400 3700
Wire Wire Line
	2400 3700 3500 3700
Wire Wire Line
	3500 3700 3500 3300
Wire Wire Line
	3500 3300 3900 3300
Wire Wire Line
	2300 3000 2300 3800
Wire Wire Line
	2300 3800 3600 3800
Wire Wire Line
	3600 3800 3600 3400
Wire Wire Line
	3600 3400 3900 3400
$Comp
L power:GNDREF #PWR?
U 1 1 5C4DFF0C
P 2600 3400
AR Path="/5C273FF1/5C274725/5C4DFF0C" Ref="#PWR?"  Part="1" 
AR Path="/5C287C9A/5C4DFF0C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2600 3150 50  0001 C CNN
F 1 "GNDREF" H 2605 3227 50  0000 C CNN
F 2 "" H 2600 3400 50  0001 C CNN
F 3 "" H 2600 3400 50  0001 C CNN
	1    2600 3400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2600 3400 2600 3300
Wire Wire Line
	2300 3000 2700 3000
$Comp
L power:+5V #PWR?
U 1 1 5C4EF47F
P 2200 2800
AR Path="/5C273FF1/5C274725/5C4EF47F" Ref="#PWR?"  Part="1" 
AR Path="/5C287C9A/5C4EF47F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2200 2650 50  0001 C CNN
F 1 "+5V" H 2215 2973 50  0000 C CNN
F 2 "" H 2200 2800 50  0001 C CNN
F 3 "" H 2200 2800 50  0001 C CNN
	1    2200 2800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2700 3300 2600 3300
Wire Wire Line
	2200 2900 2200 2800
Wire Wire Line
	5100 3900 5200 3900
Wire Wire Line
	5200 3900 5200 3700
Wire Wire Line
	5200 3700 5300 3700
Wire Wire Line
	5800 4050 4300 4050
Wire Wire Line
	4300 4050 4300 3800
Wire Wire Line
	3900 3500 3700 3500
Wire Wire Line
	3700 3500 3700 4600
Wire Wire Line
	3400 4600 3700 4600
Wire Wire Line
	3400 4500 6800 4500
Wire Wire Line
	6800 4500 6800 3100
Wire Wire Line
	6300 3100 6800 3100
Wire Wire Line
	6300 3000 6600 3000
Wire Wire Line
	3900 3600 3800 3600
Wire Wire Line
	3800 3600 3800 5400
Wire Wire Line
	3400 5400 3800 5400
Wire Wire Line
	2200 2900 2200 4600
Wire Wire Line
	2200 4600 2700 4600
Wire Wire Line
	2200 4600 2200 5400
Wire Wire Line
	2200 5400 2700 5400
Connection ~ 2200 4600
Wire Wire Line
	2400 4500 3000 4500
Wire Wire Line
	2400 5300 2400 4500
Wire Wire Line
	3400 5300 6700 5300
Wire Wire Line
	6700 5300 6700 3200
Wire Wire Line
	6700 3200 6300 3200
Wire Wire Line
	6300 3700 7700 3700
Wire Wire Line
	7700 3700 7700 5400
Wire Wire Line
	8100 3600 6300 3600
Connection ~ 9500 2900
Wire Wire Line
	9500 2900 9500 2000
Wire Wire Line
	9500 2000 10050 2000
Wire Wire Line
	9500 2000 9500 1800
Wire Wire Line
	9500 1800 5700 1800
Connection ~ 9500 2000
Connection ~ 5700 1800
Wire Wire Line
	5700 1800 5700 2000
Wire Wire Line
	6300 3500 8000 3500
Wire Wire Line
	8000 3500 8000 2800
Wire Wire Line
	8000 2800 10050 2800
Wire Wire Line
	10050 2700 7900 2700
Wire Wire Line
	7900 2700 7900 3400
Wire Wire Line
	7900 3400 6300 3400
Wire Wire Line
	6300 3300 7800 3300
Wire Wire Line
	7800 3300 7800 2300
Wire Wire Line
	7800 2300 10050 2300
Connection ~ 2200 2900
Wire Wire Line
	2200 2900 2700 2900
$Comp
L power:GNDREF #PWR?
U 1 1 5C62FC40
P 2400 5650
AR Path="/5C273FF1/5C274725/5C62FC40" Ref="#PWR?"  Part="1" 
AR Path="/5C287C9A/5C62FC40" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2400 5400 50  0001 C CNN
F 1 "GNDREF" H 2405 5477 50  0000 C CNN
F 2 "" H 2400 5650 50  0001 C CNN
F 3 "" H 2400 5650 50  0001 C CNN
	1    2400 5650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2400 5650 2400 5300
Connection ~ 2400 5300
Wire Wire Line
	2400 5300 3000 5300
$Comp
L power:GNDREF #PWR?
U 1 1 5C6581CF
P 1800 2650
AR Path="/5C273FF1/5C274725/5C6581CF" Ref="#PWR?"  Part="1" 
AR Path="/5C287C9A/5C6581CF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1800 2400 50  0001 C CNN
F 1 "GNDREF" H 1805 2477 50  0000 C CNN
F 2 "" H 1800 2650 50  0001 C CNN
F 3 "" H 1800 2650 50  0001 C CNN
	1    1800 2650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1800 2650 1800 2400
Connection ~ 1800 2400
$EndSCHEMATC