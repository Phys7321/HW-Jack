function [t,w] = pendulum4(R,theta0,thetad0,gamma,ome) 
% Finds the period of a nonlinear pendulum given the length of the pendulum
% arm and initial conditions. All angles in radians.

%Setting initial conditions
g=9.81;
omega = sqrt(g/R);
T= 2*pi/omega;
% number of oscillations to graph
N = 20;
tspan = [0 N*T];
opts = odeset('refine',6); 
r0 = [theta0 thetad0];
[t,w] = ode45(@proj,tspan,r0,opts,g,R,gamma,ome);
end
%-------------------------------------------
%
function rdot = proj(t,r,g,R,gamma,ome)
    rdot = [r(2); -g/R*sin(r(1)) - gamma*r(2) + cos(ome*t)];
end