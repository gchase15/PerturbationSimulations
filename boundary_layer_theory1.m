clear all; close all; clc
eps=[.01 .05 .1 .2];
color=['r' 'b' 'k' 'g'];
xind=0:.001:1;
for i=1:1:length(eps)
    yapprox=[];
    yapprox=[];
    for x=0:.001:1
        xi=x/eps(i);
        y = exp(-1/2)*exp(1/(1+x))*(1+eps(i)*((7+5*x)/(10*((1+x)^5))-3/80))+(1-exp(1/2)*(1+eps(i)*(.7-3/80)))*exp(-x/eps(i));
        yapprox=[yapprox y];
    end   
    figure(1)
    plot(xind,yapprox,color(i),'Linewidth',1)
    hold on
    xlabel('Distance [x]')
    ylabel('Amplitude Y(x)')
    axis([0 1 .99 1.6])
    legend('\epsilon = 0.01', '\epsilon = 0.05', '\epsilon = 0.1', '\epsilon = 0.2')
end

%% Problem 2

for i=1:1:length(eps)
    ydbapprox=[];
    for x=0:.001:1
        ydb=exp(-x/sqrt(eps(i)))+exp(-(1-x)/eps(i));
        ydbapprox =[ydbapprox ydb];
    end 
    figure(2)
    plot(xind,ydbapprox,color(i),'Linewidth',1.5)
    xlabel('Distance [x]')
    ylabel('Amplitude Y(x)')
    %axis([0 1 .99 1.6])
    hold on
    if i==4
        legend('\epsilon = 0.01', '\epsilon = 0.05', '\epsilon = 0.1', '\epsilon = 0.2', 'Location', 'NorthWest')
    end
end




