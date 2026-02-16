clc;
clear;
close all;

% Link lengths
L1 = 1;
L2 = 0.8;

% Target point
x_target = 1.2;
y_target = 0.5;

% Inverse Kinematics
cos_theta2 = (x_target^2 + y_target^2 - L1^2 - L2^2) / (2*L1*L2);
theta2 = atan2(sqrt(1 - cos_theta2^2), cos_theta2);

theta1 = atan2(y_target, x_target) - ...
         atan2(L2*sin(theta2), L1 + L2*cos(theta2));

% Joint positions
x1 = L1*cos(theta1);
y1 = L1*sin(theta1);

x2 = x1 + L2*cos(theta1 + theta2);
y2 = y1 + L2*sin(theta1 + theta2);

% Plot arm
plot([0 x1 x2], [0 y1 y2], 'o-', 'LineWidth', 3)
hold on
plot(x_target, y_target, 'r*', 'MarkerSize', 10)
axis equal
axis([-2 2 -2 2])
grid on
title('2-DOF Robot Arm Reaching Target')