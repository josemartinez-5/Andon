
_init_mp3:

;mp3_chino.c,68 :: 		void init_mp3()
;mp3_chino.c,71 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;mp3_chino.c,72 :: 		Delay_ms(1000);
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
;mp3_chino.c,73 :: 		}
L_end_init_mp3:
	RETURN
; end of _init_mp3

_calcula_checksum:

;mp3_chino.c,75 :: 		void calcula_checksum()
;mp3_chino.c,77 :: 		checksum=0;
	CLRF       _checksum+0
	CLRF       _checksum+1
;mp3_chino.c,79 :: 		checksum=version+largo+comando+eco+hi(parametro)+lo(parametro);
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
;mp3_chino.c,80 :: 		checksum=-checksum;
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      _checksum+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       _checksum+1
	SUBWF      _checksum+1, 1
;mp3_chino.c,81 :: 		}
L_end_calcula_checksum:
	RETURN
; end of _calcula_checksum

_manda_mp3:

;mp3_chino.c,84 :: 		void manda_mp3()
;mp3_chino.c,86 :: 		UART1_Write(inicio);
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,87 :: 		UART1_Write(version);
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,88 :: 		UART1_Write(largo);
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,89 :: 		UART1_Write(comando);
	MOVF       _comando+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,90 :: 		UART1_Write(eco);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,91 :: 		UART1_Write(hi(parametro));
	MOVF       _parametro+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,92 :: 		UART1_Write(lo(parametro));
	MOVF       _parametro+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,93 :: 		UART1_Write(hi(checksum));
	MOVF       _checksum+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,94 :: 		UART1_Write(lo(checksum));
	MOVF       _checksum+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,95 :: 		UART1_Write(fin);
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,96 :: 		parametro=0;
	CLRF       _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,97 :: 		Delay_ms(100);
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
;mp3_chino.c,98 :: 		}
L_end_manda_mp3:
	RETURN
; end of _manda_mp3

_mp3_next:

;mp3_chino.c,100 :: 		void mp3_next()
;mp3_chino.c,102 :: 		comando=next;
	MOVLW      1
	MOVWF      _comando+0
;mp3_chino.c,103 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,104 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,105 :: 		}
L_end_mp3_next:
	RETURN
; end of _mp3_next

_mp3_previo:

;mp3_chino.c,107 :: 		void mp3_previo()
;mp3_chino.c,109 :: 		comando=previus;
	MOVLW      2
	MOVWF      _comando+0
;mp3_chino.c,110 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,111 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,112 :: 		}
L_end_mp3_previo:
	RETURN
; end of _mp3_previo

_mp3_play_x:

;mp3_chino.c,114 :: 		void mp3_play_x(unsigned int cancion)
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

;mp3_chino.c,122 :: 		void mp3_volumen_sube()
;mp3_chino.c,124 :: 		comando=volumen_sub;
	MOVLW      4
	MOVWF      _comando+0
;mp3_chino.c,125 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,126 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,127 :: 		}
L_end_mp3_volumen_sube:
	RETURN
; end of _mp3_volumen_sube

_mp3_volumen_baja:

;mp3_chino.c,129 :: 		void mp3_volumen_baja()
;mp3_chino.c,131 :: 		comando=volumen_baj;
	MOVLW      5
	MOVWF      _comando+0
;mp3_chino.c,132 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,133 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,134 :: 		}
L_end_mp3_volumen_baja:
	RETURN
; end of _mp3_volumen_baja

_mp3_volumen_x:

;mp3_chino.c,136 :: 		void mp3_volumen_x(unsigned char vol)
;mp3_chino.c,138 :: 		comando=volumen;
	MOVLW      6
	MOVWF      _comando+0
;mp3_chino.c,139 :: 		parametro=vol;
	MOVF       FARG_mp3_volumen_x_vol+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,140 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,141 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,142 :: 		}
L_end_mp3_volumen_x:
	RETURN
; end of _mp3_volumen_x

_mp3_equializa:

;mp3_chino.c,144 :: 		void mp3_equializa(unsigned char equal)
;mp3_chino.c,146 :: 		comando=equializa;
	MOVLW      7
	MOVWF      _comando+0
;mp3_chino.c,147 :: 		parametro=equal;
	MOVF       FARG_mp3_equializa_equal+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,148 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,149 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,150 :: 		}
L_end_mp3_equializa:
	RETURN
; end of _mp3_equializa

_mp3_single_repeat:

;mp3_chino.c,152 :: 		void mp3_single_repeat(unsigned int status)
;mp3_chino.c,154 :: 		comando=repetir_cancion;
	MOVLW      25
	MOVWF      _comando+0
;mp3_chino.c,155 :: 		parametro=status;
	MOVF       FARG_mp3_single_repeat_status+0, 0
	MOVWF      _parametro+0
	MOVF       FARG_mp3_single_repeat_status+1, 0
	MOVWF      _parametro+1
;mp3_chino.c,156 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,157 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,158 :: 		}
L_end_mp3_single_repeat:
	RETURN
; end of _mp3_single_repeat

_mp3_fuente:

;mp3_chino.c,160 :: 		void mp3_fuente(unsigned char como)
;mp3_chino.c,162 :: 		comando=fuente;
	MOVLW      9
	MOVWF      _comando+0
;mp3_chino.c,163 :: 		parametro=como;
	MOVF       FARG_mp3_fuente_como+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,164 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,165 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,166 :: 		}
L_end_mp3_fuente:
	RETURN
; end of _mp3_fuente

_mp3_modo_off:

;mp3_chino.c,168 :: 		void mp3_modo_off()
;mp3_chino.c,170 :: 		comando=modo_on;
	MOVLW      10
	MOVWF      _comando+0
;mp3_chino.c,171 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,172 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,173 :: 		}
L_end_mp3_modo_off:
	RETURN
; end of _mp3_modo_off

_mp3_modo_normal:

;mp3_chino.c,176 :: 		void mp3_modo_normal()
;mp3_chino.c,178 :: 		comando=modo_normal;
	MOVLW      11
	MOVWF      _comando+0
;mp3_chino.c,179 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,180 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,181 :: 		}
L_end_mp3_modo_normal:
	RETURN
; end of _mp3_modo_normal

_mp3_modo_reset:

;mp3_chino.c,184 :: 		void mp3_modo_reset()
;mp3_chino.c,186 :: 		comando=modo_reset;
	MOVLW      12
	MOVWF      _comando+0
;mp3_chino.c,187 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,188 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,189 :: 		}
L_end_mp3_modo_reset:
	RETURN
; end of _mp3_modo_reset

_mp3_modo_play:

;mp3_chino.c,192 :: 		void mp3_modo_play()
;mp3_chino.c,194 :: 		comando=modo_play;
	MOVLW      13
	MOVWF      _comando+0
;mp3_chino.c,195 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,196 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,197 :: 		}
L_end_mp3_modo_play:
	RETURN
; end of _mp3_modo_play

_mp3_modo_pausa:

;mp3_chino.c,200 :: 		void mp3_modo_pausa()
;mp3_chino.c,202 :: 		comando=modo_pausa;
	MOVLW      14
	MOVWF      _comando+0
;mp3_chino.c,203 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,204 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,205 :: 		}
L_end_mp3_modo_pausa:
	RETURN
; end of _mp3_modo_pausa

_mp3_suena:

;mp3_chino.c,208 :: 		void mp3_suena(unsigned char carp,unsigned char fila)
;mp3_chino.c,210 :: 		comando=carpeta;
	MOVLW      15
	MOVWF      _comando+0
;mp3_chino.c,211 :: 		parametro=(unsigned int) carp<<8 | fila;
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
;mp3_chino.c,212 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,213 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,214 :: 		}
L_end_mp3_suena:
	RETURN
; end of _mp3_suena

_mp3_volumen_set:

;mp3_chino.c,217 :: 		void mp3_volumen_set(unsigned char prend,unsigned char nivel)
;mp3_chino.c,219 :: 		comando=set_volumen;
	MOVLW      16
	MOVWF      _comando+0
;mp3_chino.c,220 :: 		parametro=(unsigned int) prend<<8 | nivel;
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
;mp3_chino.c,221 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,222 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,223 :: 		}
L_end_mp3_volumen_set:
	RETURN
; end of _mp3_volumen_set

_mp3_repite_ya:

;mp3_chino.c,225 :: 		void mp3_repite_ya(unsigned char como)    //1=repite  0=stop
;mp3_chino.c,227 :: 		comando=repite_ya;
	MOVLW      17
	MOVWF      _comando+0
;mp3_chino.c,228 :: 		parametro=como;
	MOVF       FARG_mp3_repite_ya_como+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,229 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,230 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,231 :: 		}
L_end_mp3_repite_ya:
	RETURN
; end of _mp3_repite_ya

_mp3_q_estado_usb:

;mp3_chino.c,233 :: 		void mp3_q_estado_usb()
;mp3_chino.c,235 :: 		comando=es_usb;
	MOVLW      60
	MOVWF      _comando+0
;mp3_chino.c,236 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,237 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,238 :: 		}
L_end_mp3_q_estado_usb:
	RETURN
; end of _mp3_q_estado_usb

_mp3_q_estado_sd:

;mp3_chino.c,240 :: 		void mp3_q_estado_sd()
;mp3_chino.c,242 :: 		comando=es_sd;
	MOVLW      61
	MOVWF      _comando+0
;mp3_chino.c,243 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,244 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,246 :: 		}
L_end_mp3_q_estado_sd:
	RETURN
; end of _mp3_q_estado_sd

_mp3_q_estado_flahs:

;mp3_chino.c,248 :: 		void mp3_q_estado_flahs()
;mp3_chino.c,250 :: 		comando=es_flahs;
	MOVLW      62
	MOVWF      _comando+0
;mp3_chino.c,251 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,252 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,253 :: 		}
L_end_mp3_q_estado_flahs:
	RETURN
; end of _mp3_q_estado_flahs

_mp3_inicializa:

;mp3_chino.c,255 :: 		void mp3_inicializa()
;mp3_chino.c,257 :: 		init_mp3();// inica el modulo puwerto serial
	CALL       _init_mp3+0
;mp3_chino.c,258 :: 		comando=inicializa;
	MOVLW      63
	MOVWF      _comando+0
;mp3_chino.c,259 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,260 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,261 :: 		}
L_end_mp3_inicializa:
	RETURN
; end of _mp3_inicializa

_mp3_retransmite:

;mp3_chino.c,263 :: 		void mp3_retransmite()
;mp3_chino.c,265 :: 		comando=retransmitir;
	MOVLW      64
	MOVWF      _comando+0
;mp3_chino.c,266 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,267 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,268 :: 		}
L_end_mp3_retransmite:
	RETURN
; end of _mp3_retransmite

_mp3_responder:

;mp3_chino.c,270 :: 		void mp3_responder()
;mp3_chino.c,272 :: 		comando=responder;
	MOVLW      65
	MOVWF      _comando+0
;mp3_chino.c,273 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,274 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,275 :: 		}
L_end_mp3_responder:
	RETURN
; end of _mp3_responder

_mp3_q_estado:

;mp3_chino.c,278 :: 		void mp3_q_estado()
;mp3_chino.c,280 :: 		comando=p_estado;
	MOVLW      66
	MOVWF      _comando+0
;mp3_chino.c,281 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,282 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,283 :: 		}
L_end_mp3_q_estado:
	RETURN
; end of _mp3_q_estado

_mp3_q_volumen:

;mp3_chino.c,286 :: 		void mp3_q_volumen()
;mp3_chino.c,288 :: 		comando=p_volumen;
	MOVLW      67
	MOVWF      _comando+0
;mp3_chino.c,289 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,290 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,291 :: 		}
L_end_mp3_q_volumen:
	RETURN
; end of _mp3_q_volumen

_mp3_q_equializa:

;mp3_chino.c,295 :: 		void mp3_q_equializa()
;mp3_chino.c,297 :: 		comando=p_equaliza;
	MOVLW      68
	MOVWF      _comando+0
;mp3_chino.c,298 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,299 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,300 :: 		}
L_end_mp3_q_equializa:
	RETURN
; end of _mp3_q_equializa

_mp3_q_play_mode:

;mp3_chino.c,303 :: 		void mp3_q_play_mode()
;mp3_chino.c,305 :: 		comando=p_modo_rep;
	MOVLW      69
	MOVWF      _comando+0
;mp3_chino.c,306 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,307 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,308 :: 		}
L_end_mp3_q_play_mode:
	RETURN
; end of _mp3_q_play_mode

_mp3_q_software:

;mp3_chino.c,310 :: 		void mp3_q_software()
;mp3_chino.c,312 :: 		comando=p_sofware;
	MOVLW      70
	MOVWF      _comando+0
;mp3_chino.c,313 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,314 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,315 :: 		}
L_end_mp3_q_software:
	RETURN
; end of _mp3_q_software

_mp3_q_sd_filas:

;mp3_chino.c,318 :: 		void mp3_q_sd_filas()
;mp3_chino.c,320 :: 		comando=sd_filas;
	MOVLW      71
	MOVWF      _comando+0
;mp3_chino.c,321 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,322 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,323 :: 		}
L_end_mp3_q_sd_filas:
	RETURN
; end of _mp3_q_sd_filas

_mp3_q_usb_filas:

;mp3_chino.c,327 :: 		void mp3_q_usb_filas()
;mp3_chino.c,329 :: 		comando=usb_filas;
	MOVLW      72
	MOVWF      _comando+0
;mp3_chino.c,330 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,331 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,332 :: 		}
L_end_mp3_q_usb_filas:
	RETURN
; end of _mp3_q_usb_filas

_mp3_q_flahs_filas:

;mp3_chino.c,336 :: 		void mp3_q_flahs_filas()
;mp3_chino.c,338 :: 		comando=flahs_filas;
	MOVLW      73
	MOVWF      _comando+0
;mp3_chino.c,339 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,340 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,341 :: 		}
L_end_mp3_q_flahs_filas:
	RETURN
; end of _mp3_q_flahs_filas

_mp3_q_on:

;mp3_chino.c,345 :: 		void mp3_q_on()
;mp3_chino.c,347 :: 		comando=on_;
	MOVLW      74
	MOVWF      _comando+0
;mp3_chino.c,348 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,349 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,350 :: 		}
L_end_mp3_q_on:
	RETURN
; end of _mp3_q_on

_mp3_q_sd_actual:

;mp3_chino.c,352 :: 		void mp3_q_sd_actual()
;mp3_chino.c,354 :: 		comando=sd_actual;
	MOVLW      75
	MOVWF      _comando+0
;mp3_chino.c,355 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,356 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,357 :: 		}
L_end_mp3_q_sd_actual:
	RETURN
; end of _mp3_q_sd_actual

_mp3_q_usb_actual:

;mp3_chino.c,359 :: 		void mp3_q_usb_actual()
;mp3_chino.c,361 :: 		comando=usb_actual;
	MOVLW      76
	MOVWF      _comando+0
;mp3_chino.c,362 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,363 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,364 :: 		}
L_end_mp3_q_usb_actual:
	RETURN
; end of _mp3_q_usb_actual

_mp3_q_flahs_actual:

;mp3_chino.c,366 :: 		void mp3_q_flahs_actual()
;mp3_chino.c,368 :: 		comando=flahs_actual;
	MOVLW      77
	MOVWF      _comando+0
;mp3_chino.c,369 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,370 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,371 :: 		}
L_end_mp3_q_flahs_actual:
	RETURN
; end of _mp3_q_flahs_actual

_mp3_stop:

;mp3_chino.c,373 :: 		void mp3_stop(){
;mp3_chino.c,374 :: 		comando = stop;
	MOVLW      22
	MOVWF      _comando+0
;mp3_chino.c,375 :: 		calcula_checksum();
	CALL       _calcula_checksum+0
;mp3_chino.c,376 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,377 :: 		}
L_end_mp3_stop:
	RETURN
; end of _mp3_stop
