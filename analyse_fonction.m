% 1) Définir l'intervalle de la variable x
x = linspace(-5, 5, 200);   % 200 points entre -5 et 5
% Définition de la fonction f(x) = x^2 - 1
f = x.^2 - 1;
figure;
subplot(2,1,1);              % 2 graphiques, 1 colonne, position 1
plot(x, f, 'b', 'LineWidth', 2);
grid on;
title('f(x) = x^2 - 1');
xlabel('x');
ylabel('f(x)');
% 3) Tracer la dérivée f''(x)
fp = 2*x;                    % dérivée de x^2 - 1
subplot(2,1,2);              % position 2
plot(x, fp, 'r', 'LineWidth', 2);
grid on;
title('f''(x) = 2x');
xlabel('x');
ylabel('f''(x)');
les solutions :

