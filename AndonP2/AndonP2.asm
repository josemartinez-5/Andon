
_main:

;AndonP2.c,16 :: 		void main() {
;AndonP2.c,17 :: 		NOT_RBPU_BIT = 0;          //Activar pull-up interno después de Power-On Reset
	BCF         NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0) 
;AndonP2.c,18 :: 		TRISB = 0b00001111;        //Configura entradas en 4 low bits y salidas en 4 high bits
	MOVLW       15
	MOVWF       TRISB+0 
;AndonP2.c,19 :: 		PORTB = 0b00000000;        //Salidas en 0 lógico, valor de 4 low bits es indiferente
	CLRF        PORTB+0 
;AndonP2.c,21 :: 		while(1){
L_main0:
;AndonP2.c,22 :: 		if(Button(&PORTB, 0, 5, 0)){             //Botón presionado con 0 lógico en pin 0 de PORTB
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       5
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;AndonP2.c,23 :: 		RB4_bit = ~RB4_bit;           //Cambia la salida correspondiente
	BTG         RB4_bit+0, BitPos(RB4_bit+0) 
;AndonP2.c,24 :: 		while(RB0_bit == 0);          //No avanza mientras no deje de presionarse el botón
L_main3:
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main4
	GOTO        L_main3
L_main4:
;AndonP2.c,25 :: 		}
L_main2:
;AndonP2.c,26 :: 		if(Button(&PORTB, 1, 5, 0)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       5
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
;AndonP2.c,27 :: 		RB5_bit = ~RB5_bit;
	BTG         RB5_bit+0, BitPos(RB5_bit+0) 
;AndonP2.c,28 :: 		while(RB1_bit == 0);
L_main6:
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main7
	GOTO        L_main6
L_main7:
;AndonP2.c,29 :: 		}
L_main5:
;AndonP2.c,30 :: 		if(Button(&PORTB, 2, 5, 0)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       2
	MOVWF       FARG_Button_pin+0 
	MOVLW       5
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
;AndonP2.c,31 :: 		RB6_bit = ~RB6_bit;
	BTG         RB6_bit+0, BitPos(RB6_bit+0) 
;AndonP2.c,32 :: 		while(RB2_bit == 0);
L_main9:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main10
	GOTO        L_main9
L_main10:
;AndonP2.c,33 :: 		}
L_main8:
;AndonP2.c,34 :: 		if(Button(&PORTB, 3, 5, 0)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       3
	MOVWF       FARG_Button_pin+0 
	MOVLW       5
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
;AndonP2.c,35 :: 		RB7_bit = ~RB7_bit;
	BTG         RB7_bit+0, BitPos(RB7_bit+0) 
;AndonP2.c,36 :: 		while(RB3_bit == 0);
L_main12:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main13
	GOTO        L_main12
L_main13:
;AndonP2.c,37 :: 		}
L_main11:
;AndonP2.c,38 :: 		}
	GOTO        L_main0
;AndonP2.c,39 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
