#line 1 "C:/Users/bloat/Documents/Andon/AndonP4/AndonP4.c"
#line 1 "c:/users/bloat/documents/andon/andonp4/mp3_chino.h"
void init_mp3();
void mp3_next();
void mp3_previo();
void mp3_play_x(unsigned int cancion);
void mp3_volumen_sube();
void mp3_volumen_baja();
void mp3_volumen_x(unsigned char vol);
void mp3_equializa(unsigned char equal);
void mp3_single_repeat(unsigned int status);
void mp3_fuente(unsigned char como);
void mp3_modo_off();
void mp3_modo_normal();
void mp3_modo_reset();
void mp3_modo_play();
void mp3_modo_pausa();
void mp3_suena(unsigned char carp,unsigned char fila);
void mp3_volumen_set(unsigned char prend,unsigned char nivel);
void mp3_repite_ya(unsigned char como);
void mp3_q_estado_usb();
void mp3_q_estado_sd();
void mp3_q_estado_flahs();
void mp3_inicializa();
void mp3_retransmite();
void mp3_responder();
void mp3_q_estado();
void mp3_q_volumen();
void mp3_q_equializa();
void mp3_q_play_mode();
void mp3_q_software();
void mp3_q_sd_filas();
void mp3_q_usb_filas();
void mp3_q_flahs_filas();
void mp3_q_on();
void mp3_q_sd_actual();
void mp3_q_usb_actual();
void mp3_q_flahs_actual();

void mp3_stop();
#line 17 "C:/Users/bloat/Documents/Andon/AndonP4/AndonP4.c"
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


 if(Button(&PORTB, RB0, 5, 0)){
 if(!((PORTB >> 5) & 0b00000111)){
 set_rojo();
 }

 while( RB0_bit  == 0);
 }
 if(Button(&PORTB, RB1, 5, 0)){
 if(!((PORTB >> 6) & 0b00000011)){
 set_amarillo();
 }
 while( RB1_bit  == 0);
 }
 if(Button(&PORTB, RB2, 5, 0)){
 if(!((PORTB >> 7) & 0b00000001)){
 set_azul();
 }
 while( RB2_bit  == 0);
 }
 if(Button(&PORTB, RB3, 5, 0)){
 set_verde();
 while( RB3_bit  == 0);
 }

 if(counter == 0){
 if( RB4_bit ) set_amarillo();
 else if( RB5_bit ) set_azul();
 else if( RB6_bit ) set_verde();
 }
 }
}

void init(){
#line 74 "C:/Users/bloat/Documents/Andon/AndonP4/AndonP4.c"
 OPTION_REG = 0b00100111;
#line 79 "C:/Users/bloat/Documents/Andon/AndonP4/AndonP4.c"
 INTCON = 0b10000000;


 TRISB = 0b00001111;

 PORTB = 0b00000000;

 TRISC6_bit = 0;



 init_mp3();



}

void init_TMR0(unsigned int cycles){

 OPTION_REG.B5 = 0;


 T0IE_bit = 1;


 counter = cycles;


}

void interrupt(){
 counter--;
 T0IF_bit = 0;
}

void end_TMR0(){

 OPTION_REG.B5 = 1;


 T0IE_bit = 0;
}

void set_rojo(){

  RB4_bit  = ~ RB4_bit ;


 if( RB4_bit ){

 init_TMR0(75);

 mp3_play_x(1);

 mp3_single_repeat(0);
 }


 else{
 end_TMR0();


 mp3_stop();
 }
}

void set_amarillo(){
 PORTB = PORTB & 0b11101111;
  RB5_bit  = ~ RB5_bit ;
 if( RB5_bit ){

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
  RB6_bit  = ~ RB6_bit ;
 if( RB6_bit ){

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
  RB7_bit  = ~ RB7_bit ;
 if( RB7_bit ){
 end_TMR0();
 mp3_play_x(4);
 mp3_single_repeat(0);
 }
 else
 mp3_stop();
}
