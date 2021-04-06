clear all; close all; clc

A=[.5 2.5 5.6];
eps=[.01 .1 .2 .3];
tind = 0:.1:40;

%% Compute Multiple Scale and Numerical Solutions, Plot them, and calculate Error
for n=1:1:length(A)
    for i=1:1:length(eps)
        ymsapprox = [];
        T = [];
        Y = [];
        for t=0:.1:40
            yms=((2*A(n))/sqrt((A(n)^2)+(4-(A(n)^2))*exp(-eps(i)*t)))*sin(t);
            ymsapprox = [ymsapprox yms];
        end
        F=@(t,y)[y(2); -y(1)-(((y(2)^3)/3)-y(2))*eps(i)];
        y0=[0;A(n)];
        [T,Y]=ode45(F,tind,y0);
        figure(n)
        subplot(2,2,i)
        plot(tind,ymsapprox,'k','Linewidth',1.5)
        hold on
        plot(tind,Y(:,1),'r--','Linewidth',1.5)
        title(append('Epsilon =', num2str(eps(i))))
        xlabel('Time [t]')
        ylabel('Amplitude y(t)')
        axis([0 40 -4.5 5.5])
        sgtitle(append('Problem 2c, A=', num2str(A(n))))
        if i==4
            legend('Multiple Scales','Numerical', 'Location', 'NorthEast')  
        end
        %Calculate Error plots
        Yerr= Y(:,1)';
        errArray = [];
        for j=1:1:length(tind)
             error =abs(Yerr(j)-ymsapprox(j));
             errArray = [errArray error];
        end
        figure(n+length(A))
        subplot(2,2,i)
        plot(tind,errArray,'k','Linewidth',1.5)
        title(append('Epsilon =', num2str(eps(i))))
        xlabel('Time [t]')
        ylabel('Error E(t)')
        axis([0 40 -0.01 .6])
        sgtitle(append('Problem 2d, A=', num2str(A(n))));
    end
end


%% Poincare Lindstedt of the Rayleigh Limit Cycle

for i=1:1:length(eps)
    yplapprox= [];
    for t=0:.1:40
        ypl=2*sin((1-(eps(i)^2)/16)*t)+eps(i)/12*(cos(3*(1-(eps(i)^2)/16)*t)-cos((1-(eps(i)^2)/16)*t));
        yplapprox = [yplapprox ypl];
    end
    figure(2*length(A)+1)
    subplot(2,2,i)
    plot(tind,ymsapprox,'k','Linewidth',1.5)
    title(append('Epsilon =', num2str(eps(i))))
    xlabel('Time [t]')
    ylabel('Amplitude y(t)')
    axis([0 40 -3 3.5])
    sgtitle(append('Limit Cycle of the Rayleigh Equation'))
end
