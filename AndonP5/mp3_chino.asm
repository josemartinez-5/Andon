
_init_mp3:

;mp3_chino.c,76 :: 		void init_mp3(){
;mp3_chino.c,77 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;mp3_chino.c,78 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_init_mp30:
	DECFSZ     R13+0, 1
	GOTO       L_init_mp30
	DECFSZ     R12+0, 1
	GOTO       L_init_mp30
	DECFSZ     R11+0, 1
	GOTO       L_init_mp30
	NOP
	NOP
;mp3_chino.c,79 :: 		}
L_end_init_mp3:
	RETURN
; end of _init_mp3

_calcula_checksum:

;mp3_chino.c,81 :: 		void calcula_checksum(){
;mp3_chino.c,82 :: 		checksum=0;
	CLRF       _checksum+0
	CLRF       _checksum+1
;mp3_chino.c,83 :: 		checksum=version+largo+comando+eco+hi(parametro)+lo(parametro);
	MOVF       _comando+0, 0
	ADDLW      5
	MOVWF      R0+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       _parametro+1, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       _parametro+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _checksum+0
	MOVF       R0+1, 0
	MOVWF      _checksum+1
;mp3_chino.c,84 :: 		checksum=-checksum;
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      _checksum+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       _checksum+1
	SUBWF      _checksum+1, 1
;mp3_chino.c,85 :: 		}
L_end_calcula_checksum:
	RETURN
; end of _calcula_checksum

_manda_mp3:

;mp3_chino.c,88 :: 		void manda_mp3(){
;mp3_chino.c,89 :: 		UART1_Write(inicio);
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,90 :: 		UART1_Write(version);
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,91 :: 		UART1_Write(largo);
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,92 :: 		UART1_Write(comando);
	MOVF       _comando+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,93 :: 		UART1_Write(eco);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,94 :: 		UART1_Write(hi(parametro));
	MOVF       _parametro+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,95 :: 		UART1_Write(lo(parametro));
	MOVF       _parametro+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,96 :: 		UART1_Write(hi(checksum));
	MOVF       _checksum+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,97 :: 		UART1_Write(lo(checksum));
	MOVF       _checksum+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,98 :: 		UART1_Write(fin);
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,99 :: 		parametro=0;
	CLRF       _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,100 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_manda_mp31:
	DECFSZ     R13+0, 1
	GOTO       L_manda_mp31
	DECFSZ     R12+0, 1
	GOTO       L_manda_mp31
	NOP
	NOP
;mp3_chino.c,101 :: 		}
L_end_manda_mp3:
	RETURN
; end of _manda_mp3

_mp3_next:

;mp3_chino.c,103 :: 		void mp3_next(){
;mp3_chino.c,104 :: 		comando=next;
	MOVLW      1
	MOVWF      _comando+0
;mp3_chino.c,105 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,106 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,107 :: 		}
L_end_mp3_next:
	RETURN
; end of _mp3_next

_mp3_previo:

;mp3_chino.c,109 :: 		void mp3_previo(){
;mp3_chino.c,110 :: 		comando=previus;
	MOVLW      2
	MOVWF      _comando+0
;mp3_chino.c,111 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,112 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,113 :: 		}
L_end_mp3_previo:
	RETURN
; end of _mp3_previo

_mp3_play_x:

;mp3_chino.c,115 :: 		void mp3_play_x(unsigned int cancion){
;mp3_chino.c,116 :: 		comando=archivo;
	MOVLW      3
	MOVWF      _comando+0
;mp3_chino.c,117 :: 		parametro=cancion;
	MOVF       FARG_mp3_play_x_cancion+0, 0
	MOVWF      _parametro+0
	MOVF       FARG_mp3_play_x_cancion+1, 0
	MOVWF      _parametro+1
;mp3_chino.c,118 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,119 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,120 :: 		}
L_end_mp3_play_x:
	RETURN
; end of _mp3_play_x

_mp3_volumen_sube:

;mp3_chino.c,122 :: 		void mp3_volumen_sube(){
;mp3_chino.c,123 :: 		comando=volumen_sub;
	MOVLW      4
	MOVWF      _comando+0
;mp3_chino.c,124 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,125 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,126 :: 		}
L_end_mp3_volumen_sube:
	RETURN
; end of _mp3_volumen_sube

_mp3_volumen_baja:

;mp3_chino.c,128 :: 		void mp3_volumen_baja(){
;mp3_chino.c,129 :: 		comando=volumen_baj;
	MOVLW      5
	MOVWF      _comando+0
;mp3_chino.c,130 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,131 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,132 :: 		}
L_end_mp3_volumen_baja:
	RETURN
; end of _mp3_volumen_baja

_mp3_volumen_x:

;mp3_chino.c,134 :: 		void mp3_volumen_x(unsigned char vol){
;mp3_chino.c,135 :: 		comando=volumen;
	MOVLW      6
	MOVWF      _comando+0
;mp3_chino.c,136 :: 		parametro=vol;
	MOVF       FARG_mp3_volumen_x_vol+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,137 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,138 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,139 :: 		}
L_end_mp3_volumen_x:
	RETURN
; end of _mp3_volumen_x

_mp3_ecualizador:

;mp3_chino.c,141 :: 		void mp3_ecualizador(unsigned char equal){
;mp3_chino.c,142 :: 		comando=ecualizador;
	MOVLW      7
	MOVWF      _comando+0
;mp3_chino.c,143 :: 		parametro=equal;
	MOVF       FARG_mp3_ecualizador_equal+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,144 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,145 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,146 :: 		}
L_end_mp3_ecualizador:
	RETURN
; end of _mp3_ecualizador

_mp3_single_repeat:

;mp3_chino.c,148 :: 		void mp3_single_repeat(unsigned int status){
;mp3_chino.c,149 :: 		comando=repetir_cancion;
	MOVLW      25
	MOVWF      _comando+0
;mp3_chino.c,150 :: 		parametro=status;
	MOVF       FARG_mp3_single_repeat_status+0, 0
	MOVWF      _parametro+0
	MOVF       FARG_mp3_single_repeat_status+1, 0
	MOVWF      _parametro+1
;mp3_chino.c,151 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,152 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,153 :: 		}
L_end_mp3_single_repeat:
	RETURN
; end of _mp3_single_repeat

_mp3_fuente:

;mp3_chino.c,155 :: 		void mp3_fuente(unsigned char como){
;mp3_chino.c,156 :: 		comando=fuente;
	MOVLW      9
	MOVWF      _comando+0
;mp3_chino.c,157 :: 		parametro=como;
	MOVF       FARG_mp3_fuente_como+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,158 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,159 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,160 :: 		}
L_end_mp3_fuente:
	RETURN
; end of _mp3_fuente

_mp3_modo_off:

;mp3_chino.c,162 :: 		void mp3_modo_off(){
;mp3_chino.c,163 :: 		comando=modo_on;
	MOVLW      10
	MOVWF      _comando+0
;mp3_chino.c,164 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,165 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,166 :: 		}
L_end_mp3_modo_off:
	RETURN
; end of _mp3_modo_off

_mp3_modo_normal:

;mp3_chino.c,169 :: 		void mp3_modo_normal(){
;mp3_chino.c,170 :: 		comando=modo_normal;
	MOVLW      11
	MOVWF      _comando+0
;mp3_chino.c,171 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,172 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,173 :: 		}
L_end_mp3_modo_normal:
	RETURN
; end of _mp3_modo_normal

_mp3_modo_reset:

;mp3_chino.c,176 :: 		void mp3_modo_reset(){
;mp3_chino.c,177 :: 		comando=modo_reset;
	MOVLW      12
	MOVWF      _comando+0
;mp3_chino.c,178 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,179 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,180 :: 		}
L_end_mp3_modo_reset:
	RETURN
; end of _mp3_modo_reset

_mp3_modo_play:

;mp3_chino.c,183 :: 		void mp3_modo_play(){
;mp3_chino.c,184 :: 		comando=modo_play;
	MOVLW      13
	MOVWF      _comando+0
;mp3_chino.c,185 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,186 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,187 :: 		}
L_end_mp3_modo_play:
	RETURN
; end of _mp3_modo_play

_mp3_modo_pausa:

;mp3_chino.c,190 :: 		void mp3_modo_pausa(){
;mp3_chino.c,191 :: 		comando=modo_pausa;
	MOVLW      14
	MOVWF      _comando+0
;mp3_chino.c,192 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,193 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,194 :: 		}
L_end_mp3_modo_pausa:
	RETURN
; end of _mp3_modo_pausa

_mp3_suena:

;mp3_chino.c,196 :: 		void mp3_suena(unsigned char carp,unsigned char fila){
;mp3_chino.c,197 :: 		comando=carpeta;
	MOVLW      15
	MOVWF      _comando+0
;mp3_chino.c,198 :: 		parametro=(unsigned int) carp<<8 | fila;
	MOVF       FARG_mp3_suena_carp+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
	MOVF       _parametro+0, 0
	MOVWF      _parametro+1
	CLRF       _parametro+0
	MOVF       FARG_mp3_suena_fila+0, 0
	IORWF      _parametro+0, 1
	MOVLW      0
	IORWF      _parametro+1, 1
;mp3_chino.c,199 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,200 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,201 :: 		}
L_end_mp3_suena:
	RETURN
; end of _mp3_suena

_mp3_volumen_set:

;mp3_chino.c,203 :: 		void mp3_volumen_set(unsigned char prend,unsigned char nivel){
;mp3_chino.c,204 :: 		comando=set_volumen;
	MOVLW      16
	MOVWF      _comando+0
;mp3_chino.c,205 :: 		parametro=(unsigned int) prend<<8 | nivel;
	MOVF       FARG_mp3_volumen_set_prend+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
	MOVF       _parametro+0, 0
	MOVWF      _parametro+1
	CLRF       _parametro+0
	MOVF       FARG_mp3_volumen_set_nivel+0, 0
	IORWF      _parametro+0, 1
	MOVLW      0
	IORWF      _parametro+1, 1
;mp3_chino.c,206 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,207 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,208 :: 		}
L_end_mp3_volumen_set:
	RETURN
; end of _mp3_volumen_set

_mp3_repite_ya:

;mp3_chino.c,210 :: 		void mp3_repite_ya(unsigned char como){
;mp3_chino.c,211 :: 		comando=repite_ya;
	MOVLW      17
	MOVWF      _comando+0
;mp3_chino.c,212 :: 		parametro=como;
	MOVF       FARG_mp3_repite_ya_como+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,213 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,214 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,215 :: 		}
L_end_mp3_repite_ya:
	RETURN
; end of _mp3_repite_ya

_mp3_stop:

;mp3_chino.c,217 :: 		void mp3_stop(){
;mp3_chino.c,218 :: 		comando = stop;
	MOVLW      22
	MOVWF      _comando+0
;mp3_chino.c,219 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,220 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,221 :: 		}
L_end_mp3_stop:
	RETURN
; end of _mp3_stop

_mp3_q_estado_usb:

;mp3_chino.c,224 :: 		void mp3_q_estado_usb(){
;mp3_chino.c,225 :: 		comando=es_usb;
	MOVLW      60
	MOVWF      _comando+0
;mp3_chino.c,226 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,227 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,228 :: 		}
L_end_mp3_q_estado_usb:
	RETURN
; end of _mp3_q_estado_usb

_mp3_q_estado_sd:

;mp3_chino.c,230 :: 		void mp3_q_estado_sd(){
;mp3_chino.c,231 :: 		comando=es_sd;
	MOVLW      61
	MOVWF      _comando+0
;mp3_chino.c,232 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,233 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,234 :: 		}
L_end_mp3_q_estado_sd:
	RETURN
; end of _mp3_q_estado_sd

_mp3_q_estado_flahs:

;mp3_chino.c,236 :: 		void mp3_q_estado_flahs(){
;mp3_chino.c,237 :: 		comando=es_flahs;
	MOVLW      62
	MOVWF      _comando+0
;mp3_chino.c,238 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,239 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,240 :: 		}
L_end_mp3_q_estado_flahs:
	RETURN
; end of _mp3_q_estado_flahs

_mp3_inicializa:

;mp3_chino.c,242 :: 		void mp3_inicializa(){
;mp3_chino.c,243 :: 		init_mp3();
	CALL       _init_mp3+0
;mp3_chino.c,244 :: 		comando=inicializa;
	MOVLW      63
	MOVWF      _comando+0
;mp3_chino.c,245 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,246 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,247 :: 		}
L_end_mp3_inicializa:
	RETURN
; end of _mp3_inicializa

_mp3_retransmite:

;mp3_chino.c,249 :: 		void mp3_retransmite(){
;mp3_chino.c,250 :: 		comando=retransmitir;
	MOVLW      64
	MOVWF      _comando+0
;mp3_chino.c,251 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,252 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,253 :: 		}
L_end_mp3_retransmite:
	RETURN
; end of _mp3_retransmite

_mp3_responder:

;mp3_chino.c,255 :: 		void mp3_responder(){
;mp3_chino.c,256 :: 		comando=responder;
	MOVLW      65
	MOVWF      _comando+0
;mp3_chino.c,257 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,258 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,259 :: 		}
L_end_mp3_responder:
	RETURN
; end of _mp3_responder

_mp3_q_estado:

;mp3_chino.c,261 :: 		void mp3_q_estado(){
;mp3_chino.c,262 :: 		comando=p_estado;
	MOVLW      66
	MOVWF      _comando+0
;mp3_chino.c,263 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,264 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,265 :: 		}
L_end_mp3_q_estado:
	RETURN
; end of _mp3_q_estado

_mp3_q_volumen:

;mp3_chino.c,268 :: 		void mp3_q_volumen(){
;mp3_chino.c,269 :: 		comando=p_volumen;
	MOVLW      67
	MOVWF      _comando+0
;mp3_chino.c,270 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,271 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,272 :: 		}
L_end_mp3_q_volumen:
	RETURN
; end of _mp3_q_volumen

_mp3_q_ecualizador:

;mp3_chino.c,274 :: 		void mp3_q_ecualizador(){
;mp3_chino.c,275 :: 		comando=p_equaliza;
	MOVLW      68
	MOVWF      _comando+0
;mp3_chino.c,276 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,277 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,278 :: 		}
L_end_mp3_q_ecualizador:
	RETURN
; end of _mp3_q_ecualizador

_mp3_q_play_mode:

;mp3_chino.c,280 :: 		void mp3_q_play_mode(){
;mp3_chino.c,281 :: 		comando=p_modo_rep;
	MOVLW      69
	MOVWF      _comando+0
;mp3_chino.c,282 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,283 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,284 :: 		}
L_end_mp3_q_play_mode:
	RETURN
; end of _mp3_q_play_mode

_mp3_q_software:

;mp3_chino.c,286 :: 		void mp3_q_software(){
;mp3_chino.c,287 :: 		comando=p_sofware;
	MOVLW      70
	MOVWF      _comando+0
;mp3_chino.c,288 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,289 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,290 :: 		}
L_end_mp3_q_software:
	RETURN
; end of _mp3_q_software

_mp3_q_sd_filas:

;mp3_chino.c,292 :: 		void mp3_q_sd_filas(){
;mp3_chino.c,293 :: 		comando=sd_filas;
	MOVLW      71
	MOVWF      _comando+0
;mp3_chino.c,294 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,295 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,296 :: 		}
L_end_mp3_q_sd_filas:
	RETURN
; end of _mp3_q_sd_filas

_mp3_q_usb_filas:

;mp3_chino.c,298 :: 		void mp3_q_usb_filas(){
;mp3_chino.c,299 :: 		comando=usb_filas;
	MOVLW      72
	MOVWF      _comando+0
;mp3_chino.c,300 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,301 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,302 :: 		}
L_end_mp3_q_usb_filas:
	RETURN
; end of _mp3_q_usb_filas

_mp3_q_flahs_filas:

;mp3_chino.c,304 :: 		void mp3_q_flahs_filas(){
;mp3_chino.c,305 :: 		comando=flahs_filas;
	MOVLW      73
	MOVWF      _comando+0
;mp3_chino.c,306 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,307 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,308 :: 		}
L_end_mp3_q_flahs_filas:
	RETURN
; end of _mp3_q_flahs_filas

_mp3_q_on:

;mp3_chino.c,310 :: 		void mp3_q_on(){
;mp3_chino.c,311 :: 		comando=on_;
	MOVLW      74
	MOVWF      _comando+0
;mp3_chino.c,312 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,313 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,314 :: 		}
L_end_mp3_q_on:
	RETURN
; end of _mp3_q_on

_mp3_q_sd_actual:

;mp3_chino.c,316 :: 		void mp3_q_sd_actual(){
;mp3_chino.c,317 :: 		comando=sd_actual;
	MOVLW      75
	MOVWF      _comando+0
;mp3_chino.c,318 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,319 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,320 :: 		}
L_end_mp3_q_sd_actual:
	RETURN
; end of _mp3_q_sd_actual

_mp3_q_usb_actual:

;mp3_chino.c,322 :: 		void mp3_q_usb_actual(){
;mp3_chino.c,323 :: 		comando=usb_actual;
	MOVLW      76
	MOVWF      _comando+0
;mp3_chino.c,324 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,325 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,326 :: 		}
L_end_mp3_q_usb_actual:
	RETURN
; end of _mp3_q_usb_actual

_mp3_q_flahs_actual:

;mp3_chino.c,328 :: 		void mp3_q_flahs_actual(){
;mp3_chino.c,329 :: 		comando=flahs_actual;
	MOVLW      77
	MOVWF      _comando+0
;mp3_chino.c,330 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,331 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,332 :: 		}
L_end_mp3_q_flahs_actual:
	RETURN
; end of _mp3_q_flahs_actual
