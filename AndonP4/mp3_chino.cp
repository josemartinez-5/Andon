#line 1 "C:/Users/bloat/Documents/Andon/AndonP4/mp3_chino.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 2 "C:/Users/bloat/Documents/Andon/AndonP4/mp3_chino.c"
 const char inicio=0x7E;
 const char fin=0XEF;
 const char version=0xFF;
 const char eco=0;
 const char largo=0x06;
unsigned int checksum;
unsigned char comando;
unsigned int parametro=0;
#line 68 "C:/Users/bloat/Documents/Andon/AndonP4/mp3_chino.c"
void init_mp3()
{

UART1_Init(9600);
Delay_ms(1000);
}

void calcula_checksum()
{
checksum=0;

checksum=version+largo+comando+eco+ ((char *)&parametro)[1] + ((char *)&parametro)[0] ;
checksum=-checksum;
}


void manda_mp3()
{
 UART1_Write(inicio);
 UART1_Write(version);
 UART1_Write(largo);
 UART1_Write(comando);
 UART1_Write(eco);
 UART1_Write( ((char *)&parametro)[1] );
 UART1_Write( ((char *)&parametro)[0] );
 UART1_Write( ((char *)&checksum)[1] );
 UART1_Write( ((char *)&checksum)[0] );
 UART1_Write(fin);
 parametro=0;
 Delay_ms(100);
}

void mp3_next()
{
comando= 0x01 ;
calcula_checksum();
manda_mp3();
}

void mp3_previo()
{
comando= 0x02 ;
calcula_checksum();
manda_mp3();
}

void mp3_play_x(unsigned int cancion)
{
comando= 0x03 ;
parametro=cancion;
calcula_checksum();
manda_mp3();
}

void mp3_volumen_sube()
{
comando= 0x04 ;
calcula_checksum();
manda_mp3();
}

void mp3_volumen_baja()
{
comando= 0x05 ;
calcula_checksum();
manda_mp3();
}

void mp3_volumen_x(unsigned char vol)
{
comando= 0x06 ;
parametro=vol;
calcula_checksum();
manda_mp3();
}

void mp3_equializa(unsigned char equal)
{
comando= 0x07 ;
parametro=equal;
calcula_checksum();
manda_mp3();
}

void mp3_single_repeat(unsigned int status)
{
 comando= 0x19 ;
 parametro=status;
 calcula_checksum();
 manda_mp3();
}

void mp3_fuente(unsigned char como)
{
comando= 0x09 ;
parametro=como;
calcula_checksum();
manda_mp3();
}

void mp3_modo_off()
{
comando= 0x0A ;
calcula_checksum();
manda_mp3();
}


void mp3_modo_normal()
{
comando= 0x0B ;
calcula_checksum();
manda_mp3();
}


void mp3_modo_reset()
{
comando= 0x0C ;
calcula_checksum();
manda_mp3();
}


void mp3_modo_play()
{
comando= 0x0D ;
calcula_checksum();
manda_mp3();
}


void mp3_modo_pausa()
{
comando= 0x0E ;
calcula_checksum();
manda_mp3();
}


void mp3_suena(unsigned char carp,unsigned char fila)
{
comando= 0x0F ;
parametro=(unsigned int) carp<<8 | fila;
calcula_checksum();
manda_mp3();
}


void mp3_volumen_set(unsigned char prend,unsigned char nivel)
{
comando= 0x10 ;
parametro=(unsigned int) prend<<8 | nivel;
calcula_checksum();
manda_mp3();
}

void mp3_repite_ya(unsigned char como)
{
comando= 0x011 ;
parametro=como;
calcula_checksum();
manda_mp3();
}

void mp3_q_estado_usb()
{
comando= 0x03C ;
calcula_checksum();
manda_mp3();
}

void mp3_q_estado_sd()
{
comando= 0x03D ;
calcula_checksum();
manda_mp3();

}

void mp3_q_estado_flahs()
{
comando= 0x03E ;
calcula_checksum();
manda_mp3();
}

void mp3_inicializa()
{
init_mp3();
comando= 0x03F ;
calcula_checksum();
manda_mp3();
}

void mp3_retransmite()
{
comando= 0x040 ;
calcula_checksum();
manda_mp3();
}

void mp3_responder()
{
comando= 0x041 ;
calcula_checksum();
manda_mp3();
}


void mp3_q_estado()
{
comando= 0x042 ;
calcula_checksum();
manda_mp3();
}


void mp3_q_volumen()
{
comando= 0x043 ;
calcula_checksum();
manda_mp3();
}



void mp3_q_equializa()
{
comando= 0x044 ;
calcula_checksum();
manda_mp3();
}


void mp3_q_play_mode()
{
comando= 0x045 ;
calcula_checksum();
manda_mp3();
}

void mp3_q_software()
{
comando= 0x046 ;
calcula_checksum();
manda_mp3();
}


void mp3_q_sd_filas()
{
comando= 0x047 ;
calcula_checksum();
manda_mp3();
}



void mp3_q_usb_filas()
{
comando= 0x048 ;
calcula_checksum();
manda_mp3();
}



void mp3_q_flahs_filas()
{
comando= 0x049 ;
calcula_checksum();
manda_mp3();
}



void mp3_q_on()
{
comando= 0x04A ;
calcula_checksum();
manda_mp3();
}

void mp3_q_sd_actual()
{
comando= 0x04B ;
calcula_checksum();
manda_mp3();
}

void mp3_q_usb_actual()
{
comando= 0x04C ;
calcula_checksum();
manda_mp3();
}

void mp3_q_flahs_actual()
{
comando= 0x04D ;
calcula_checksum();
manda_mp3();
}

void mp3_stop(){
 comando =  0x16 ;
 calcula_checksum();
 manda_mp3();
}
