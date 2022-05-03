function dydt=ode_CS(t,v)
% This is the ode function that output five equations for X,Y1,Y2,Y3,Y4
% Current situation: real life situation
% fu = 1 (increased level of UAIC(unprotected anal intercourse), 
% fp = 1 (average decrease in infectioness as a result of PrEP)
% v => population function

K15=1*0.8*1; % K1 = fp * fu * bc
K25=1*0.8*1*0.5; % K2 = fp * fu * fd * bc
K35=1*0.8*1*0.5*0.4; % K3 = fp * fu * fd * ftf * bc
K45=1*0.8*1*0.5*0.04; % K4 = fp * fu * fd * fts * bc
X=v(1);
Y1=v(2);
Y2=v(3);
Y3=v(4);
Y4=v(5);
K=(Y1*K15+Y2*K25+Y3*K35+Y4*K45)/(X+(Y1+Y2+Y3+Y4));
dX=3300-(1/33.3+K)*X;
dY1=0.5*K*X-(1/33.3+1/10+0.1667)*Y1;
dY2=(1-0.5)*K*X+0.1667*Y1+0.3*Y3+0.15*Y4-(1/33.3+1/10+1.4794)*Y2;
dY3=(1-0.8816)*(1.4794)*Y2+0.235*Y4-(1/33.3+1/17+0.3+0.3542)*Y3;
dY4=(0.8816)*(1.4794)*Y2+0.3542*Y3-(1/33.3+1/32+0.15+0.235)*Y4;

dydt=[dX;dY1;dY2;dY3;dY4];