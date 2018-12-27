EESchema Schematic File Version 4
LIBS:Solder station-cache
LIBS:Power board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title "Power board"
Date "2018-12-27"
Rev "0,3"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:D_Bridge_+-AA D?
U 1 1 5C27472B
P 2500 3200
F 0 "D?" V 2700 3350 50  0000 L CNN
F 1 "D_Bridge_+-AA" H 2841 3155 50  0001 L CNN
F 2 "" H 2500 3200 50  0001 C CNN
F 3 "~" H 2500 3200 50  0001 C CNN
	1    2500 3200
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Bridge_+-AA D?
U 1 1 5C274732
P 2500 1700
F 0 "D?" V 2700 1900 50  0000 L CNN
F 1 "D_Bridge_+-AA" H 2841 1655 50  0001 L CNN
F 2 "" H 2500 1700 50  0001 C CNN
F 3 "~" H 2500 1700 50  0001 C CNN
	1    2500 1700
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C?
U 1 1 5C274739
P 3300 3200
F 0 "C?" H 3150 3250 50  0000 R CNN
F 1 "1000uF" H 3150 3150 50  0000 R CNN
F 2 "" H 3338 3050 50  0001 C CNN
F 3 "~" H 3300 3200 50  0001 C CNN
	1    3300 3200
	-1   0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5C274740
P 4000 3200
F 0 "C?" H 3750 3250 50  0000 L CNN
F 1 "1uF" H 3700 3150 50  0000 L CNN
F 2 "" H 4038 3050 50  0001 C CNN
F 3 "~" H 4000 3200 50  0001 C CNN
	1    4000 3200
	-1   0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5C274747
P 3300 1700
F 0 "C?" H 3150 1750 50  0000 R CNN
F 1 "1000uF" H 3150 1650 50  0000 R CNN
F 2 "" H 3338 1550 50  0001 C CNN
F 3 "~" H 3300 1700 50  0001 C CNN
	1    3300 1700
	-1   0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5C27474E
P 5200 1700
F 0 "C?" H 4950 1750 50  0000 L CNN
F 1 "1uF" H 4900 1650 50  0000 L CNN
F 2 "" H 5238 1550 50  0001 C CNN
F 3 "~" H 5200 1700 50  0001 C CNN
	1    5200 1700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2500 2900 3300 2900
Wire Wire Line
	4000 2900 4000 3050
Wire Wire Line
	3300 3050 3300 2900
Connection ~ 3300 2900
Wire Wire Line
	3300 2900 4000 2900
Wire Wire Line
	4000 3350 4000 3500
Wire Wire Line
	4000 3500 3300 3500
Wire Wire Line
	3300 3350 3300 3500
Connection ~ 3300 3500
Wire Wire Line
	3300 3500 2500 3500
Connection ~ 4000 3500
Connection ~ 4000 2900
$Comp
L power:+5V #PWR?
U 1 1 5C274761
P 5200 2750
F 0 "#PWR?" H 5200 2600 50  0001 C CNN
F 1 "+5V" H 5215 2923 50  0000 C CNN
F 2 "" H 5200 2750 50  0001 C CNN
F 3 "" H 5200 2750 50  0001 C CNN
	1    5200 2750
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5C274767
P 5200 3650
F 0 "#PWR?" H 5200 3400 50  0001 C CNN
F 1 "GNDREF" H 5205 3477 50  0000 C CNN
F 2 "" H 5200 3650 50  0001 C CNN
F 3 "" H 5200 3650 50  0001 C CNN
	1    5200 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5200 3500 5200 3650
Wire Wire Line
	2500 1400 3300 1400
Wire Wire Line
	3300 1550 3300 1400
Connection ~ 3300 1400
Wire Wire Line
	3300 1850 3300 2000
Connection ~ 3300 2000
Wire Wire Line
	3300 2000 2500 2000
$Comp
L power:GNDREF #PWR?
U 1 1 5C274774
P 5200 2100
F 0 "#PWR?" H 5200 1850 50  0001 C CNN
F 1 "GNDREF" H 5205 1927 50  0000 C CNN
F 2 "" H 5200 2100 50  0001 C CNN
F 3 "" H 5200 2100 50  0001 C CNN
	1    5200 2100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5200 2100 5200 2000
$Comp
L Device:CP C?
U 1 1 5C27477B
P 5200 3200
F 0 "C?" H 4950 3250 50  0000 L CNN
F 1 "0,1uF" H 4850 3150 50  0000 L CNN
F 2 "" H 5238 3050 50  0001 C CNN
F 3 "~" H 5200 3200 50  0001 C CNN
	1    5200 3200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5200 3350 5200 3500
Connection ~ 5200 3500
$Comp
L Relay_SolidState:MOC3041M U?
U 1 1 5C274784
P 7000 1400
F 0 "U?" H 7000 1725 50  0000 C CNN
F 1 "MOC3041M" H 7000 1634 50  0000 C CNN
F 2 "" H 6800 1200 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/MO/MOC3031M.pdf" H 6965 1400 50  0001 L CNN
	1    7000 1400
	1    0    0    -1  
$EndComp
$Comp
L Triac_Thyristor:BT136-600 Q?
U 1 1 5C27478B
P 8100 1550
F 0 "Q?" H 8229 1596 50  0000 L CNN
F 1 "BT136-600" H 8229 1505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 8300 1475 50  0001 L CIN
F 3 "http://www.micropik.com/PDF/BT136-600.pdf" H 8100 1550 50  0001 L CNN
	1    8100 1550
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:TIP122 Q?
U 1 1 5C274792
P 2700 5600
F 0 "Q?" V 2950 5600 50  0000 L CNN
F 1 "TIP122" V 3050 5500 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2900 5525 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/TI/TIP120.pdf" H 2700 5600 50  0001 L CNN
	1    2700 5600
	0    -1   1    0   
$EndComp
$Comp
L DIV_custom:G2R-2-SN K?
U 1 1 5C274799
P 9600 1700
F 0 "K?" V 10350 1650 50  0000 L CNN
F 1 "G2R-2-SN" V 10250 1500 50  0000 L CNN
F 2 "" H 10250 1650 50  0001 L CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-g6k.pdf" H 9400 1700 50  0001 C CNN
	1    9600 1700
	0    1    -1   0   
$EndComp
$Comp
L DIV_custom:G2R-2-SN K?
U 1 1 5C2747A0
P 8700 4200
F 0 "K?" V 9467 4200 50  0000 C CNN
F 1 "G2R-2-SN" V 9376 4200 50  0000 C CNN
F 2 "" H 9350 4150 50  0001 L CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-g6k.pdf" H 8500 4200 50  0001 C CNN
	1    8700 4200
	0    1    -1   0   
$EndComp
$Comp
L Switch:SW_DPDT_x2 SW?
U 1 1 5C2747A7
P 8700 3100
F 0 "SW?" H 8700 3385 50  0000 C CNN
F 1 "Mains_SW" H 8700 3294 50  0000 C CNN
F 2 "" H 8700 3100 50  0001 C CNN
F 3 "" H 8700 3100 50  0001 C CNN
	1    8700 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5C2747AE
P 10250 2900
F 0 "J?" H 10330 2892 50  0000 L CNN
F 1 "To_transformer" H 10330 2801 50  0000 L CNN
F 2 "" H 10250 2900 50  0001 C CNN
F 3 "~" H 10250 2900 50  0001 C CNN
	1    10250 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3100 8500 3100
Wire Wire Line
	9200 2900 9200 2700
$Comp
L power:+24V #PWR?
U 1 1 5C2747B8
P 9200 4500
F 0 "#PWR?" H 9200 4350 50  0001 C CNN
F 1 "+24V" H 9215 4673 50  0000 C CNN
F 2 "" H 9200 4500 50  0001 C CNN
F 3 "" H 9200 4500 50  0001 C CNN
	1    9200 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 4500 9200 4600
Wire Wire Line
	8900 3000 9200 3000
$Comp
L Device:R R?
U 1 1 5C2747C2
P 7650 1300
F 0 "R?" V 7443 1300 50  0000 C CNN
F 1 "330R" V 7534 1300 50  0000 C CNN
F 2 "" V 7580 1300 50  0001 C CNN
F 3 "~" H 7650 1300 50  0001 C CNN
	1    7650 1300
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5C2747C9
P 7400 1750
F 0 "R?" H 7330 1704 50  0000 R CNN
F 1 "330R" H 7330 1795 50  0000 R CNN
F 2 "" V 7330 1750 50  0001 C CNN
F 3 "~" H 7400 1750 50  0001 C CNN
	1    7400 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	7300 1300 7500 1300
Wire Wire Line
	7800 1300 8100 1300
Wire Wire Line
	8100 1300 8100 1400
Wire Wire Line
	7300 1500 7400 1500
Wire Wire Line
	7700 1500 7700 1650
Wire Wire Line
	7700 1650 7950 1650
Wire Wire Line
	7400 1500 7400 1600
Connection ~ 7400 1500
Wire Wire Line
	7400 1500 7700 1500
Wire Wire Line
	7400 1900 7400 2000
Wire Wire Line
	7400 2000 8100 2000
Wire Wire Line
	8100 2000 8100 1700
$Comp
L Relay_SolidState:MOC3041M U?
U 1 1 5C2747DC
P 7900 5500
F 0 "U?" H 7900 5825 50  0000 C CNN
F 1 "MOC3041M" H 7900 5734 50  0000 C CNN
F 2 "" H 7700 5300 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/MO/MOC3031M.pdf" H 7865 5500 50  0001 L CNN
	1    7900 5500
	1    0    0    -1  
$EndComp
$Comp
L Triac_Thyristor:BT136-600 Q?
U 1 1 5C2747E3
P 9000 5650
F 0 "Q?" H 9129 5696 50  0000 L CNN
F 1 "BT136-600" H 9129 5605 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9200 5575 50  0001 L CIN
F 3 "http://www.micropik.com/PDF/BT136-600.pdf" H 9000 5650 50  0001 L CNN
	1    9000 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5C2747EA
P 8550 5400
F 0 "R?" V 8343 5400 50  0000 C CNN
F 1 "330R" V 8434 5400 50  0000 C CNN
F 2 "" V 8480 5400 50  0001 C CNN
F 3 "~" H 8550 5400 50  0001 C CNN
	1    8550 5400
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5C2747F1
P 8300 5950
F 0 "R?" H 8230 5904 50  0000 R CNN
F 1 "330R" H 8230 5995 50  0000 R CNN
F 2 "" V 8230 5950 50  0001 C CNN
F 3 "~" H 8300 5950 50  0001 C CNN
	1    8300 5950
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 5400 8400 5400
Wire Wire Line
	8700 5400 9000 5400
Wire Wire Line
	9000 5400 9000 5500
Wire Wire Line
	8200 5600 8300 5600
Wire Wire Line
	8600 5600 8600 5750
Wire Wire Line
	8600 5750 8850 5750
Wire Wire Line
	8300 5600 8300 5800
Connection ~ 8300 5600
Wire Wire Line
	8300 5600 8600 5600
Wire Wire Line
	8300 6100 8300 6200
Wire Wire Line
	8300 6200 9000 6200
Wire Wire Line
	9000 6200 9000 5800
$Comp
L DIV_custom:240VAC #PWR?
U 1 1 5C274804
P 9800 2700
F 0 "#PWR?" H 9800 2550 50  0001 C CNN
F 1 "240VAC" H 9815 2873 50  0000 C CNN
F 2 "" H 9800 2700 50  0001 C CNN
F 3 "" H 9800 2700 50  0001 C CNN
	1    9800 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 2700 9800 3000
$Comp
L DIV_custom:240VAC #PWR?
U 1 1 5C27480D
P 8100 1200
F 0 "#PWR?" H 8100 1050 50  0001 C CNN
F 1 "240VAC" H 8115 1373 50  0000 C CNN
F 2 "" H 8100 1200 50  0001 C CNN
F 3 "" H 8100 1200 50  0001 C CNN
	1    8100 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 1200 8100 1300
Connection ~ 8100 1300
Wire Wire Line
	9400 2700 9400 2900
$Comp
L power:NEUT #PWR?
U 1 1 5C274818
P 9000 1650
F 0 "#PWR?" H 9000 1500 50  0001 C CNN
F 1 "NEUT" H 9017 1823 50  0000 C CNN
F 2 "" H 9000 1650 50  0001 C CNN
F 3 "" H 9000 1650 50  0001 C CNN
	1    9000 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1650 9000 1700
Wire Wire Line
	9000 1700 9300 1700
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5C274822
P 10250 1300
F 0 "J?" H 10329 1292 50  0000 L CNN
F 1 "Airgun_HT" H 10329 1201 50  0000 L CNN
F 2 "" H 10250 1300 50  0001 C CNN
F 3 "~" H 10250 1300 50  0001 C CNN
	1    10250 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 1200 10000 1300
Wire Wire Line
	10000 1300 10050 1300
Wire Wire Line
	10000 1600 10000 1400
Wire Wire Line
	10000 1400 10050 1400
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5C27482D
P 10000 6100
F 0 "J?" H 10080 6092 50  0000 L CNN
F 1 "Iron_HT" H 10080 6001 50  0000 L CNN
F 2 "" H 10000 6100 50  0001 C CNN
F 3 "~" H 10000 6100 50  0001 C CNN
	1    10000 6100
	1    0    0    -1  
$EndComp
Connection ~ 9000 5400
Wire Wire Line
	9000 6200 9800 6200
Connection ~ 9000 6200
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5C274837
P 1150 5600
F 0 "J?" H 1230 5592 50  0000 L CNN
F 1 "Airgun_fan" H 1230 5501 50  0000 L CNN
F 2 "" H 1150 5600 50  0001 C CNN
F 3 "~" H 1150 5600 50  0001 C CNN
	1    1150 5600
	-1   0    0    -1  
$EndComp
$Comp
L power:+24V #PWR?
U 1 1 5C27483E
P 1700 5100
F 0 "#PWR?" H 1700 4950 50  0001 C CNN
F 1 "+24V" H 1715 5273 50  0000 C CNN
F 2 "" H 1700 5100 50  0001 C CNN
F 3 "" H 1700 5100 50  0001 C CNN
	1    1700 5100
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5C274844
P 3450 5800
F 0 "#PWR?" H 3450 5550 50  0001 C CNN
F 1 "GNDREF" H 3455 5627 50  0000 C CNN
F 2 "" H 3450 5800 50  0001 C CNN
F 3 "" H 3450 5800 50  0001 C CNN
	1    3450 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 5700 3450 5800
$Comp
L Device:R R?
U 1 1 5C27484B
P 3000 5300
F 0 "R?" V 3207 5300 50  0000 C CNN
F 1 "330R" V 3116 5300 50  0000 C CNN
F 2 "" V 2930 5300 50  0001 C CNN
F 3 "~" H 3000 5300 50  0001 C CNN
	1    3000 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2850 5300 2700 5300
Wire Wire Line
	2900 2700 2900 3200
Wire Wire Line
	2900 1700 2800 1700
Wire Wire Line
	2900 1200 2900 1700
Wire Wire Line
	2200 3200 2000 3200
Wire Wire Line
	9900 1200 10000 1200
Wire Wire Line
	9900 1600 10000 1600
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5C27485B
P 7500 2900
F 0 "J?" H 7580 2892 50  0000 L CNN
F 1 "Mains_in" H 7580 2801 50  0000 L CNN
F 2 "" H 7500 2900 50  0001 C CNN
F 3 "~" H 7500 2900 50  0001 C CNN
F 4 "Live" H 7400 2700 50  0000 C CNN "1"
F 5 "Neutral" H 7400 3000 50  0000 C CNN "2"
	1    7500 2900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8300 2700 9200 2700
$Comp
L power:NEUT #PWR?
U 1 1 5C274865
P 9400 2700
F 0 "#PWR?" H 9400 2550 50  0001 C CNN
F 1 "NEUT" H 9417 2873 50  0000 C CNN
F 2 "" H 9400 2700 50  0001 C CNN
F 3 "" H 9400 2700 50  0001 C CNN
	1    9400 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3000 8300 3100
Connection ~ 8300 3100
Wire Wire Line
	8300 2900 8300 2700
Wire Wire Line
	9800 5500 9650 5500
$Comp
L power:+24V #PWR?
U 1 1 5C27486F
P 10200 2100
F 0 "#PWR?" H 10200 1950 50  0001 C CNN
F 1 "+24V" H 10215 2273 50  0000 C CNN
F 2 "" H 10200 2100 50  0001 C CNN
F 3 "" H 10200 2100 50  0001 C CNN
	1    10200 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 5300 2700 5400
Wire Wire Line
	3450 5350 3450 5300
Wire Wire Line
	3450 5650 3450 5700
$Comp
L Device:CP C?
U 1 1 5C274879
P 3450 5500
F 0 "C?" H 3200 5550 50  0000 L CNN
F 1 "470uF" H 3050 5450 50  0000 L CNN
F 2 "" H 3488 5350 50  0001 C CNN
F 3 "~" H 3450 5500 50  0001 C CNN
	1    3450 5500
	-1   0    0    -1  
$EndComp
$Comp
L Device:D D?
U 1 1 5C274880
P 2300 5450
F 0 "D?" V 2250 5250 50  0000 L CNN
F 1 "D" V 2350 5300 50  0000 L CNN
F 2 "" H 2300 5450 50  0001 C CNN
F 3 "~" H 2300 5450 50  0001 C CNN
	1    2300 5450
	0    -1   1    0   
$EndComp
Wire Wire Line
	2300 5600 2300 5700
$Comp
L Regulator_Linear:L7824 U?
U 1 1 5C274888
P 4600 1400
F 0 "U?" H 4600 1642 50  0000 C CNN
F 1 "L7824" H 4600 1551 50  0000 C CNN
F 2 "" H 4625 1250 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 4600 1350 50  0001 C CNN
	1    4600 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2750 5200 2900
$Comp
L Regulator_Linear:L7805 U?
U 1 1 5C274890
P 4600 2900
F 0 "U?" H 4600 3142 50  0000 C CNN
F 1 "L7805" H 4600 3051 50  0000 C CNN
F 2 "" H 4625 2750 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 4600 2850 50  0001 C CNN
	1    4600 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2750 4000 2900
Wire Wire Line
	4000 2900 4300 2900
Wire Wire Line
	4600 2000 4600 1700
Wire Wire Line
	4600 2000 5200 2000
Wire Wire Line
	5200 1400 4900 1400
Connection ~ 4600 2000
$Comp
L power:+24V #PWR?
U 1 1 5C27489D
P 5200 1300
F 0 "#PWR?" H 5200 1150 50  0001 C CNN
F 1 "+24V" H 5215 1473 50  0000 C CNN
F 2 "" H 5200 1300 50  0001 C CNN
F 3 "" H 5200 1300 50  0001 C CNN
	1    5200 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1300 5200 1400
Wire Wire Line
	5200 1550 5200 1400
Connection ~ 5200 1400
Wire Wire Line
	4900 2900 5200 2900
Connection ~ 5200 2900
Wire Wire Line
	5200 2900 5200 3050
Wire Wire Line
	4600 3200 4600 3500
Connection ~ 4600 3500
Wire Wire Line
	4600 3500 5200 3500
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5C2748AC
P 1800 1600
F 0 "J?" H 1880 1592 50  0000 L CNN
F 1 "24VAC" H 1880 1501 50  0000 L CNN
F 2 "" H 1800 1600 50  0001 C CNN
F 3 "~" H 1800 1600 50  0001 C CNN
	1    1800 1600
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5C2748B3
P 1800 3100
F 0 "J?" H 1880 3092 50  0000 L CNN
F 1 "10VAC" H 1880 3001 50  0000 L CNN
F 2 "" H 1800 3100 50  0001 C CNN
F 3 "~" H 1800 3100 50  0001 C CNN
	1    1800 3100
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5C2748BA
P 10000 5400
F 0 "J?" H 10080 5392 50  0000 L CNN
F 1 "24VAC" H 10080 5301 50  0000 L CNN
F 2 "" H 10000 5400 50  0001 C CNN
F 3 "~" H 10000 5400 50  0001 C CNN
	1    10000 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1700 2200 1700
Wire Wire Line
	2100 1200 2100 1600
Wire Wire Line
	2100 1600 2000 1600
Wire Wire Line
	2100 1200 2900 1200
Wire Wire Line
	2100 3100 2100 2700
Wire Wire Line
	2100 3100 2000 3100
Wire Wire Line
	2500 5700 2300 5700
Wire Wire Line
	1700 5100 1700 5200
Wire Wire Line
	1700 5200 2300 5200
Wire Wire Line
	2300 5200 2300 5300
$Comp
L Device:C C?
U 1 1 5C2748CB
P 1700 5450
F 0 "C?" H 1850 5500 50  0000 L CNN
F 1 "0,1uF" H 1850 5400 50  0000 L CNN
F 2 "" H 1738 5300 50  0001 C CNN
F 3 "~" H 1700 5450 50  0001 C CNN
	1    1700 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 5300 1700 5200
Connection ~ 1700 5200
Wire Wire Line
	1700 5600 1700 5700
Connection ~ 2300 5700
Connection ~ 1700 5700
Wire Wire Line
	1700 5700 1350 5700
Wire Wire Line
	2300 5700 1700 5700
Wire Wire Line
	1700 5200 1500 5200
Wire Wire Line
	1500 5200 1500 5600
Wire Wire Line
	1500 5600 1350 5600
Connection ~ 3450 5700
Wire Wire Line
	3450 5700 2900 5700
Wire Wire Line
	9000 5400 9800 5400
Wire Wire Line
	9800 6100 9650 6100
Wire Wire Line
	9650 6100 9650 5500
Wire Wire Line
	9000 4600 9200 4600
Wire Wire Line
	9900 2100 10200 2100
$Comp
L Device:R R?
U 1 1 5C2748E3
P 6450 1300
F 0 "R?" V 6250 1300 50  0000 C CNN
F 1 "1k" V 6350 1300 50  0000 C CNN
F 2 "" V 6380 1300 50  0001 C CNN
F 3 "~" H 6450 1300 50  0001 C CNN
	1    6450 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 1300 6700 1300
$Comp
L Device:R R?
U 1 1 5C2748EB
P 7350 5400
F 0 "R?" V 7150 5400 50  0000 C CNN
F 1 "1k" V 7250 5400 50  0000 C CNN
F 2 "" V 7280 5400 50  0001 C CNN
F 3 "~" H 7350 5400 50  0001 C CNN
	1    7350 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 5400 7600 5400
$Comp
L power:+5V #PWR?
U 1 1 5C2748F3
P 6200 1200
F 0 "#PWR?" H 6200 1050 50  0001 C CNN
F 1 "+5V" H 6215 1373 50  0000 C CNN
F 2 "" H 6200 1200 50  0001 C CNN
F 3 "" H 6200 1200 50  0001 C CNN
	1    6200 1200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6200 1200 6200 1300
Wire Wire Line
	6200 1300 6300 1300
$Comp
L power:+5V #PWR?
U 1 1 5C2748FB
P 7100 5300
F 0 "#PWR?" H 7100 5150 50  0001 C CNN
F 1 "+5V" H 7115 5473 50  0000 C CNN
F 2 "" H 7100 5300 50  0001 C CNN
F 3 "" H 7100 5300 50  0001 C CNN
	1    7100 5300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7100 5300 7100 5400
Wire Wire Line
	7100 5400 7200 5400
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5C274903
P 1150 6900
F 0 "J?" H 1230 6892 50  0000 L CNN
F 1 "Chassis_fan" H 1230 6801 50  0000 L CNN
F 2 "" H 1150 6900 50  0001 C CNN
F 3 "~" H 1150 6900 50  0001 C CNN
	1    1150 6900
	-1   0    0    -1  
$EndComp
$Comp
L Device:D D?
U 1 1 5C27490A
P 2300 6750
F 0 "D?" V 2250 6550 50  0000 L CNN
F 1 "D" V 2350 6600 50  0000 L CNN
F 2 "" H 2300 6750 50  0001 C CNN
F 3 "~" H 2300 6750 50  0001 C CNN
	1    2300 6750
	0    -1   1    0   
$EndComp
Wire Wire Line
	2300 6900 2300 7000
Wire Wire Line
	1700 6400 1700 6500
Wire Wire Line
	1700 6500 2300 6500
Wire Wire Line
	2300 6500 2300 6600
$Comp
L Device:C C?
U 1 1 5C274915
P 1700 6750
F 0 "C?" H 1850 6800 50  0000 L CNN
F 1 "0,1uF" H 1850 6700 50  0000 L CNN
F 2 "" H 1738 6600 50  0001 C CNN
F 3 "~" H 1700 6750 50  0001 C CNN
	1    1700 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6600 1700 6500
Connection ~ 1700 6500
Wire Wire Line
	1700 6900 1700 7000
Connection ~ 1700 7000
Wire Wire Line
	1700 7000 1350 7000
Wire Wire Line
	2300 7000 1700 7000
Wire Wire Line
	1700 6500 1500 6500
Wire Wire Line
	1500 6500 1500 6900
Wire Wire Line
	1500 6900 1350 6900
$Comp
L power:+5V #PWR?
U 1 1 5C274925
P 5500 5000
F 0 "#PWR?" H 5500 4850 50  0001 C CNN
F 1 "+5V" H 5515 5173 50  0000 C CNN
F 2 "" H 5500 5000 50  0001 C CNN
F 3 "" H 5500 5000 50  0001 C CNN
	1    5500 5000
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5C27492B
P 5500 5850
F 0 "#PWR?" H 5500 5600 50  0001 C CNN
F 1 "GNDREF" H 5505 5677 50  0000 C CNN
F 2 "" H 5500 5850 50  0001 C CNN
F 3 "" H 5500 5850 50  0001 C CNN
	1    5500 5850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5500 5000 5500 5200
Wire Wire Line
	5500 5200 5600 5200
Wire Wire Line
	5500 5600 5500 5850
Wire Wire Line
	5500 5600 5600 5600
Connection ~ 2300 7000
$Comp
L power:GNDREF #PWR?
U 1 1 5C274936
P 1700 7450
F 0 "#PWR?" H 1700 7200 50  0001 C CNN
F 1 "GNDREF" H 1705 7277 50  0000 C CNN
F 2 "" H 1700 7450 50  0001 C CNN
F 3 "" H 1700 7450 50  0001 C CNN
	1    1700 7450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5C27493C
P 1700 7250
F 0 "C?" H 1450 7300 50  0000 L CNN
F 1 "470uF" H 1300 7200 50  0000 L CNN
F 2 "" H 1738 7100 50  0001 C CNN
F 3 "~" H 1700 7250 50  0001 C CNN
	1    1700 7250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1700 7400 1700 7450
Wire Wire Line
	1700 7100 1700 7000
Wire Wire Line
	4000 3500 4600 3500
Wire Wire Line
	2100 2700 2900 2700
Wire Wire Line
	2900 3200 2800 3200
$Comp
L power:+10V #PWR?
U 1 1 5C274948
P 4000 2750
F 0 "#PWR?" H 4000 2600 50  0001 C CNN
F 1 "+10V" H 4015 2923 50  0000 C CNN
F 2 "" H 4000 2750 50  0001 C CNN
F 3 "" H 4000 2750 50  0001 C CNN
	1    4000 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1850 5200 2000
Connection ~ 5200 2000
Wire Wire Line
	3300 1400 4300 1400
Wire Wire Line
	3300 2000 4600 2000
$Comp
L power:+10V #PWR?
U 1 1 5C274952
P 1700 6400
F 0 "#PWR?" H 1700 6250 50  0001 C CNN
F 1 "+10V" H 1715 6573 50  0000 C CNN
F 2 "" H 1700 6400 50  0001 C CNN
F 3 "" H 1700 6400 50  0001 C CNN
	1    1700 6400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6700 1500 6400 1500
$Comp
L Connector_Generic:Conn_02x05_Counter_Clockwise J?
U 1 1 5C27495B
P 5800 5400
F 0 "J?" H 5850 5817 50  0000 C CNN
F 1 "To logic board" H 5850 5726 50  0000 C CNN
F 2 "" H 5800 5400 50  0001 C CNN
F 3 "~" H 5800 5400 50  0001 C CNN
	1    5800 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 5300 3150 5300
Wire Wire Line
	8300 3800 8400 3800
Wire Wire Line
	8300 3100 8300 3800
Wire Wire Line
	9200 3700 9200 3000
Wire Wire Line
	9000 3700 9200 3700
Wire Wire Line
	6100 5600 7600 5600
Wire Wire Line
	8100 2000 8800 2000
Wire Wire Line
	8800 2000 8800 1300
Wire Wire Line
	8800 1300 9300 1300
Connection ~ 8100 2000
$Comp
L Device:Fuse F?
U 1 1 5C33169D
P 7950 3000
F 0 "F?" V 8050 3000 50  0000 C CNN
F 1 "2A" V 8150 3000 50  0000 C CNN
F 2 "" V 7880 3000 50  0001 C CNN
F 3 "~" H 7950 3000 50  0001 C CNN
	1    7950 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	7700 3000 7800 3000
Wire Wire Line
	8300 3000 8100 3000
Wire Wire Line
	7700 2900 8300 2900
Wire Wire Line
	5200 7000 5200 5500
Wire Wire Line
	5200 5500 5600 5500
Wire Wire Line
	2300 7000 5200 7000
Wire Wire Line
	3450 5300 5600 5300
Connection ~ 3450 5300
Wire Wire Line
	9300 2100 6500 2100
Wire Wire Line
	6500 2100 6500 5300
Wire Wire Line
	6500 5300 6100 5300
Wire Wire Line
	6800 5500 6100 5500
Wire Wire Line
	6400 1500 6400 5200
Wire Wire Line
	6400 5200 6100 5200
Wire Wire Line
	6800 4600 6800 5500
Wire Wire Line
	9400 2900 10050 2900
Wire Wire Line
	9800 3000 10050 3000
Wire Wire Line
	9800 3000 9200 3000
Connection ~ 9800 3000
Connection ~ 9200 3000
Wire Wire Line
	9200 2900 9400 2900
Connection ~ 9400 2900
Wire Wire Line
	6800 4600 8400 4600
Text Notes 9850 5650 0    50   ~ 0
Yellow wires from transf.
Text Notes 1950 3400 2    50   ~ 0
Black wires from transf.
Text Notes 1950 1900 2    50   ~ 0
Blue wires from transf.
$EndSCHEMATC
