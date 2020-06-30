EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATtiny:ATtiny13A-SSU U1
U 1 1 5EF3435F
P 4900 2500
F 0 "U1" H 4370 2546 50  0000 R CNN
F 1 "ATtiny13A-SSU" H 4370 2455 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4900 2500 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc8126.pdf" H 4900 2500 50  0001 C CNN
	1    4900 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5EF3558A
P 7000 3450
F 0 "R1" H 7059 3496 50  0000 L CNN
F 1 "120k" H 7059 3405 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7000 3450 50  0001 C CNN
F 3 "~" H 7000 3450 50  0001 C CNN
	1    7000 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 5EF36097
P 9600 2350
F 0 "J3" H 9680 2342 50  0000 L CNN
F 1 "Conn_01x02" H 9680 2251 50  0000 L CNN
F 2 "tinychargeamp:edgeconn2" H 9600 2350 50  0001 C CNN
F 3 "~" H 9600 2350 50  0001 C CNN
	1    9600 2350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5EF364F0
P 9600 1950
F 0 "J2" H 9680 1992 50  0000 L CNN
F 1 "Conn_01x03" H 9680 1901 50  0000 L CNN
F 2 "tinychargeamp:edgeconn3" H 9600 1950 50  0001 C CNN
F 3 "~" H 9600 1950 50  0001 C CNN
	1    9600 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5EF37005
P 9100 3650
F 0 "C2" H 9192 3696 50  0000 L CNN
F 1 "1u" H 9192 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9100 3650 50  0001 C CNN
F 3 "~" H 9100 3650 50  0001 C CNN
	1    9100 3650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5EF37727
P 9600 1450
F 0 "J1" H 9680 1442 50  0000 L CNN
F 1 "Conn_01x02" H 9680 1351 50  0000 L CNN
F 2 "tinychargeamp:edgeconn2" H 9600 1450 50  0001 C CNN
F 3 "~" H 9600 1450 50  0001 C CNN
	1    9600 1450
	1    0    0    -1  
$EndComp
Text Label 9400 1450 2    50   ~ 0
PIEZO+
Text Label 9400 1550 2    50   ~ 0
PIEZO-
Text Label 9400 1950 2    50   ~ 0
VCC
Text Label 9400 1850 2    50   ~ 0
GND
Text Label 9400 2050 2    50   ~ 0
OUT
Text Label 9400 2350 2    50   ~ 0
DW
Text Label 9400 2450 2    50   ~ 0
GND
$Comp
L power:VCC #PWR0101
U 1 1 5EF41329
P 9100 3550
F 0 "#PWR0101" H 9100 3400 50  0001 C CNN
F 1 "VCC" H 9115 3723 50  0000 C CNN
F 2 "" H 9100 3550 50  0001 C CNN
F 3 "" H 9100 3550 50  0001 C CNN
	1    9100 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EF41C54
P 9100 3750
F 0 "#PWR0102" H 9100 3500 50  0001 C CNN
F 1 "GND" H 9105 3577 50  0000 C CNN
F 2 "" H 9100 3750 50  0001 C CNN
F 3 "" H 9100 3750 50  0001 C CNN
	1    9100 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5EF42465
P 4900 3100
F 0 "#PWR0103" H 4900 2850 50  0001 C CNN
F 1 "GND" H 4905 2927 50  0000 C CNN
F 2 "" H 4900 3100 50  0001 C CNN
F 3 "" H 4900 3100 50  0001 C CNN
	1    4900 3100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 5EF426D2
P 4900 1900
F 0 "#PWR0104" H 4900 1750 50  0001 C CNN
F 1 "VCC" H 4915 2073 50  0000 C CNN
F 2 "" H 4900 1900 50  0001 C CNN
F 3 "" H 4900 1900 50  0001 C CNN
	1    4900 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5EF468B9
P 7000 3950
F 0 "#PWR0105" H 7000 3700 50  0001 C CNN
F 1 "GND" H 7005 3777 50  0000 C CNN
F 2 "" H 7000 3950 50  0001 C CNN
F 3 "" H 7000 3950 50  0001 C CNN
	1    7000 3950
	1    0    0    -1  
$EndComp
Text Label 7000 3350 2    50   ~ 0
PIEZO+
Text Label 7000 3650 2    50   ~ 0
PIEZO-
Text Label 5500 2500 0    50   ~ 0
PIEZO+
Text Label 5800 2200 0    50   ~ 0
PIEZO-
Text Label 5500 2300 0    50   ~ 0
OUT
Text Label 5500 2700 0    50   ~ 0
DW
$Comp
L Device:C_Small C1
U 1 1 5EF4B09A
P 7000 3850
F 0 "C1" H 7092 3896 50  0000 L CNN
F 1 "10u" H 7092 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7000 3850 50  0001 C CNN
F 3 "~" H 7000 3850 50  0001 C CNN
	1    7000 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5EFB8AF6
P 5700 2200
F 0 "R3" V 5896 2200 50  0000 C CNN
F 1 "22k" V 5805 2200 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5700 2200 50  0001 C CNN
F 3 "~" H 5700 2200 50  0001 C CNN
	1    5700 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5500 2200 5600 2200
Text Label 5500 2600 0    50   ~ 0
PIEZO-
Wire Wire Line
	7000 3550 7000 3750
$EndSCHEMATC
