function [t,w] = pendulum(R,theta0,thetad0,grph) 
% Finds the period of a nonlinear pendulum given the length of the pendulum
% arm and initial conditions. All angles in radians.

%Setting initial conditions
if nargin==0
    error('Must input length and initial conditions')
end
if nargin==1
   theta0 = pi/2;
   thetad0=0;
   grph=0;
end
if nargin==2
    thetad0 = 0;
    grph=1;
end
if nargin==3
    grph=1;
end
g=9.81;
omega = sqrt(g/R);
T= 2*pi/omega;
% number of oscillations to graph
N = 10;
tspan = [0 N*T];
opts = odeset('refine',6); 
r0 = [theta0 thetad0];
[t,w] = ode45(@proj,tspan,r0,opts,g,R);
end
%-------------------------------------------
%
function rdot = proj(t,r,g,R)
    rdot = [r(2); -g/R*r(1)];
end