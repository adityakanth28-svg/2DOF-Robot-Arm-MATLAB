clc;
clear;
close all;

% Link lengths
L1 = 1;
L2 = 0.8;

% Time
t = linspace(0,5,200);

% Joint angles (in radians)
theta1 = pi/4 * sin(t);
theta2 = pi/6 * cos(t);

for i = 1:length(t)
    
    % Joint positions
    x1 = L1*cos(theta1(i));
    y1 = L1*sin(theta1(i));
    
    x2 = x1 + L2*cos(theta1(i) + theta2(i));
    y2 = y1 + L2*sin(theta1(i) + theta2(i));
    
    % Plot arm
    plot([0 x1 x2], [0 y1 y2],'o-','LineWidth', 3,'MarkerSize',8)
    axis equal
    axis([-2 2 -2 2])
    grid on
    drawnow
    
end