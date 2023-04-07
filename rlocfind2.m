function [k_d, theta_d, polo_d]=rlocfind2(planta,polo_d)


[num_planta, den_planta]=tfdata(planta,'v');
angulo_planta=angle(polyval(num_planta,polo_d)/polyval(den_planta,polo_d));

theta_d=((angulo_planta>=0)*pi+(angulo_planta<0)*(-pi)-angulo_planta);

k_d=1/abs(polyval(num_planta,polo_d)/polyval(den_planta,polo_d));
