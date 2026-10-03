clc; clear; close all;

dt = 0.1;                         % Time step
t1 = 0:dt:20;                     % Signal 1 duration
t2 = 0:dt:40;                     % Signal 2 duration

x1 = 2 * ones(size(t1));          % Rectangular signal 1
x2 = 3 * ones(size(t2));          % Rectangular signal 2

y = conv(x1, x2) * dt;            % Convolution (scaled by dt)

t_conv = 0:dt:(length(y)-1)*dt;   % Time vector

figure;
plot(t_conv, y, 'LineWidth', 2);
title('Convolution of Two Rectangular Signals');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
