function dydt=ode_S43(t,w)
% This is the ode function that output five equations for X,Y1,Y2,Y3,Y4
% Scenario 4-3
% fu = 1.3 (increased level of UAIC(unprotected anal intercourse), 
% fp = 0.56 (average decrease in infectioness as a result of PrEP)

K13=0.56*0.8*1.3;
K23=0.56*0.8*1.3*0.5;
K33=0.56*0.8*1.3*0.5*0.4;
K43=0.56*0.8*1.3*0.5*0.04;
X=w(1);
Y1=w(2);
Y2=w(3);
Y3=w(4);
Y4=w(5);
K=(Y1*K13+Y2*K23+Y3*K33+Y4*K43)/(X+(Y1+Y2+Y3+Y4));
dX=3300-(1/33.3+K)*X;
dY1=0.5*K*X-(1/33.3+1/10+0.1667)*Y1;
dY2=(1-0.5)*K*X+0.1667*Y1+0.3*Y3+0.15*Y4-(1/33.3+1/10+1.4794)*Y2;
dY3=(1-0.8816)*(1.4794)*Y2+0.235*Y4-(1/33.3+1/17+0.3+0.3542)*Y3;
dY4=(0.8816)*(1.4794)*Y2+0.3542*Y3-(1/33.3+1/32+0.15+0.235)*Y4;

dydt=[dX;dY1;dY2;dY3;dY4];
end