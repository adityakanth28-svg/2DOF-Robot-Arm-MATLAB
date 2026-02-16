clc;
clear;
close all;

% Link lengths
L1 = 1;
L2 = 0.8;

% Two target points
x_start = 0.8;
y_start = 0.4;

x_end = 1.2;
y_end = 0.6;

% Interpolation steps for smooth animation
steps = 100;
x_traj = linspace(x_start, x_end, steps);
y_traj = linspace(y_start, y_end, steps);

figure
for i = 1:steps
    
    x_target = x_traj(i);
    y_target = y_traj(i);
    
    % Inverse Kinematics
    cos_theta2 = (x_target^2 + y_target^2 - L1^2 - L2^2) / (2*L1*L2);
    theta2 = atan2(sqrt(1 - cos_theta2^2), cos_theta2);
    
    theta1 = atan2(y_target, x_target) - ...
        atan2(L2*sin(theta2), L1 + L2*cos(theta2));
    
    % Joint positions
    x1 = L1*cos(theta1);
    y1 = L1*sin(theta1);
    z1 = 0;
    
    x2 = x1 + L2*cos(theta1 + theta2);
    y2 = y1 + L2*sin(theta1 + theta2);
    z2 = 0;
    
    % Plot in 3D
    plot3([0 x1 x2], [0 y1 y2], [0 z1 z2], 'o-', 'LineWidth', 3)
    hold on
    plot3(x_target, y_target, 0, 'r*', 'MarkerSize', 10)
    hold off
    
    axis equal
    axis([-2 2 -2 2 -1 1])
    grid on
    view(45,30)
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    title('3D Animated Robot Arm')
    
    drawnow
end