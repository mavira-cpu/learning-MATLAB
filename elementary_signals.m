clc;
clear;
close all;

% Time vector
t = -5:0.01:5;

% Period for sawtooth
T = 2;

% ======================
% Signals
% ======================

rect = double(abs(t) <= 0.5);                 % Rectangular
tri = (1 - abs(t)) .* (abs(t) <= 1);          % Triangular
ramp = t .* (t >= 0);                         % Ramp
u = double(t >= 0);                           % Unit Step
s = (t>0)-(t<0);                                  % Sign
% Dirac approximation
dirac = zeros(size(t));
[~, idx] = min(abs(t));
dirac(idx) = 1;
cosf=cos(t);
% Sinus Cardinal
sinus_cardinal = sinc(t);
%
% Sawtooth
saw = mod(t, T);
saw = saw - T/2;

% ======================
% Plot Everything
% ======================

figure;

subplot(5,2,1)
plot(t, rect, 'LineWidth', 2)
grid on
title('Rectangular')

subplot(5,2,2)
plot(t, tri, 'LineWidth', 2)
grid on
title('Triangular')

subplot(5,2,3)
plot(t, ramp, 'LineWidth', 2)
grid on
title('Ramp')

subplot(5,2,4)
plot(t, u, 'LineWidth', 2)
grid on
title('U(t)')

subplot(5,2,5)
plot(t, s, 'LineWidth', 2)
grid on
title('Sign')

subplot(5,2,6)



stem(t, dirac, 'LineWidth', 2,'^')
grid on
title('Dirac')
subplot(5,2,7)

plot(t, sinus_cardinal, 'LineWidth', 2)
grid on
title('Sinus Cardinal (sinc)')
subplot(5,2,8)

plot(t, saw, 'LineWidth', 2)
grid on
title('Sawtooth')
subplot(5,2,9)
plot(t,cosf,'lineWidth',2);
grid on;
title("cos");

% Apply same axis to all
set(findall(gcf,'type','axes'),'XLim',[-5 5],'YLim',[-2 2])


