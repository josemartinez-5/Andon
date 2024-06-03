#line 1 "C:/Users/bloat/Documents/Andon/AndonP7/AndonP7.c"
#line 1 "c:/users/bloat/documents/andon/andonp7/mp3_chino.h"
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
#line 21 "C:/Users/bloat/Documents/Andon/AndonP7/AndonP7.c"
unsigned short temp;

void main(){

 NOT_RBPU_BIT = 0;

 TRISB = 0b11110000;

 PORTB = 0b00001111;

 TRISC6_bit = 0;



 init_mp3();
 mp3_stop();


 mp3_volumen_x(10);

 INTCON = 0b10001000;

 while(1){
 SPEN_bit = 0;
 RC6_bit = 0;
 asm{
 sleep
 nop
 }
 UART1_Init(9600);
 INTCON = 0;

 if(Button(&PORTB, RB4, 100, 0)){

 if((PORTB & 0b00001110) == 0b00001110){


  RB0_bit  = ~ RB0_bit ;


 if(! RB0_bit ){

 mp3_play_x(1);

 mp3_single_repeat(0);
 }


 else{

 mp3_stop();
 }
 }

 while( RB4_bit  == 0);
 }
 if(Button(&PORTB, RB5, 100, 0)){
 if((PORTB & 0b00001101) == 0b00001101){
  RB1_bit  = ~ RB1_bit ;
 if(! RB1_bit ){
 mp3_play_x(2);
 mp3_single_repeat(0);
 }
 else
 mp3_stop();
 }
 while( RB5_bit  == 0);
 }
 if(Button(&PORTB, RB6, 100, 0)){
 if((PORTB & 0b00001011) == 0b00001011){
  RB2_bit  = ~ RB2_bit ;
 if(! RB2_bit ){
 mp3_play_x(3);
 mp3_single_repeat(0);
 }
 else
 mp3_stop();
 }
 while( RB6_bit  == 0);
 }
 if(Button(&PORTB, RB7, 100, 0)){
 if((PORTB & 0b00000111) == 0b00000111){
  RB3_bit  = ~ RB3_bit ;
 if(! RB3_bit ){
 mp3_play_x(4);
 mp3_single_repeat(0);
 }
 else
 mp3_stop();
 }
 while( RB7_bit  == 0);
 }
 temp = PORTB;
 INTCON = 0b10001000;
#line 118 "C:/Users/bloat/Documents/Andon/AndonP7/AndonP7.c"
 }
}

void interrupt(){
 temp = PORTB;
 RBIF_bit = 0;
}
