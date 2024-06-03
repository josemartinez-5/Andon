/* Para PIC18F4550 */
/* Versi�n 1 */

/* Mismo programa que AndonP1, pero en un PIC18F4550
/* L�gica de encendido y apagado de las luces a partir de la presi�n de botones
*/

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
     NOT_RBPU_BIT = 0;          //Activar pull-up interno despu�s de Power-On Reset
     TRISB = 0b00001111;        //Configura entradas en 4 low bits y salidas en 4 high bits
     PORTB = 0b00000000;        //Salidas en 0 l�gico, valor de 4 low bits es indiferente

     while(1){
		if(Button(&PORTB, 0, 5, 0)){      //Bot�n presionado con 0 l�gico en pin 0 de PORTB
			RB4_bit = ~RB4_bit;           //Cambia la salida correspondiente
			while(RB0_bit == 0);          //No avanza mientras no deje de presionarse el bot�n
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