clc
clear all
g=9.81;
R=g/9;
theta0=0.25;
thetad0=0;
[t,w]=pendulum(R,theta0,thetad0);
E0=0.5*R^2*thetad0^2-g*R*cos(theta0);
K=0.5*R^2*w(:,2).^2;
V=-g*R*cos(w(:,1));
ind= find(w(:,2).*circshift(w(:,2), [-1 0]) <= 0);
for i=1:ind(2)
delta_E(i)=(K(i)+V(i)-E0)/E0;
end

for i=1:length(ind)-1
    for j=1:ind(i+1)-ind(i)-1
        E1(j)=K(ind(i)+j-1);
        V1(j)=V(ind(i)+j-1);
    end
    avgK(i)=mean(E1);
    avgV(i)=mean(V1);
end

subplot(4,2,1)
plot(delta_E)
subplot(4,2,3)
plot(t,w(:,1))
subplot(4,2,4)
plot(t,w(:,2))
subplot(4,2,5)
plot(avgK)
hold on
plot(avgV)
hold off

for i=1:10
    for j= 1:10
        theta0=12*j*pi/20-3*pi;
        thetad0=2*i-10;
    [t,w]=pendulum(R,theta0,thetad0);
    subplot(4,2,7)
    plot(w(:,1),w(:,2))
    axis([-10 10 -10 10])
    hold on 
    end
end
hold off



