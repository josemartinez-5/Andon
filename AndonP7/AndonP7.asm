
_main:

;AndonP7.c,23 :: 		void main(){
;AndonP7.c,25 :: 		NOT_RBPU_BIT = 0;
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;AndonP7.c,27 :: 		TRISB = 0b11110000;
	MOVLW      240
	MOVWF      TRISB+0
;AndonP7.c,29 :: 		PORTB = 0b00001111;
	MOVLW      15
	MOVWF      PORTB+0
;AndonP7.c,31 :: 		TRISC6_bit = 0;
	BCF        TRISC6_bit+0, BitPos(TRISC6_bit+0)
;AndonP7.c,35 :: 		init_mp3();
	CALL       _init_mp3+0
;AndonP7.c,36 :: 		mp3_stop();
	CALL       _mp3_stop+0
;AndonP7.c,39 :: 		mp3_volumen_x(10);
	MOVLW      10
	MOVWF      FARG_mp3_volumen_x_vol+0
	CALL       _mp3_volumen_x+0
;AndonP7.c,41 :: 		INTCON = 0b10001000;
	MOVLW      136
	MOVWF      INTCON+0
;AndonP7.c,43 :: 		while(1){
L_main0:
;AndonP7.c,44 :: 		SPEN_bit = 0;
	BCF        SPEN_bit+0, BitPos(SPEN_bit+0)
;AndonP7.c,45 :: 		RC6_bit = 0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;AndonP7.c,47 :: 		sleep
	SLEEP
;AndonP7.c,48 :: 		nop
	NOP
;AndonP7.c,50 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;AndonP7.c,51 :: 		INTCON = 0;
	CLRF       INTCON+0
;AndonP7.c,53 :: 		if(Button(&PORTB, RB4, 100, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      4
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;AndonP7.c,55 :: 		if((PORTB & 0b00001110) == 0b00001110){
	MOVLW      14
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;AndonP7.c,58 :: 		LED_rojo = ~LED_rojo;
	MOVLW
	XORWF      RB0_bit+0, 1
;AndonP7.c,61 :: 		if(!LED_rojo){
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main4
;AndonP7.c,63 :: 		mp3_play_x(1);
	MOVLW      1
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP7.c,65 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP7.c,66 :: 		}
	GOTO       L_main5
L_main4:
;AndonP7.c,71 :: 		mp3_stop();
	CALL       _mp3_stop+0
;AndonP7.c,72 :: 		}
L_main5:
;AndonP7.c,73 :: 		}
L_main3:
;AndonP7.c,75 :: 		while(BTN_rojo == 0);
L_main6:
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;AndonP7.c,76 :: 		}
L_main2:
;AndonP7.c,77 :: 		if(Button(&PORTB, RB5, 100, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      5
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
;AndonP7.c,78 :: 		if((PORTB & 0b00001101) == 0b00001101){
	MOVLW      13
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;AndonP7.c,79 :: 		LED_amarillo = ~LED_amarillo;
	MOVLW
	XORWF      RB1_bit+0, 1
;AndonP7.c,80 :: 		if(!LED_amarillo){
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main10
;AndonP7.c,81 :: 		mp3_play_x(2);
	MOVLW      2
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP7.c,82 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP7.c,83 :: 		}
	GOTO       L_main11
L_main10:
;AndonP7.c,85 :: 		mp3_stop();
	CALL       _mp3_stop+0
L_main11:
;AndonP7.c,86 :: 		}
L_main9:
;AndonP7.c,87 :: 		while(BTN_amarillo == 0);
L_main12:
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main13
	GOTO       L_main12
L_main13:
;AndonP7.c,88 :: 		}
L_main8:
;AndonP7.c,89 :: 		if(Button(&PORTB, RB6, 100, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      6
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main14
;AndonP7.c,90 :: 		if((PORTB & 0b00001011) == 0b00001011){
	MOVLW      11
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;AndonP7.c,91 :: 		LED_azul = ~LED_azul;
	MOVLW
	XORWF      RB2_bit+0, 1
;AndonP7.c,92 :: 		if(!LED_azul){
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main16
;AndonP7.c,93 :: 		mp3_play_x(3);
	MOVLW      3
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP7.c,94 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP7.c,95 :: 		}
	GOTO       L_main17
L_main16:
;AndonP7.c,97 :: 		mp3_stop();
	CALL       _mp3_stop+0
L_main17:
;AndonP7.c,98 :: 		}
L_main15:
;AndonP7.c,99 :: 		while(BTN_azul == 0);
L_main18:
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_main19
	GOTO       L_main18
L_main19:
;AndonP7.c,100 :: 		}
L_main14:
;AndonP7.c,101 :: 		if(Button(&PORTB, RB7, 100, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      7
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main20
;AndonP7.c,102 :: 		if((PORTB & 0b00000111) == 0b00000111){
	MOVLW      7
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;AndonP7.c,103 :: 		LED_verde = ~LED_verde;
	MOVLW
	XORWF      RB3_bit+0, 1
;AndonP7.c,104 :: 		if(!LED_verde){
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main22
;AndonP7.c,105 :: 		mp3_play_x(4);
	MOVLW      4
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP7.c,106 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP7.c,107 :: 		}
	GOTO       L_main23
L_main22:
;AndonP7.c,109 :: 		mp3_stop();
	CALL       _mp3_stop+0
L_main23:
;AndonP7.c,110 :: 		}
L_main21:
;AndonP7.c,111 :: 		while(BTN_verde == 0);
L_main24:
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_main25
	GOTO       L_main24
L_main25:
;AndonP7.c,112 :: 		}
L_main20:
;AndonP7.c,113 :: 		temp = PORTB;
	MOVF       PORTB+0, 0
	MOVWF      _temp+0
;AndonP7.c,114 :: 		INTCON = 0b10001000;
	MOVLW      136
	MOVWF      INTCON+0
;AndonP7.c,118 :: 		}
	GOTO       L_main0
;AndonP7.c,119 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;AndonP7.c,121 :: 		void interrupt(){
;AndonP7.c,122 :: 		temp = PORTB;
	MOVF       PORTB+0, 0
	MOVWF      _temp+0
;AndonP7.c,123 :: 		RBIF_bit = 0;
	BCF        RBIF_bit+0, BitPos(RBIF_bit+0)
;AndonP7.c,124 :: 		}
L_end_interrupt:
L__interrupt28:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
