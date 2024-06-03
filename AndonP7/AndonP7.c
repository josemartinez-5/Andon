/* Para PIC16F877A */
/* Versión 4*/

/* Cambios respecto a versión anterior...
/* 		El microcontrolador se encuentra en modo de baja potencia (sleep).
/*		hasta que se presiona un botón.
/*		Se utiliza la interrupción por cambio en el puerto B para sacar al microcontrolador
/*		del estado sleep, por lo que se redifineron los pines del puerto B.
/*		La comunicación serial UART con el módulo de audio se detiene mientras el
/*		microcontrolador se encuentra en sleep y se reinicia cada vez que se presiona un botón.
/*		El pin RC6 se encuentra en 0 lógico mientras el microcontrador está en modo sleep.
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

//Variable para realizar lecturas del puerto B y reiniciar el ciclo de interrupciones
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
	
	//Habilita las interrupciones globalmente y la interrupción por cambio en el puerto B
	//en particular
	INTCON = 0b10001000;

    while(1){
		//Deshabilita el puerto serial
		SPEN_bit = 0;
		//Pone en 0 lógico el pin RC6 antes de poner el PIC en sleep
		RC6_bit = 0;
		asm{
			sleep
			nop
		}
		//Se reinicia la comunicación seríal
		UART1_Init(9600);
		//Desactivación temporal de las interrupciones
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
		//Reactivación de las interrupciones
		INTCON = 0b10001000;
    }
}

//Método llamado al ocurrir una interuupción
void interrupt(){
	//Se realiza la lectura del puerto B y se limpia la bandera correspondiente (RBIF)
	temp = PORTB;
	RBIF_bit = 0;
}