
t = linspace(-1, 12, 150);
y = 4 * exp(-((t - 5).^2) / 2);
figure;
plot(t, y, 'b', 'LineWidth', 2);
grid on;
hold on;
axis([-3 14 -2 5]);
xlabel('t');
ylabel('y(t)');
title('Courbe de la fonction y(t) = 4 exp(-(t-5)^2 / 2)');
hold off;

