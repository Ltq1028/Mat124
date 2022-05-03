function dydt=ode_S3(t,b)
% This is the ode function that output five equations for X,Y1,Y2,Y3,Y4
% scenario 3
% fu = 1 (increased level of UAIC(unprotected anal intercourse), 
% fp = 0.56 (average decrease in infectioness as a result of PrEP)

K14=0.56*0.8*1;
K24=0.56*0.8*1*0.5;
K34=0.56*0.8*1*0.5*0.4;
K44=0.56*0.8*1*0.5*0.04;
X=b(1);
Y1=b(2);
Y2=b(3);
Y3=b(4);
Y4=b(5);
K=(Y1*K14+Y2*K24+Y3*K34+Y4*K44)/(X+(Y1+Y2+Y3+Y4));
dX=3300-(1/33.3+K)*X;
dY1=0.5*K*X-(1/33.3+1/10+0.1667)*Y1;
dY2=(1-0.5)*K*X+0.1667*Y1+0.3*Y3+0.15*Y4-(1/33.3+1/10+1.4794)*Y2;
dY3=(1-0.8816)*(1.4794)*Y2+0.235*Y4-(1/33.3+1/17+0.3+0.3542)*Y3;
dY4=(0.8816)*(1.4794)*Y2+0.3542*Y3-(1/33.3+1/32+0.15+0.235)*Y4;

dydt=[dX;dY1;dY2;dY3;dY4];
end