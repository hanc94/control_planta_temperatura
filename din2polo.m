function p=din2polo(MP_p,ts)

MP=MP_p/100;

coef_a=sqrt(log(MP)^2/(pi^2+log(MP)^2));

wn=4.6/(coef_a*ts);

p=-coef_a*wn+j*wn*sqrt(1-coef_a^2);
