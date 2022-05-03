% This file is aiming to reproduce the simulation in Figure 3.
% Comparing the number of incident hIV cases (KX) and prevalent HIV cases
% (Y1-4)bewteen current situation and efficacy of PrEP (scenario 3 to 4-1,
% 4-2, and 4-3.

clear all, close all;
% Initial condition from the paper Table S1
y0=[133077,3438,1213,1219,2843]; %[x_0, y1_0, y2_0, y3_0, y4_0] 

% The simulation from the paper is for a 40 year prediction
tspan=0:1:40;

% Solving ODE under different Scenario 
[t,y]=ode45(@(t,y) ode_S41(t,y),tspan,y0); % Scenario 4-1
[t,s]=ode45(@(t,s) ode_S42(t,s),tspan,y0); % Scenario 4-2
[t,w]=ode45(@(t,w) ode_S43(t,w),tspan,y0); % Scenario 4-3
[t,b]=ode45(@(t,b) ode_S3(t,b),tspan,y0); % Scenario 3
[t,v]=ode45(@(t,v) ode_CS(t,v),tspan,y0); % Current Situation

% KX number of HIV incident
figure(1); hold on;
[KX,KX2,KX3,KX4,KX5] = KX(y,s,w,b,v);
plot(tspan,KX5,'-sb','MarkerIndices',1:5:length(KX5),'LineWidth',1.05);
plot(tspan,KX4,'-or','MarkerIndices',1:5:length(KX4),'LineWidth',1.05);
plot(tspan,KX,'-*g','MarkerIndices',1:5:length(KX),'LineWidth',1.05);
plot(tspan,KX2,'-+m','MarkerIndices',1:5:length(KX2),'LineWidth',1.05);
plot(tspan,KX3,'-dk','MarkerIndices',1:5:length(KX3),'LineWidth',1.05);
xlabel('year'); ylabel('Number(KX)');
yline(1000:1000:9000,':')
legend('Current Situation', 'Scenario 3', 'Scenario 4-1', 'Scenario 4-2', 'Scenario 4-3');
hold off;

% sum (Y1,Y2,Y3,Y4) sum of the infected people
Y=y(:,5)+y(:,2)+y(:,3)+y(:,4);
Y2=s(:,5)+s(:,2)+s(:,3)+s(:,4);
Y3=w(:,5)+w(:,2)+w(:,3)+w(:,4);
Y4=b(:,5)+b(:,2)+b(:,3)+b(:,4);
Y5=v(:,5)+v(:,2)+v(:,3)+v(:,4);
figure(2); hold on;
plot(tspan,Y5,'-sb','MarkerIndices',1:5:length(Y5),'LineWidth',1.05);
plot(tspan,Y4,'-or','MarkerIndices',1:5:length(Y4),'LineWidth',1.05);
plot(tspan,Y,'-*g','MarkerIndices',1:5:length(Y),'LineWidth',1.05);
plot(tspan,Y2,'-+m','MarkerIndices',1:5:length(Y2),'LineWidth',1.05);
plot(tspan,Y3,'-dk','MarkerIndices',1:5:length(Y3),'LineWidth',1.05);
xlabel('year'); ylabel('Number(Y1-4)');
ylim([0,7e4]);
yline(0:10000:70000,':')
legend('Current Situation','Scenario 3','Scenario 4-1', 'Scenario 4-2', 'Scenario 4-3' );
hold off;

% Solution from ode45 for Scenario 4-1
figure(3); hold on;
plot(tspan,y);
xlabel('year'); ylabel('Population');
legend('X','Y1','Y2', 'Y3', 'Y4' )
hold off;