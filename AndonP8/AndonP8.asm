
_main:

;AndonP8.c,21 :: 		void main(){
;AndonP8.c,24 :: 		NOT_RBPU_BIT = 0;
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;AndonP8.c,26 :: 		TRISB = 0b00001111;
	MOVLW      15
	MOVWF      TRISB+0
;AndonP8.c,28 :: 		PORTB = 0b11110000;
	MOVLW      240
	MOVWF      PORTB+0
;AndonP8.c,30 :: 		TRISC6_bit = 0;
	BCF        TRISC6_bit+0, BitPos(TRISC6_bit+0)
;AndonP8.c,34 :: 		init_mp3();
	CALL       _init_mp3+0
;AndonP8.c,35 :: 		mp3_stop();
	CALL       _mp3_stop+0
;AndonP8.c,38 :: 		mp3_volumen_x(10);
	MOVLW      10
	MOVWF      FARG_mp3_volumen_x_vol+0
	CALL       _mp3_volumen_x+0
;AndonP8.c,40 :: 		while(1){
L_main0:
;AndonP8.c,41 :: 		SPEN_bit = 0;
	BCF        SPEN_bit+0, BitPos(SPEN_bit+0)
;AndonP8.c,42 :: 		RC6_bit = 0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;AndonP8.c,44 :: 		if(Button(&PORTB, RB0, 100, 0)){
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
;AndonP8.c,46 :: 		if((PORTB & 0b11100000) == 0b11100000){
	MOVLW      224
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      224
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;AndonP8.c,47 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;AndonP8.c,49 :: 		LED_rojo = ~LED_rojo;
	MOVLW
	XORWF      RB4_bit+0, 1
;AndonP8.c,52 :: 		if(!LED_rojo){
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main4
;AndonP8.c,54 :: 		mp3_play_x(1);
	MOVLW      1
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP8.c,56 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP8.c,57 :: 		}
	GOTO       L_main5
L_main4:
;AndonP8.c,62 :: 		mp3_stop();
	CALL       _mp3_stop+0
;AndonP8.c,63 :: 		}
L_main5:
;AndonP8.c,64 :: 		SPEN_bit = 0;
	BCF        SPEN_bit+0, BitPos(SPEN_bit+0)
;AndonP8.c,65 :: 		RC6_bit = 0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;AndonP8.c,66 :: 		}
L_main3:
;AndonP8.c,68 :: 		while(BTN_rojo == 0);
L_main6:
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;AndonP8.c,69 :: 		}
L_main2:
;AndonP8.c,70 :: 		if(Button(&PORTB, RB1, 100, 0)){
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
;AndonP8.c,71 :: 		if((PORTB & 0b11010000) == 0b11010000){
	MOVLW      208
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      208
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;AndonP8.c,72 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;AndonP8.c,73 :: 		LED_amarillo = ~LED_amarillo;
	MOVLW
	XORWF      RB5_bit+0, 1
;AndonP8.c,74 :: 		if(!LED_amarillo){
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main10
;AndonP8.c,75 :: 		mp3_play_x(2);
	MOVLW      2
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP8.c,76 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP8.c,77 :: 		}
	GOTO       L_main11
L_main10:
;AndonP8.c,79 :: 		mp3_stop();
	CALL       _mp3_stop+0
L_main11:
;AndonP8.c,80 :: 		SPEN_bit = 0;
	BCF        SPEN_bit+0, BitPos(SPEN_bit+0)
;AndonP8.c,81 :: 		RC6_bit = 0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;AndonP8.c,82 :: 		}
L_main9:
;AndonP8.c,83 :: 		while(BTN_amarillo == 0);
L_main12:
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main13
	GOTO       L_main12
L_main13:
;AndonP8.c,84 :: 		}
L_main8:
;AndonP8.c,85 :: 		if(Button(&PORTB, RB2, 100, 0)){
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
;AndonP8.c,86 :: 		if((PORTB & 0b10110000) == 0b10110000){
	MOVLW      176
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      176
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;AndonP8.c,87 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;AndonP8.c,88 :: 		LED_azul = ~LED_azul;
	MOVLW
	XORWF      RB6_bit+0, 1
;AndonP8.c,89 :: 		if(!LED_azul){
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_main16
;AndonP8.c,90 :: 		mp3_play_x(3);
	MOVLW      3
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP8.c,91 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP8.c,92 :: 		}
	GOTO       L_main17
L_main16:
;AndonP8.c,94 :: 		mp3_stop();
	CALL       _mp3_stop+0
L_main17:
;AndonP8.c,95 :: 		SPEN_bit = 0;
	BCF        SPEN_bit+0, BitPos(SPEN_bit+0)
;AndonP8.c,96 :: 		RC6_bit = 0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;AndonP8.c,97 :: 		}
L_main15:
;AndonP8.c,98 :: 		while(BTN_azul == 0);
L_main18:
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main19
	GOTO       L_main18
L_main19:
;AndonP8.c,99 :: 		}
L_main14:
;AndonP8.c,100 :: 		if(Button(&PORTB, RB3, 100, 0)){
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
;AndonP8.c,101 :: 		if((PORTB & 0b01110000) == 0b01110000){
	MOVLW      112
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      112
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;AndonP8.c,102 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;AndonP8.c,103 :: 		LED_verde = ~LED_verde;
	MOVLW
	XORWF      RB7_bit+0, 1
;AndonP8.c,104 :: 		if(!LED_verde){
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_main22
;AndonP8.c,105 :: 		mp3_play_x(4);
	MOVLW      4
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP8.c,106 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP8.c,107 :: 		}
	GOTO       L_main23
L_main22:
;AndonP8.c,109 :: 		mp3_stop();
	CALL       _mp3_stop+0
L_main23:
;AndonP8.c,110 :: 		SPEN_bit = 0;
	BCF        SPEN_bit+0, BitPos(SPEN_bit+0)
;AndonP8.c,111 :: 		RC6_bit = 0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;AndonP8.c,112 :: 		}
L_main21:
;AndonP8.c,113 :: 		while(BTN_verde == 0);
L_main24:
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main25
	GOTO       L_main24
L_main25:
;AndonP8.c,114 :: 		}
L_main20:
;AndonP8.c,118 :: 		}
	GOTO       L_main0
;AndonP8.c,119 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
