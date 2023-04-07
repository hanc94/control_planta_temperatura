function [num, den]=d_pdd(planta,polo_d)
%Funci�n que dise�a un controlador PD de tiempo discreto
%para planta de tal forma que un polo de lazo cerrado sea polo_d.
%
%num y den son los coeficientes de los polinomios del denominador y del
%numerador del controlador respectivamente.

[k_d, theta_d ]=rlocfind2(planta,polo_d);

%Fase que debe poner el cero
fase=theta_d+angle(polo_d);
z_c=real(polo_d)-imag(polo_d)/tan(fase);
z_p=0;
num=[1 -z_c];
den=[1 -z_p];
k=k_d/abs(polyval(num,polo_d)/polyval(den,polo_d));
num=k*num;
