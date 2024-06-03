#line 1 "C:/Users/bloat/Documents/Andon/AndonP8/AndonP8.c"
#line 1 "c:/users/bloat/documents/andon/andonp8/mp3_chino.h"
void init_mp3();
void mp3_next();
void mp3_previo();
void mp3_play_x(unsigned int cancion);
void mp3_volumen_sube();
void mp3_volumen_baja();
void mp3_volumen_x(unsigned char vol);
void mp3_ecualizador(unsigned char equal);
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
void mp3_q_ecualizador();
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
#line 21 "C:/Users/bloat/Documents/Andon/AndonP8/AndonP8.c"
void main(){


 NOT_RBPU_BIT = 0;

 TRISB = 0b00001111;

 PORTB = 0b11110000;

 TRISC6_bit = 0;



 init_mp3();
 mp3_stop();


 mp3_volumen_x(10);

 while(1){
 SPEN_bit = 0;
 RC6_bit = 0;

 if(Button(&PORTB, RB0, 100, 0)){

 if((PORTB & 0b11100000) == 0b11100000){
 UART1_Init(9600);

  RB4_bit  = ~ RB4_bit ;


 if(! RB4_bit ){

 mp3_play_x(1);

 mp3_single_repeat(0);
 }


 else{

 mp3_stop();
 }
 SPEN_bit = 0;
 RC6_bit = 0;
 }

 while( RB0_bit  == 0);
 }
 if(Button(&PORTB, RB1, 100, 0)){
 if((PORTB & 0b11010000) == 0b11010000){
 UART1_Init(9600);
  RB5_bit  = ~ RB5_bit ;
 if(! RB5_bit ){
 mp3_play_x(2);
 mp3_single_repeat(0);
 }
 else
 mp3_stop();
 SPEN_bit = 0;
 RC6_bit = 0;
 }
 while( RB1_bit  == 0);
 }
 if(Button(&PORTB, RB2, 100, 0)){
 if((PORTB & 0b10110000) == 0b10110000){
 UART1_Init(9600);
  RB6_bit  = ~ RB6_bit ;
 if(! RB6_bit ){
 mp3_play_x(3);
 mp3_single_repeat(0);
 }
 else
 mp3_stop();
 SPEN_bit = 0;
 RC6_bit = 0;
 }
 while( RB2_bit  == 0);
 }
 if(Button(&PORTB, RB3, 100, 0)){
 if((PORTB & 0b01110000) == 0b01110000){
 UART1_Init(9600);
  RB7_bit  = ~ RB7_bit ;
 if(! RB7_bit ){
 mp3_play_x(4);
 mp3_single_repeat(0);
 }
 else
 mp3_stop();
 SPEN_bit = 0;
 RC6_bit = 0;
 }
 while( RB3_bit  == 0);
 }
#line 118 "C:/Users/bloat/Documents/Andon/AndonP8/AndonP8.c"
 }
}
