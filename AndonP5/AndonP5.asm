
_main:

;AndonP5.c,21 :: 		void main(){
;AndonP5.c,24 :: 		NOT_RBPU_BIT = 0;
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;AndonP5.c,26 :: 		TRISB = 0b00001111;
	MOVLW      15
	MOVWF      TRISB+0
;AndonP5.c,28 :: 		PORTB = 0b11110000;
	MOVLW      240
	MOVWF      PORTB+0
;AndonP5.c,30 :: 		TRISC6_bit = 0;
	BCF        TRISC6_bit+0, BitPos(TRISC6_bit+0)
;AndonP5.c,34 :: 		init_mp3();
	CALL       _init_mp3+0
;AndonP5.c,35 :: 		mp3_stop();
	CALL       _mp3_stop+0
;AndonP5.c,38 :: 		mp3_volumen_x(10);
	MOVLW      10
	MOVWF      FARG_mp3_volumen_x_vol+0
	CALL       _mp3_volumen_x+0
;AndonP5.c,40 :: 		while(1){
L_main0:
;AndonP5.c,43 :: 		if(Button(&PORTB, RB0, 100, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;AndonP5.c,45 :: 		if((PORTB & 0b11100000) == 0b11100000){
	MOVLW      224
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      224
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;AndonP5.c,48 :: 		LED_rojo = ~LED_rojo;
	MOVLW
	XORWF      RB4_bit+0, 1
;AndonP5.c,51 :: 		if(!LED_rojo){
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main4
;AndonP5.c,53 :: 		mp3_play_x(1);
	MOVLW      1
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP5.c,55 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP5.c,56 :: 		}
	GOTO       L_main5
L_main4:
;AndonP5.c,61 :: 		mp3_stop();
	CALL       _mp3_stop+0
;AndonP5.c,62 :: 		}
L_main5:
;AndonP5.c,63 :: 		}
L_main3:
;AndonP5.c,65 :: 		while(BTN_rojo == 0);
L_main6:
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;AndonP5.c,66 :: 		}
L_main2:
;AndonP5.c,67 :: 		if(Button(&PORTB, RB1, 100, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
;AndonP5.c,68 :: 		if((PORTB & 0b11010000) == 0b11010000){
	MOVLW      208
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      208
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;AndonP5.c,69 :: 		LED_amarillo = ~LED_amarillo;
	MOVLW
	XORWF      RB5_bit+0, 1
;AndonP5.c,70 :: 		if(!LED_amarillo){
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main10
;AndonP5.c,71 :: 		mp3_play_x(2);
	MOVLW      2
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP5.c,72 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP5.c,73 :: 		}
	GOTO       L_main11
L_main10:
;AndonP5.c,75 :: 		mp3_stop();
	CALL       _mp3_stop+0
L_main11:
;AndonP5.c,76 :: 		}
L_main9:
;AndonP5.c,77 :: 		while(BTN_amarillo == 0);
L_main12:
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main13
	GOTO       L_main12
L_main13:
;AndonP5.c,78 :: 		}
L_main8:
;AndonP5.c,79 :: 		if(Button(&PORTB, RB2, 100, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main14
;AndonP5.c,80 :: 		if((PORTB & 0b10110000) == 0b10110000){
	MOVLW      176
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      176
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;AndonP5.c,81 :: 		LED_azul = ~LED_azul;
	MOVLW
	XORWF      RB6_bit+0, 1
;AndonP5.c,82 :: 		if(!LED_azul){
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_main16
;AndonP5.c,83 :: 		mp3_play_x(3);
	MOVLW      3
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP5.c,84 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP5.c,85 :: 		}
	GOTO       L_main17
L_main16:
;AndonP5.c,87 :: 		mp3_stop();
	CALL       _mp3_stop+0
L_main17:
;AndonP5.c,88 :: 		}
L_main15:
;AndonP5.c,89 :: 		while(BTN_azul == 0);
L_main18:
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main19
	GOTO       L_main18
L_main19:
;AndonP5.c,90 :: 		}
L_main14:
;AndonP5.c,91 :: 		if(Button(&PORTB, RB3, 100, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      3
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main20
;AndonP5.c,92 :: 		if((PORTB & 0b01110000) == 0b01110000){
	MOVLW      112
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      112
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;AndonP5.c,93 :: 		LED_verde = ~LED_verde;
	MOVLW
	XORWF      RB7_bit+0, 1
;AndonP5.c,94 :: 		if(!LED_verde){
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_main22
;AndonP5.c,95 :: 		mp3_play_x(4);
	MOVLW      4
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP5.c,96 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP5.c,97 :: 		}
	GOTO       L_main23
L_main22:
;AndonP5.c,99 :: 		mp3_stop();
	CALL       _mp3_stop+0
L_main23:
;AndonP5.c,100 :: 		}
L_main21:
;AndonP5.c,101 :: 		while(BTN_verde == 0);
L_main24:
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main25
	GOTO       L_main24
L_main25:
;AndonP5.c,102 :: 		}
L_main20:
;AndonP5.c,106 :: 		}
	GOTO       L_main0
;AndonP5.c,107 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
