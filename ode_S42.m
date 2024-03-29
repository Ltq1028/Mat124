function dydt=ode_S42(t,s)
% This is the ode function that output five equations for X,Y1,Y2,Y3,Y4
% Scenario 4-2
% fu = 1.2 (increased level of UAIC(unprotected anal intercourse), 
% fp = 0.56 (average decrease in infectioness as a result of PrEP)

K12=0.56*0.8*1.2;
K22=0.56*0.8*1.2*0.5;
K32=0.56*0.8*1.2*0.5*0.4;
K42=0.56*0.8*1.2*0.5*0.04;
X=s(1);
Y1=s(2);
Y2=s(3);
Y3=s(4);
Y4=s(5);
K=(Y1*K12+Y2*K22+Y3*K32+Y4*K42)/(X+(Y1+Y2+Y3+Y4));
dX=3300-(1/33.3+K)*X;
dY1=0.5*K*X-(1/33.3+1/10+0.1667)*Y1;
dY2=(1-0.5)*K*X+0.1667*Y1+0.3*Y3+0.15*Y4-(1/33.3+1/10+1.4794)*Y2;
dY3=(1-0.8816)*(1.4794)*Y2+0.235*Y4-(1/33.3+1/17+0.3+0.3542)*Y3;
dY4=(0.8816)*(1.4794)*Y2+0.3542*Y3-(1/33.3+1/32+0.15+0.235)*Y4;

dydt=[dX;dY1;dY2;dY3;dY4];
end
