function [t,w] = pendulum3(R,theta0,thetad0,gamma) 
% Finds the period of a nonlinear pendulum given the length of the pendulum
% arm and initial conditions. All angles in radians.

%Setting initial conditions
g=9.81;
omega = sqrt(g/R);
T= 2*pi/omega;
% number of oscillations to graph
N = 10;
tspan = [0 N*T];
opts = odeset('refine',6); %Here for future event finder
r0 = [theta0 thetad0];
[t,w] = ode45(@proj,tspan,r0,opts,g,R,gamma);
end
%-------------------------------------------
%
function rdot = proj(t,r,g,R,gamma)
    rdot = [r(2); -g/R*sin(r(1))-gamma*r(2)];
end

%function [value,isterminal,direction] = events(t,w)

% Locate the time when height passes through zero in

% a decreasing direction and stop integration.  
%if abs(w(1))-0.0001<0
    %else
    %value=1;
%end
%isterminal = 1;% stop  
%direction = 0; % any direction
%end