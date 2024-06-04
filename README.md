# Andon
Diferentes programas en C utlizados en el desarrollo de un sistema Andon

## Descripción
En cada una de las carpetas se encuentra un proyecto del IDE mikroC para PIC, donde se encuentra el programa escrito en C para el funcionamiento de un sistema Andon. El programa compilado en un archivo .hex es escrito en la memoria flash de un microcontrolador PIC16F8877, el cual actúa como la base del sistema Andon

El objetivo del programa es controlar el encendido y apagado de alertas visuales y auditivas, a través del cambio de señal detectado al presionar un "push button" en particular. Las alertas visuales son controladas al cambiar el valor lógico de una serie de pines de salida del microcontrolador, mientras que las alertas auditivas son reguladas mediante comunicación serial con un módulo de audio ([DFPlayer Mini](https://wiki.dfrobot.com/DFPlayer_Mini_SKU_DFR0299)). A través de este módulo se reproduce un audio en específico, relacionado con la naturaleza de la alerta, o se interrumpe la reproducción del audio cuando éste ya no es necesario.

## Versiones
* AndonP1: Comprueba la lógica de encendido y apagado de las luces a partir de la presión de botones.
* AndonP2: Mismo programa que AndonP1, pero compilado para un microcontrolador PIC18F4550.
* AndonP3:
  - Incluye la librería mp3_chino para el control del módulo de audio DFPlayer Mini.
  - Agrega directivas #define para dar nombre a los pines correspondientes a botones y LEDs.
  - Utiliza comunicación serial con el módulo de audio a traves del pin RC6.
  - Reproduce una pista de audio determinada con el encendido de cada luz.
  - Agrega una condición para asegurar que sólo se encienda una luz/alarma a la vez.
* AndonP4: Utiliza un timer del microcontrolador para dar ciertos segundos a cada tipo de alerta antes de ser apagada (respondida). Si la alerta no es respondida en un tiempo determinado, se cambia el tipo de alerta al siguiente nivel.
* AndonP5: Al agregar un relay para el control de las luces, cambia el valor lógico de los pines del microcontrolador para encenderlas, con un 0 lógico en lugar de 1.
* AndonP6: Utiliza la interrupción por cambio en los pines del puerto B del microcontrolador para determinar si se presiona un botón.
* AndonP7:
  - Pone el microcontrolador en modo de baja potencia (`sleep`) hasta que se detecta la presión un botón.
  - Utiliza la interrupción por cambio en el puerto B para sacar al microcontrolador del estado `sleep`, por lo que se redefinieron los pines del puerto B.
  - La comunicación serial UART con el módulo de audio se detiene mientras el microcontrolador se encuentra en `sleep` y se reinicia cada vez que se presiona un botón.
  - El pin RC6 se encuentra en 0 lógico mientras el microcontrador está en modo `sleep`.
* AndonP8: Cambia las definiciones de pines del puerto B y cambia el valor lógico predeterminado de los pines de salida, respecto al programa anterior, para hacer uso del relay en el control de las luces.
