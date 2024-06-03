/* Para PIC16F877A */
/* Versión 3*/

/* Cambios respecto a versión anterior...
/* 		Funcionamiento a partir de una interrupción por cambio en el puerto B
*/

//Librería para controlar módulo de audio
#include "mp3_chino.h"

//Definiciones de los pines del puerto B   
#define BTN_rojo 		RB4_bit
#define BTN_amarillo	RB5_bit
#define BTN_azul		RB6_bit
#define BTN_verde		RB7_bit
#define LED_rojo 		RB0_bit
#define LED_amarillo	RB1_bit
#define LED_azul		RB2_bit
#define LED_verde		RB3_bit

unsigned short temp;

void main(){
	//Activar pull-up interno después de Power-On Reset        
	NOT_RBPU_BIT = 0;
	//Configura entradas en 4 low bits y salidas en 4 high bits
	TRISB = 0b11110000;
	//Salidas en 1 lógico, valor de 4 high bits es indiferente
	PORTB = 0b00001111;
	//Configura pin 6 de puerto C (TX) como salida
	TRISC6_bit = 0;
	
	//Inicializar comunicación con el módulo de audio
	//También inicializa UART en el PIC
	init_mp3();
	mp3_stop();
	//Volumen por default en 30 (máximo) al encender el módulo
	//Usar volumen bajo cuando se alimente por USB
	mp3_volumen_x(10);
	
	INTCON = 0b10001000;

    while(1){
		asm{
			sleep
			nop
		}
		INTCON = 0;
		//Botón presionado con 0 lógico en BTN_rojo, 5 ms de debouncing
		if(Button(&PORTB, RB4, 100, 0)){
			//Si los otros LEDs están apagados (salidas en 1 lógico)...
			if((PORTB & 0b00001110) == 0b00001110){
							
				//Cambia la salida correspondiente
				LED_rojo = ~LED_rojo;
				
				//Si se encendió la alarma
				if(!LED_rojo){
					//Se reproduce la canción correspondiente
					mp3_play_x(1);
					//Establece repetición continua de la canción
					mp3_single_repeat(0);
				}
				
				//Si se apagó la alarma
				else{
					//Se da stop a la reproducción
					mp3_stop();
				}
			}
			//No avanza mientras no deje de presionarse el botón
			while(BTN_rojo == 0);
		}
		if(Button(&PORTB, RB5, 100, 0)){
			if((PORTB & 0b00001101) == 0b00001101){
				LED_amarillo = ~LED_amarillo;
				if(!LED_amarillo){
					mp3_play_x(2);
					mp3_single_repeat(0);
				}
				else
					mp3_stop();
			}
			while(BTN_amarillo == 0);
		}
		if(Button(&PORTB, RB6, 100, 0)){
			if((PORTB & 0b00001011) == 0b00001011){
				LED_azul = ~LED_azul;
				if(!LED_azul){
					mp3_play_x(3);
					mp3_single_repeat(0);
				}
				else
					mp3_stop();
			}
			while(BTN_azul == 0);
		}
		if(Button(&PORTB, RB7, 100, 0)){
			if((PORTB & 0b00000111) == 0b00000111){
				LED_verde = ~LED_verde;
				if(!LED_verde){
					mp3_play_x(4);
					mp3_single_repeat(0);
				}
				else
					mp3_stop();
			}
			while(BTN_verde == 0);
		}
		temp = PORTB;
		INTCON = 0b10001000;
		/* if((PORTB & 0b11110000) == 0b11110000){
			mp3_stop();
		} */
    }
}

void interrupt(){
	temp = PORTB;
	RBIF_bit = 0;
}