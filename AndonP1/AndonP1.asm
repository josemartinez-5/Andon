
_main:

;AndonP1.c,17 :: 		void main() {
;AndonP1.c,20 :: 		NOT_RBPU_BIT = 0;
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;AndonP1.c,22 :: 		TRISB = 0b00001111;
	MOVLW      15
	MOVWF      TRISB+0
;AndonP1.c,24 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;AndonP1.c,26 :: 		while(1){
L_main0:
;AndonP1.c,29 :: 		if(Button(&PORTB, 0, 5, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      5
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;AndonP1.c,32 :: 		RB4_bit = ~RB4_bit;
	MOVLW
	XORWF      RB4_bit+0, 1
;AndonP1.c,35 :: 		while(RB0_bit == 0);
L_main3:
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main4
	GOTO       L_main3
L_main4:
;AndonP1.c,36 :: 		}
L_main2:
;AndonP1.c,37 :: 		if(Button(&PORTB, 1, 5, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      5
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;AndonP1.c,38 :: 		RB5_bit = ~RB5_bit;
	MOVLW
	XORWF      RB5_bit+0, 1
;AndonP1.c,39 :: 		while(RB1_bit == 0);
L_main6:
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;AndonP1.c,40 :: 		}
L_main5:
;AndonP1.c,41 :: 		if(Button(&PORTB, 2, 5, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      5
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
;AndonP1.c,42 :: 		RB6_bit = ~RB6_bit;
	MOVLW
	XORWF      RB6_bit+0, 1
;AndonP1.c,43 :: 		while(RB2_bit == 0);
L_main9:
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main10
	GOTO       L_main9
L_main10:
;AndonP1.c,44 :: 		}
L_main8:
;AndonP1.c,45 :: 		if(Button(&PORTB, 3, 5, 0)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      3
	MOVWF      FARG_Button_pin+0
	MOVLW      5
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
;AndonP1.c,46 :: 		RB7_bit = ~RB7_bit;
	MOVLW
	XORWF      RB7_bit+0, 1
;AndonP1.c,47 :: 		while(RB3_bit == 0);
L_main12:
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main13
	GOTO       L_main12
L_main13:
;AndonP1.c,48 :: 		}
L_main11:
;AndonP1.c,49 :: 		}
	GOTO       L_main0
;AndonP1.c,50 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
