%% Generate Approximations and Numerical Solution
clear all; close all,; clc

A=1.3;
eps=.1;
yrapprox = []; %Regular Perturbation collection
yplapprox = [];%Poincare-Linstedt collection
omega=1+eps*5/16*(A^4); %Freq shift
tind = 0:.1:20;
for t=0:.1:20
    yreg=A*sin(t)+eps*(((5*(A^5))/16)*t*cos(t)+(73*(A^5)/192)*sin(t)-(14*(A^5)/192)*cos(2*t)*sin(t)+(A^5)/192*cos(4*t)*sin(t));
    yrapprox = [yrapprox yreg];
    ypl=A*sin(omega*t)+eps*((A^5)/192*sin(omega*t)*(13-14*cos(2*omega*t)+cos(4*omega*t)));
    yplapprox = [yplapprox ypl];
end
%Numerical Solution
F=@(t,y)[y(2); -y(1)-((y(1)^5)*eps)];
y0=[0;A];
[T,Y]=ode45(F,tind,y0);

%% Plot the Results
figure(1)
plot(tind,yrapprox,'b') 
hold on
plot(tind, yplapprox, 'g')
plot(T,Y(:,1),'m')
title('Problem 1: A=1.1')
xlabel('time [t]')
ylabel('amplitude y(t)')
legend('Reg Perturbation', 'Poincare-Linstedt','Numerical', 'Location', 'NorthWest')
