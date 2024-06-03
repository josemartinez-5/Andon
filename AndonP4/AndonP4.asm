
_main:

;AndonP4.c,29 :: 		void main(){
;AndonP4.c,31 :: 		init();
	CALL       _init+0
;AndonP4.c,33 :: 		while(1){
L_main0:
;AndonP4.c,36 :: 		if(Button(&PORTB, RB0, 5, 0)){
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
;AndonP4.c,37 :: 		if(!((PORTB >> 5) & 0b00000111)){
	MOVLW      5
	MOVWF      R1+0
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main32:
	BTFSC      STATUS+0, 2
	GOTO       L__main33
	RRF        R0+0, 1
	BCF        R0+0, 7
	ADDLW      255
	GOTO       L__main32
L__main33:
	MOVLW      7
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;AndonP4.c,38 :: 		set_rojo();
	CALL       _set_rojo+0
;AndonP4.c,39 :: 		}
L_main3:
;AndonP4.c,41 :: 		while(BTN_rojo == 0);
L_main4:
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main5
	GOTO       L_main4
L_main5:
;AndonP4.c,42 :: 		}
L_main2:
;AndonP4.c,43 :: 		if(Button(&PORTB, RB1, 5, 0)){
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
	GOTO       L_main6
;AndonP4.c,44 :: 		if(!((PORTB >> 6) & 0b00000011)){
	MOVLW      6
	MOVWF      R1+0
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main34:
	BTFSC      STATUS+0, 2
	GOTO       L__main35
	RRF        R0+0, 1
	BCF        R0+0, 7
	ADDLW      255
	GOTO       L__main34
L__main35:
	MOVLW      3
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;AndonP4.c,45 :: 		set_amarillo();
	CALL       _set_amarillo+0
;AndonP4.c,46 :: 		}
L_main7:
;AndonP4.c,47 :: 		while(BTN_amarillo == 0);
L_main8:
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main9
	GOTO       L_main8
L_main9:
;AndonP4.c,48 :: 		}
L_main6:
;AndonP4.c,49 :: 		if(Button(&PORTB, RB2, 5, 0)){
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
	GOTO       L_main10
;AndonP4.c,50 :: 		if(!((PORTB >> 7) & 0b00000001)){
	MOVLW      7
	MOVWF      R0+0
	MOVF       PORTB+0, 0
	MOVWF      R1+0
	MOVF       R0+0, 0
L__main36:
	BTFSC      STATUS+0, 2
	GOTO       L__main37
	RRF        R1+0, 1
	BCF        R1+0, 7
	ADDLW      255
	GOTO       L__main36
L__main37:
	BTFSC      R1+0, 0
	GOTO       L_main11
;AndonP4.c,51 :: 		set_azul();
	CALL       _set_azul+0
;AndonP4.c,52 :: 		}
L_main11:
;AndonP4.c,53 :: 		while(BTN_azul == 0);
L_main12:
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main13
	GOTO       L_main12
L_main13:
;AndonP4.c,54 :: 		}
L_main10:
;AndonP4.c,55 :: 		if(Button(&PORTB, RB3, 5, 0)){
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
	GOTO       L_main14
;AndonP4.c,56 :: 		set_verde();
	CALL       _set_verde+0
;AndonP4.c,57 :: 		while(BTN_verde == 0);
L_main15:
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main16
	GOTO       L_main15
L_main16:
;AndonP4.c,58 :: 		}
L_main14:
;AndonP4.c,60 :: 		if(counter == 0){
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVLW      0
	XORWF      _counter+0, 0
L__main38:
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;AndonP4.c,61 :: 		if(LED_rojo) set_amarillo();
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main18
	CALL       _set_amarillo+0
	GOTO       L_main19
L_main18:
;AndonP4.c,62 :: 		else if(LED_amarillo) set_azul();
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main20
	CALL       _set_azul+0
	GOTO       L_main21
L_main20:
;AndonP4.c,63 :: 		else if(LED_azul) set_verde();
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_main22
	CALL       _set_verde+0
L_main22:
L_main21:
L_main19:
;AndonP4.c,64 :: 		}
L_main17:
;AndonP4.c,65 :: 		}
	GOTO       L_main0
;AndonP4.c,66 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_init:

;AndonP4.c,68 :: 		void init(){
;AndonP4.c,74 :: 		OPTION_REG = 0b00100111;
	MOVLW      39
	MOVWF      OPTION_REG+0
;AndonP4.c,79 :: 		INTCON = 0b10000000;
	MOVLW      128
	MOVWF      INTCON+0
;AndonP4.c,82 :: 		TRISB = 0b00001111;
	MOVLW      15
	MOVWF      TRISB+0
;AndonP4.c,84 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;AndonP4.c,86 :: 		TRISC6_bit = 0;
	BCF        TRISC6_bit+0, BitPos(TRISC6_bit+0)
;AndonP4.c,90 :: 		init_mp3();
	CALL       _init_mp3+0
;AndonP4.c,94 :: 		}
L_end_init:
	RETURN
; end of _init

_init_TMR0:

;AndonP4.c,96 :: 		void init_TMR0(unsigned int cycles){
;AndonP4.c,98 :: 		OPTION_REG.B5 = 0;
	BCF        OPTION_REG+0, 5
;AndonP4.c,101 :: 		T0IE_bit = 1;
	BSF        T0IE_bit+0, BitPos(T0IE_bit+0)
;AndonP4.c,104 :: 		counter = cycles;
	MOVF       FARG_init_TMR0_cycles+0, 0
	MOVWF      _counter+0
	MOVF       FARG_init_TMR0_cycles+1, 0
	MOVWF      _counter+1
;AndonP4.c,107 :: 		}
L_end_init_TMR0:
	RETURN
; end of _init_TMR0

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;AndonP4.c,109 :: 		void interrupt(){
;AndonP4.c,110 :: 		counter--;
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
;AndonP4.c,111 :: 		T0IF_bit = 0;
	BCF        T0IF_bit+0, BitPos(T0IF_bit+0)
;AndonP4.c,112 :: 		}
L_end_interrupt:
L__interrupt42:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_end_TMR0:

;AndonP4.c,114 :: 		void end_TMR0(){
;AndonP4.c,116 :: 		OPTION_REG.B5 = 1;
	BSF        OPTION_REG+0, 5
;AndonP4.c,119 :: 		T0IE_bit = 0;
	BCF        T0IE_bit+0, BitPos(T0IE_bit+0)
;AndonP4.c,120 :: 		}
L_end_end_TMR0:
	RETURN
; end of _end_TMR0

_set_rojo:

;AndonP4.c,122 :: 		void set_rojo(){
;AndonP4.c,124 :: 		LED_rojo = ~LED_rojo;
	MOVLW
	XORWF      RB4_bit+0, 1
;AndonP4.c,127 :: 		if(LED_rojo){
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_set_rojo23
;AndonP4.c,129 :: 		init_TMR0(75);
	MOVLW      75
	MOVWF      FARG_init_TMR0_cycles+0
	MOVLW      0
	MOVWF      FARG_init_TMR0_cycles+1
	CALL       _init_TMR0+0
;AndonP4.c,131 :: 		mp3_play_x(1);
	MOVLW      1
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP4.c,133 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP4.c,134 :: 		}
	GOTO       L_set_rojo24
L_set_rojo23:
;AndonP4.c,138 :: 		end_TMR0();
	CALL       _end_TMR0+0
;AndonP4.c,141 :: 		mp3_stop();
	CALL       _mp3_stop+0
;AndonP4.c,142 :: 		}
L_set_rojo24:
;AndonP4.c,143 :: 		}
L_end_set_rojo:
	RETURN
; end of _set_rojo

_set_amarillo:

;AndonP4.c,145 :: 		void set_amarillo(){
;AndonP4.c,146 :: 		PORTB = PORTB & 0b11101111;
	MOVLW      239
	ANDWF      PORTB+0, 1
;AndonP4.c,147 :: 		LED_amarillo = ~LED_amarillo;
	MOVLW
	XORWF      RB5_bit+0, 1
;AndonP4.c,148 :: 		if(LED_amarillo){
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_set_amarillo25
;AndonP4.c,150 :: 		init_TMR0(75);
	MOVLW      75
	MOVWF      FARG_init_TMR0_cycles+0
	MOVLW      0
	MOVWF      FARG_init_TMR0_cycles+1
	CALL       _init_TMR0+0
;AndonP4.c,151 :: 		mp3_play_x(2);
	MOVLW      2
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP4.c,152 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP4.c,153 :: 		}
	GOTO       L_set_amarillo26
L_set_amarillo25:
;AndonP4.c,155 :: 		end_TMR0();
	CALL       _end_TMR0+0
;AndonP4.c,156 :: 		mp3_stop();
	CALL       _mp3_stop+0
;AndonP4.c,157 :: 		}
L_set_amarillo26:
;AndonP4.c,158 :: 		}
L_end_set_amarillo:
	RETURN
; end of _set_amarillo

_set_azul:

;AndonP4.c,160 :: 		void set_azul(){
;AndonP4.c,161 :: 		PORTB = PORTB & 0b11001111;
	MOVLW      207
	ANDWF      PORTB+0, 1
;AndonP4.c,162 :: 		LED_azul = ~LED_azul;
	MOVLW
	XORWF      RB6_bit+0, 1
;AndonP4.c,163 :: 		if(LED_azul){
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_set_azul27
;AndonP4.c,165 :: 		init_TMR0(75);
	MOVLW      75
	MOVWF      FARG_init_TMR0_cycles+0
	MOVLW      0
	MOVWF      FARG_init_TMR0_cycles+1
	CALL       _init_TMR0+0
;AndonP4.c,166 :: 		mp3_play_x(3);
	MOVLW      3
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP4.c,167 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP4.c,168 :: 		}
	GOTO       L_set_azul28
L_set_azul27:
;AndonP4.c,170 :: 		end_TMR0();
	CALL       _end_TMR0+0
;AndonP4.c,171 :: 		mp3_stop();
	CALL       _mp3_stop+0
;AndonP4.c,172 :: 		}
L_set_azul28:
;AndonP4.c,173 :: 		}
L_end_set_azul:
	RETURN
; end of _set_azul

_set_verde:

;AndonP4.c,175 :: 		void set_verde(){
;AndonP4.c,176 :: 		PORTB = PORTB & 0b10001111;
	MOVLW      143
	ANDWF      PORTB+0, 1
;AndonP4.c,177 :: 		LED_verde = ~LED_verde;
	MOVLW
	XORWF      RB7_bit+0, 1
;AndonP4.c,178 :: 		if(LED_verde){
	BTFSS      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_set_verde29
;AndonP4.c,179 :: 		end_TMR0();
	CALL       _end_TMR0+0
;AndonP4.c,180 :: 		mp3_play_x(4);
	MOVLW      4
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;AndonP4.c,181 :: 		mp3_single_repeat(0);
	CLRF       FARG_mp3_single_repeat_status+0
	CLRF       FARG_mp3_single_repeat_status+1
	CALL       _mp3_single_repeat+0
;AndonP4.c,182 :: 		}
	GOTO       L_set_verde30
L_set_verde29:
;AndonP4.c,184 :: 		mp3_stop();
	CALL       _mp3_stop+0
L_set_verde30:
;AndonP4.c,185 :: 		}
L_end_set_verde:
	RETURN
; end of _set_verde
