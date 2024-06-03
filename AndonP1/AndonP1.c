/* Para PIC16F877A */
/* Versión 1 */

/* Lógica de encendido y apagado de las luces a partir de la presión de botones */

/* Entradas de botones
   RB0 : rojo
   RB1 : azul
   RB2 : amarillo
   RB3 : verde
   
   Salidas a LEDS
   RB4 : rojo
   RB5 : azul
   RB6 : amarillo
   RB7 : verde
   */

void main() {
	
	//Activar pull-up interno después de Power-On Reset	
	NOT_RBPU_BIT = 0;
	//Configura entradas en 4 low bits y salidas en 4 high bits
	TRISB = 0b00001111;
	//Salidas en 0 lógico, valor de 4 low bits es indiferente
	PORTB = 0b00000000;
	
    while(1){
		
		//Botón presionado con 0 lógico en pin 0 de PORTB, 5 ms de debouncing
		if(Button(&PORTB, 0, 5, 0)){
			
			//Cambia la salida correspondiente
			RB4_bit = ~RB4_bit;
			
			//No avanza mientras no deje de presionarse el botón
			while(RB0_bit == 0);
		}
		if(Button(&PORTB, 1, 5, 0)){
			RB5_bit = ~RB5_bit;
			while(RB1_bit == 0);
		}
		if(Button(&PORTB, 2, 5, 0)){
			RB6_bit = ~RB6_bit;
			while(RB2_bit == 0);
		}
		if(Button(&PORTB, 3, 5, 0)){
			RB7_bit = ~RB7_bit;
			while(RB3_bit == 0);
		}
    }
}