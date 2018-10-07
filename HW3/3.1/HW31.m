clc
clear all
g=9.81;
R=g/9;
theta0=0.25;
thetad0=0;
[t,w]=pendulum(R,theta0,thetad0);
E0=0.5*R^2*thetad0^2+0.5*9*R^2*(sin(theta0)).^2;
K=0.5*R^2*w(:,2).^2;
V=0.5*9*R^2*(sin(w(:,1))).^2;
ind= find(w(:,2).*circshift(w(:,2), [-1 0]) <= 0);
for i=1:length(t)
delta_E(i)=(K(i)+V(i)-E0)/E0;
end

for i=1:length(ind)-1
    for j=1:ind(i+1)-ind(i)
        E1(j)=K(ind(i)+j-1);
        V1(j)=V(ind(i)+j-1);
        t1(j)=t(ind(i)+j-1);
    end
    avgK(i)=mean(E1);
    avgV(i)=mean(V1);
    avgt(i)=mean(t1);
    E1=zeros;
    V1=zeros;
    t1=zeros;
end

subplot(4,2,1)
plot(t,delta_E)
xlabel('t')
ylabel('$\Delta_n$','interpreter','latex')
title('Relative change in total energy as a function of time')
subplot(4,2,3)
plot(t,w(:,1))
xlabel('t')
ylabel('\theta')
title('Position as a function of time')
subplot(4,2,4)
plot(t,w(:,2))
xlabel('t')
ylabel('$\dot{\theta}$','interpreter','latex')
title('Velocity as a function of time')
subplot(4,2,5)
plot(avgt,avgK,'k-',avgt,avgV,'b-')
legend('Average Kinetic Energy','Average Potential Energy')
xlabel('t')
ylabel('$E_{avg}$','interpreter','latex')
title('Average kinetic energy and potential energy as a function of time')


for i=1:10
    for j= 1:10
        theta0=12*j*pi/20-3*pi;
        thetad0=2*i-10;
    [t,w]=pendulum(R,theta0,thetad0);
    subplot(4,2,7)
    plot(w(:,1),w(:,2))
    hold on 
    end
end
axis([-10 10 -10 10])
xlabel('\theta')
ylabel('$\dot{\theta}$','interpreter','latex')
title('Phase diagram')
hold off



