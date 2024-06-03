/* Para PIC16F877A */
/* Versión 2*/

/* Cambios respecto a versión anterior...
/* 		Inclusión de librería mp3_chino para el control del módulo de audio DFPlayer Mini
/*		Directivas #define para dar nombre a los pines correspondientes a botones y LEDs
/*		Utilización de comunicación serial con el módulo de audio a traves del pin RC6
/*		Reproducción de una pista de audio determinada con el encendido de cada luz
/*		Condición para asegurar que sólo se encienda una luz/alarma a la vez
*/

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

void main(){
        
	//Activar pull-up interno después de Power-On Reset        
	NOT_RBPU_BIT = 0;
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

    while(1){

		//Botón presionado con 0 lógico en BTN_rojo, 5 ms de debouncing
		if(Button(&PORTB, RB0, 100, 0)){
			//Si los otros LEDs están apagados (salidas en 0 lógico)...
			if(!(PORTB & 0b11100000)){
					
				//Cambia la salida correspondiente
				LED_rojo = ~LED_rojo;
				
				//Si se encendió la alarma
				if(LED_rojo){
					//Se reproduce la canción correspondiente
					mp3_play_x(1);
					//Establece repetición continua de la canción
					mp3_single_repeat(0);
				}
				
				//Si se apagó la alarma
				else{
					//Se da stop a la reproducción
					mp3_stop();
					//delay_ms(1000);
				}
			}
			//No avanza mientras no deje de presionarse el botón
			while(BTN_rojo == 0);
		}
		if(Button(&PORTB, RB1, 100, 0)){
			if(!(PORTB & 0b11010000)){
				LED_amarillo = ~LED_amarillo;
				if(LED_amarillo){
					mp3_play_x(2);
					mp3_single_repeat(0);
				}
				else
					mp3_stop();
					//delay_ms(1000);
			}
			while(BTN_amarillo == 0);
		}
		if(Button(&PORTB, RB2, 100, 0)){
			if(!(PORTB & 0b10110000)){
				LED_azul = ~LED_azul;
				if(LED_azul){
					mp3_play_x(3);
					mp3_single_repeat(0);
				}
				else
					mp3_stop();
					//delay_ms(1000);
			}
			while(BTN_azul == 0);
		}
		if(Button(&PORTB, RB3, 100, 0)){
			if(!(PORTB & 0b01110000)){
				LED_verde = ~LED_verde;
				if(LED_verde){
					mp3_play_x(4);
					mp3_single_repeat(0);
				}
				else
					mp3_stop();
					//delay_ms(1000);
			}
			while(BTN_verde == 0);
		}
    }
}