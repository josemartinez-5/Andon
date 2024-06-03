#line 1 "C:/Users/bloat/Documents/Andon/AndonP1/AndonP1.c"
#line 17 "C:/Users/bloat/Documents/Andon/AndonP1/AndonP1.c"
void main() {


 NOT_RBPU_BIT = 0;

 TRISB = 0b00001111;

 PORTB = 0b00000000;

 while(1){


 if(Button(&PORTB, 0, 5, 0)){


 RB4_bit = ~RB4_bit;


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
