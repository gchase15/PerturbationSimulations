clear all; close all; clc
eps=[.01 .05 .1 .2];
color=['r' 'b' 'k' 'g'];
xind=0:.001:1;
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
