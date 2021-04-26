clear all; close all; clc
eps=[.01 .05 .1 .2];
color=['r' 'b' 'k' 'g'];
xind=0:.001:1;
for i=1:1:length(eps)
    yapprox=[];
    C2=(1-exp(-1/2))/(-exp(-3/2-1/(3*eps(i)))+(exp(-1/2-8/(3*eps(i))))/4);
    C1=exp(-1)-C2*exp(-2-1/(3*eps(i)));
    for x=0:.001:1
        y = C1*exp(1/(1+x))+C2/((1+x)^2)*(exp(-1/(1+x)-((1+x)^3)/(3*eps(i))));
        yapprox=[yapprox y];
    end   
    figure(1)
    plot(xind,yapprox,color(i),'Linewidth',1.2)
    hold on
    xlabel('Distance [x]')
    ylabel('Amplitude Y(x)')
    axis([0 1 .99 1.6])
    legend('\epsilon = 0.01','\epsilon = 0.05','\epsilon = 0.1','\epsilon = 0.2')
end
