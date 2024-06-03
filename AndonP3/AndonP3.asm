
_main:

;AndonP3.c,17 :: 		void main(){
;AndonP3.c,20 :: 		NOT_RBPU_BIT = 0;
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;AndonP3.c,22 :: 		TRISB = 0b00001111;
	MOVLW      15
	MOVWF      TRISB+0
;AndonP3.c,24 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;AndonP3.c,26 :: 		TRISC6_bit = 0;
	BCF        TRISC6_bit+0, BitPos(TRISC6_bit+0)
;AndonP3.c,30 :: 		init_mp3();
	CALL       _init_mp3+0
;AndonP3.c,35 :: 		while(1){
L_main0:
;AndonP3.c,38 :: 		if(Button(&PORTB, RB0, 100, 0)){
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
;AndonP3.c,39 :: 		if(!(PORTB & 0b11100000)){
	MOVLW      224
	ANDWF      PORTB+0, 0
	MOVWF      R0+0
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;AndonP3.c,42 :: 		LED_rojo = ~LED_rojo;
	MOVLW
	XORWF      RB4_bit+0, 1
;AndonP3.c,45 :: 		if(LED_rojo){
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main4
;AndonP3.c,47 :: 		mp3_play_x(1);
	MOVLW      1
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP3.c,49 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP3.c,50 :: 		}
	GOTO       L_main5
L_main4:
;AndonP3.c,55 :: 		mp3_stop();
	CALL       _mp3_stop+0
;AndonP3.c,57 :: 		}
L_main5:
;AndonP3.c,58 :: 		}
L_main3:
;AndonP3.c,60 :: 		while(BTN_rojo == 0);
L_main6:
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;AndonP3.c,61 :: 		}
L_main2:
;AndonP3.c,62 :: 		if(Button(&PORTB, RB1, 100, 0)){
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
;AndonP3.c,63 :: 		if(!(PORTB & 0b11010000)){
	MOVLW      208
	ANDWF      PORTB+0, 0
	MOVWF      R0+0
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;AndonP3.c,64 :: 		LED_amarillo = ~LED_amarillo;
	MOVLW
	XORWF      RB5_bit+0, 1
;AndonP3.c,65 :: 		if(LED_amarillo){
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main10
;AndonP3.c,66 :: 		mp3_play_x(2);
	MOVLW      2
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP3.c,67 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP3.c,68 :: 		}
	GOTO       L_main11
L_main10:
;AndonP3.c,70 :: 		mp3_stop();
	CALL       _mp3_stop+0
L_main11:
;AndonP3.c,72 :: 		}
L_main9:
;AndonP3.c,73 :: 		while(BTN_amarillo == 0);
L_main12:
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main13
	GOTO       L_main12
L_main13:
;AndonP3.c,74 :: 		}
L_main8:
;AndonP3.c,75 :: 		if(Button(&PORTB, RB2, 100, 0)){
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
;AndonP3.c,76 :: 		if(!(PORTB & 0b10110000)){
	MOVLW      176
	ANDWF      PORTB+0, 0
	MOVWF      R0+0
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;AndonP3.c,77 :: 		LED_azul = ~LED_azul;
	MOVLW
	XORWF      RB6_bit+0, 1
;AndonP3.c,78 :: 		if(LED_azul){
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_main16
;AndonP3.c,79 :: 		mp3_play_x(3);
	MOVLW      3
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP3.c,80 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP3.c,81 :: 		}
	GOTO       L_main17
L_main16:
;AndonP3.c,83 :: 		mp3_stop();
	CALL       _mp3_stop+0
L_main17:
;AndonP3.c,85 :: 		}
L_main15:
;AndonP3.c,86 :: 		while(BTN_azul == 0);
L_main18:
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main19
	GOTO       L_main18
L_main19:
;AndonP3.c,87 :: 		}
L_main14:
;AndonP3.c,88 :: 		if(Button(&PORTB, RB3, 100, 0)){
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
;AndonP3.c,89 :: 		if(!(PORTB & 0b01110000)){
	MOVLW      112
	ANDWF      PORTB+0, 0
	MOVWF      R0+0
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;AndonP3.c,90 :: 		LED_verde = ~LED_verde;
	MOVLW
	XORWF      RB7_bit+0, 1
;AndonP3.c,91 :: 		if(LED_verde){
	BTFSS      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_main22
;AndonP3.c,92 :: 		mp3_play_x(4);
	MOVLW      4
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP3.c,93 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP3.c,94 :: 		}
	GOTO       L_main23
L_main22:
;AndonP3.c,96 :: 		mp3_stop();
	CALL       _mp3_stop+0
L_main23:
;AndonP3.c,98 :: 		}
L_main21:
;AndonP3.c,99 :: 		while(BTN_verde == 0);
L_main24:
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main25
	GOTO       L_main24
L_main25:
;AndonP3.c,100 :: 		}
L_main20:
;AndonP3.c,101 :: 		}
	GOTO       L_main0
;AndonP3.c,102 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
