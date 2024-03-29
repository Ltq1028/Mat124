function dydt=ode_S41(t,y)
% This is the ode function that output five equations for X,Y1,Y2,Y3,Y4
% under Scenario 4-1: 
% fu = 1.1 (increased level of UAIC(unprotected anal intercourse), 
% fp = 0.56 (average decrease in infectioness as a result of PrEP)

K1=0.56*0.8*1.1;
K2=0.56*0.8*1.1*0.5;
K3=0.56*0.8*1.1*0.5*0.4;
K4=0.56*0.8*1.1*0.5*0.04;
X=y(1);
Y1=y(2);
Y2=y(3);
Y3=y(4);
Y4=y(5);
K=(Y1*K1+Y2*K2+Y3*K3+Y4*K4)/(X+(Y1+Y2+Y3+Y4));
dX=3300-(1/33.3+K)*X;
dY1=0.5*K*X-(1/33.3+1/10+0.1667)*Y1;
dY2=(1-0.5)*K*X+0.1667*Y1+0.3*Y3+0.15*Y4-(1/33.3+1/10+1.4794)*Y2;
dY3=(1-0.8816)*(1.4794)*Y2+0.235*Y4-(1/33.3+1/17+0.3+0.3542)*Y3;
dY4=(0.8816)*(1.4794)*Y2+0.3542*Y3-(1/33.3+1/32+0.15+0.235)*Y4;

dydt=[dX;dY1;dY2;dY3;dY4];
end
