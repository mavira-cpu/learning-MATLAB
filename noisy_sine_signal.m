sn = 1:128;
A = 5;
x = A * sin(pi * sn / 12);
r = randn(1, 128);
% noisy signal s(n)
s = x + r;
figure;
plot(sn, x, 'b', 'LineWidth', 2); hold on;
plot(sn, s, 'r', 'LineWidth', 1);
title('x(n) and Noisy Signal s(n)');
legend('x(n)','s(n)');
ylabel('Amplitude');
grid on;
hold off;
