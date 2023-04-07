clc;
clear all;
close all;

%Periodo de muestreo
Ts=0.5;

%Frecuencia de muestreo
fs=1/Ts;
 
 
 %Modelo de tiempo continuo 
 Hs=tf(1,[ 1 0 0]); 

 
%Respuesta al escalón 
 figure;
 [y,t]=step(Hs);
 plot(t,y,'b');
 
 
 
 %Diseño del controlador
 
 %Dinámica deseada
 ts_d=150;
 MP_d=0.1;
 
 %Dinámica deseada de lazo cerrado en tiempo continuo 
 polo_d=din2polo(MP_d,ts_d);
 
%Dinámica de deseada de lazo cerrado en tiempno discreto
 polo_dd=exp(polo_d/fs);
 
%Discretiza planta
 Hz=c2d(Hs,1/fs,'zoh');
 
%Diseña controlador PD en tiempo discreto
[num_c, den_c]=d_pdd(Hz,polo_dd);
 

%Función de transferencia del controlador  
 Hc=tf(num_c,den_c,1/fs);

%Función de transferencia total de lazo abierto 
Hol=minreal(Hz*Hc);

%Función de transferencia en lazo cerrado
 Hcl=feedback(Hol,1);

%Respuesta al escalón del sistema controlado
 figure;
 step(Hcl);
 title('Voltaje de salida');
 
%Gráfica del esfuerzo de control
 Hclu=feedback(Hc,Hz);
 figure;
 step(Hclu);
 title('Esfuerzo de control');
 
