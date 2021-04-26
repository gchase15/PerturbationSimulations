omega=1:.1:1000;
omega2 = 1:.5:1000;
eps = [.2 1.5 ];
delt = [1.5 .4 ];
a = sqrt(delt(1)+eps(1));
b = sqrt(delt(1)-eps(1));
a2 = sqrt(delt(2)+eps(2));
b2 = sqrt(delt(2)-eps(2));
%a3 = sqrt(delt(3)+eps(3));
%b3 = sqrt(delt(3)-eps(3));
T=2*pi./omega;

disc=2*cosh(a*T/2).*cosh(b*T/2)+(a/b+b/a).*sinh(a*T/2).*sinh(b*T/2);
disc2=2*cosh(a2*T/2).*cosh(b2*T/2)+(a2/b2+b2/a2).*sinh(a2*T/2).*sinh(b2*T/2);
%disc3=2*cosh(a3*T/2).*cosh(b3*T/2)+(a3/b3+b3/a3).*sinh(a3*T/2).*sinh(b3*T/2);
stab = 2.*ones(size(omega2));
stab2 = -2.*ones(size(omega2));

figure(1)
plot(omega,disc, 'b', 'Linewidth', [1.5])
hold on
plot(omega, disc2, 'r', 'Linewidth', [1.5])
%plot(omega, disc3, 'g', 'Linewidth', [1.5])
plot(omega2, stab, 'k.')
plot(omega2, stab2, 'k.')
axis([0 100 -4 4])
xlabel('Frequency \omega')
ylabel('\Gamma (\omega)')
legend('\delta > \epsilon', '\delta < \epsilon', 'Location', 'SouthEast')
%% "Compute" linear version
om=1.5:.2:100;
epsl = [0 1 .1 1 .1 3 0 10 4 5 12 2];
deltl = [1 0 1 .1 3 .1 10 0 6 3 11 7];
omthin = 1:.5:100;
stabl = 2.*ones(size(omthin));
stabl2 = -2.*ones(size(omthin));

leg = [];
for n=1:1:length(deltl)
   legbit=[epsl(n) deltl(n)];
   leg = [leg transpose(legbit)];
end

for j=1:1:length(deltl)
    discnum = [];
    discnuma = [];
    for i=1:1:length(om)
    per=2*pi/om(i);
    tind = 0:.001:per;
    F=@(t,y)[y(2); sin(y(1))*(deltl(j)+epsl(j)*sin(om(i)*t))];
    y1=[1;0];
    y2=[0,1];
    [T1,Y1]=ode45(F,tind,y1);
    [T2,Y2]=ode45(F,tind,y2);
    y2prime=gradient(Y2);
    discriminant = Y1((round(length(Y1)/2)),:) + y2prime((round(length(y2prime)/2)),:);
    discnum = [discnum transpose(discriminant)];
    end
    figure(3)
    plot(om, discnum(1,:), 'DisplayName', append('\epsilon =',string(leg(1,j)), ', \delta =', string(leg(2,j))))
    hold on
    axis([1 100 -2.5 6])
    xlabel('Frequency \omega')
    ylabel('\Gamma (\omega)')
    title('Nonlinear Inverted Pendulum')
    legend('show', 'Location', 'SouthEast')
end

    plot(omthin, stabl, 'k.', 'HandleVisibility', 'off')
    plot(omthin, stabl2, 'k.', 'HandleVisibility', 'off')
