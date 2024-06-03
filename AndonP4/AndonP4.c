/* Para PIC16F877A */
/* Versión 4*/

//Librería para controlar módulo de audio
#include "mp3_chino.h"

//Definiciones de los pines del puerto B   
#define BTN_rojo RB0_bit
#define BTN_amarillo RB1_bit
#define BTN_azul RB2_bit
#define BTN_verde RB3_bit
#define LED_rojo RB4_bit
#define LED_amarillo RB5_bit
#define LED_azul RB6_bit
#define LED_verde RB7_bit

void init();
void init_TMR0(unsigned int cycles);
void end_TMR0();

void set_rojo();
void set_amarillo();
void set_azul();
void set_verde();

unsigned int counter = 1;
char nivel = 0;

void main(){
	
	init();

    while(1){

		//Botón presionado con 0 lógico en BTN_rojo, 5 ms de debouncing
		if(Button(&PORTB, RB0, 5, 0)){
			if(!((PORTB >> 5) & 0b00000111)){
				set_rojo();
			}
			//No avanza mientras no deje de presionarse el botón
			while(BTN_rojo == 0);
		}
		if(Button(&PORTB, RB1, 5, 0)){
			if(!((PORTB >> 6) & 0b00000011)){
				set_amarillo();
			}
			while(BTN_amarillo == 0);
		}
		if(Button(&PORTB, RB2, 5, 0)){
			if(!((PORTB >> 7) & 0b00000001)){
				set_azul();
			}
			while(BTN_azul == 0);
		}
		if(Button(&PORTB, RB3, 5, 0)){
			set_verde();
			while(BTN_verde == 0);
		}
		
		if(counter == 0){
			if(LED_rojo) set_amarillo();
			else if(LED_amarillo) set_azul();
			else if(LED_azul) set_verde();
		}
    }
}

void init(){
	
	/* Bit 7: activar pull-ups internos en puerto B
	   Bit 5: TMR0 en counter mode
	   Bit 3: prescaler para TMR0
	   Bit 2-0: Ratio de prescaler de TMR0 1:256 */
	OPTION_REG = 0b00100111;
	
	/* Bit 7: habilita interrupciones globalmente
	   Bit 5: deshabilita interrupción de TMR0
	   Bit 2: limpia bandera de interrupción de TMR0 */
	INTCON = 0b10000000;
	
	//Configura entradas en 4 low bits y salidas en 4 high bits
	TRISB = 0b00001111;
	//Salidas en 0 lógico, valor de 4 low bits es indiferente
	PORTB = 0b00000000;
	//Configura pin 6 de puerto C (TX) como salida
	TRISC6_bit = 0;
	
	//Inicializar comunicación con el módulo de audio
	//También inicializa UART en el PIC
	init_mp3();
	//Volumen por default en 30 (máximo) al encender el módulo
	//Usar volumen bajo cuando se alimente por USB
	//mp3_volumen_x(10);
}

void init_TMR0(unsigned int cycles){
	//TMR0 en timer mode
	OPTION_REG.B5 = 0;
	
	//Habilita interrupción de TMR0
	T0IE_bit = 1;
	
	//15 ciclos equivalen a un segundo con el prescaler 1:256
	counter = cycles;
	
	
}

void interrupt(){
	counter--;
	T0IF_bit = 0;
}

void end_TMR0(){
	//TMR0 en counter mode
	OPTION_REG.B5 = 1;
	
	//Deshabilita interrupción de TMR0
	T0IE_bit = 0;
}

void set_rojo(){
	//Cambia la salida correspondiente
	LED_rojo = ~LED_rojo;
	
	//Si se encendió la alarma
	if(LED_rojo){
		//init_TMR0(9000);
		init_TMR0(75);
		//Se reproduce la canción correspondiente
		mp3_play_x(1);
		//Establece repetición continua de la canción
		mp3_single_repeat(0);
	}
	
	//Si se apagó la alarma
	else{
		end_TMR0();
		
		//Se da stop a la reproducción
		mp3_stop();
	}
}

void set_amarillo(){
	PORTB = PORTB & 0b11101111;
	LED_amarillo = ~LED_amarillo;
	if(LED_amarillo){
		//init_TMR0(18000);
		init_TMR0(75);
		mp3_play_x(2);
		mp3_single_repeat(0);
	}
	else{
		end_TMR0();
		mp3_stop();
	}
}

void set_azul(){
	PORTB = PORTB & 0b11001111;
	LED_azul = ~LED_azul;
	if(LED_azul){
		//init_TMR0(13500);
		init_TMR0(75);
		mp3_play_x(3);
		mp3_single_repeat(0);
	}
	else{
		end_TMR0();
		mp3_stop();
	}
}

void set_verde(){
	PORTB = PORTB & 0b10001111;
	LED_verde = ~LED_verde;
	if(LED_verde){
		end_TMR0();
		mp3_play_x(4);
		mp3_single_repeat(0);
	}
	else
		mp3_stop();
}