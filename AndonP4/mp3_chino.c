#include "built_in.h"
 const char  inicio=0x7E;
 const char  fin=0XEF;
 const char version=0xFF;
 const char  eco=0;   // si se coloca 1 responde con eco
 const char largo=0x06;
unsigned int checksum;
unsigned char comando;
unsigned int parametro=0;

//comando
  #define  next 0x01
  #define  previus 0x02
  #define  archivo 0x03      //de 0 a 2999
  #define  volumen_sub 0x04
  #define  volumen_baj 0x05
  #define  volumen 0x06    //  de 0 a 30
  #define  equializa 0x07
     #define  normal  0
     #define  pop      1
     #define  rock     2
     #define  jazz     3
     #define  classic  4
     #define  base     5
	 
  /* Comando 0x08 repite canción en root de acuerdo al parametro,
	 pero solo acepta parámetros de 0 a 3. Inservible */
	 
  //Comando 0x19 habilita (0) o deshabilita (1) reproducción continua de canción
  #define  repetir_cancion 0x19
  #define  fuente 0x09
   #define  usb       0
   #define  sd        1
   #define  aux       2
   #define  sleep     3
   #define  flash     4
  #define  modo_on     0x0A
  #define  modo_normal 0x0B
  #define  modo_reset  0x0C
  #define  modo_play   0x0D
  #define  modo_pausa  0x0E
  #define  carpeta  0x0F   //suena carpeta seleccionada se DH=Folde  DL=cancion  folde 01~99
  #define  set_volumen 0x10    //parte alta=1 ajuta      parte baja= ganancia  0~31
  #define  repite_ya  0x011  //1 = repite cancion   0=para
  
  #define stop 0x16
  
  //consultas
  #define  es_usb       0x03C
  #define  es_sd        0x03D
  #define  es_flahs     0x03E
  #define  inicializa    0x03F
  #define  retransmitir     0x040
  #define  responder    0x041
  #define  p_estado    0x042
  #define  p_volumen    0x043
  #define  p_equaliza    0x044
  #define  p_modo_rep    0x045
  #define  p_sofware    0x046
  #define  sd_filas    0x047
  #define  usb_filas    0x048
  #define  flahs_filas    0x049
  #define  on_    0x04A
  #define  sd_actual    0x04B
  #define  usb_actual    0x04C
  #define  flahs_actual    0x04D
  
void init_mp3()
{
//colocr como  salida in tx
UART1_Init(9600);
Delay_ms(1000);
}

void calcula_checksum()
{
checksum=0;

checksum=version+largo+comando+eco+hi(parametro)+lo(parametro);
checksum=-checksum;
}


void manda_mp3()
{
  UART1_Write(inicio);
  UART1_Write(version);
  UART1_Write(largo);
  UART1_Write(comando);
  UART1_Write(eco);
  UART1_Write(hi(parametro));
  UART1_Write(lo(parametro));
  UART1_Write(hi(checksum));
  UART1_Write(lo(checksum));
  UART1_Write(fin);
  parametro=0;
  Delay_ms(100);
}

void mp3_next()
{
comando=next;
calcula_checksum();
manda_mp3();
}

void mp3_previo()
{
comando=previus;
calcula_checksum();
manda_mp3();
}

void mp3_play_x(unsigned int cancion)
{
comando=archivo;
parametro=cancion;
calcula_checksum();
manda_mp3();
}

void mp3_volumen_sube()
{
comando=volumen_sub;
calcula_checksum();
manda_mp3();
}

void mp3_volumen_baja()
{
comando=volumen_baj;
calcula_checksum();
manda_mp3();
}

void mp3_volumen_x(unsigned char vol)
{
comando=volumen;
parametro=vol;
calcula_checksum();
manda_mp3();
}

void mp3_equializa(unsigned char equal)
{
comando=equializa;
parametro=equal;
calcula_checksum();
manda_mp3();
}

void mp3_single_repeat(unsigned int status)
{
	comando=repetir_cancion;
	parametro=status;
	calcula_checksum();
	manda_mp3();
}

void mp3_fuente(unsigned char como)
{
comando=fuente;
parametro=como;
calcula_checksum();
manda_mp3();
}

void mp3_modo_off()
{
comando=modo_on;
calcula_checksum();
manda_mp3();
}


void mp3_modo_normal()
{
comando=modo_normal;
calcula_checksum();
manda_mp3();
}


void mp3_modo_reset()
{
comando=modo_reset;
calcula_checksum();
manda_mp3();
}


void mp3_modo_play()
{
comando=modo_play;
calcula_checksum();
manda_mp3();
}


void mp3_modo_pausa()
{
comando=modo_pausa;
calcula_checksum();
manda_mp3();
}


void mp3_suena(unsigned char carp,unsigned char fila)
{
comando=carpeta;
parametro=(unsigned int) carp<<8 | fila;
calcula_checksum();
manda_mp3();
}


void mp3_volumen_set(unsigned char prend,unsigned char nivel)
{
comando=set_volumen;
parametro=(unsigned int) prend<<8 | nivel;
calcula_checksum();
manda_mp3();
}

void mp3_repite_ya(unsigned char como)    //1=repite  0=stop
{
comando=repite_ya;
parametro=como;
calcula_checksum();
manda_mp3();
}

void mp3_q_estado_usb()
{
comando=es_usb;
calcula_checksum();
manda_mp3();
}

void mp3_q_estado_sd()
{
comando=es_sd;
calcula_checksum();
manda_mp3();

}

void mp3_q_estado_flahs()
{
comando=es_flahs;
calcula_checksum();
manda_mp3();
}

void mp3_inicializa()
{
init_mp3();// inica el modulo puwerto serial
comando=inicializa;
calcula_checksum();
manda_mp3();
}

void mp3_retransmite()
{
comando=retransmitir;
calcula_checksum();
manda_mp3();
}

void mp3_responder()
{
comando=responder;
calcula_checksum();
manda_mp3();
}


void mp3_q_estado()
{
comando=p_estado;
calcula_checksum();
manda_mp3();
}


void mp3_q_volumen()
{
comando=p_volumen;
calcula_checksum();
manda_mp3();
}



void mp3_q_equializa()
{
comando=p_equaliza;
calcula_checksum();
manda_mp3();
}


void mp3_q_play_mode()
{
comando=p_modo_rep;
calcula_checksum();
manda_mp3();
}

void mp3_q_software()
{
comando=p_sofware;
calcula_checksum();
manda_mp3();
}


void mp3_q_sd_filas()
{
comando=sd_filas;
calcula_checksum();
manda_mp3();
}



void mp3_q_usb_filas()
{
comando=usb_filas;
calcula_checksum();
manda_mp3();
}



void mp3_q_flahs_filas()
{
comando=flahs_filas;
calcula_checksum();
manda_mp3();
}



void mp3_q_on()
{
comando=on_;
calcula_checksum();
manda_mp3();
}

void mp3_q_sd_actual()
{
comando=sd_actual;
calcula_checksum();
manda_mp3();
}

void mp3_q_usb_actual()
{
comando=usb_actual;
calcula_checksum();
manda_mp3();
}

void mp3_q_flahs_actual()
{
comando=flahs_actual;
calcula_checksum();
manda_mp3();
}

void mp3_stop(){
	comando = stop;
	calcula_checksum();
	manda_mp3();
}