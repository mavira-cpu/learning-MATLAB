
f0 = 5;
r = 10;
A = 1;
N = 1000;
Tmax = r/f0;
t = linspace(0, Tmax, N);
dt = t(2) - t(1);
x = A * cos(2*pi*f0*t);
f = linspace(-2*f0, 2*f0, N);
X_def = zeros(1, N);
for i = 1:N
    X_def(i) = sum(x .* exp(-1j*2*pi*f(i)*t)) * dt;
end
X_fft = fftshift(fft(x)) * dt;
f_fft = (-N/2 : N/2-1) * (1/(N*dt));
figure;
subplot(3,1,1);
plot(t, x,'m','linewidth',2);
title('Signal Cosinus (Temporel)');
grid on;
subplot(3,1,2);
plot(f, abs(X_def),'g','linewidth',2);
title('TF (Définition - Intégrale)');
grid on; xlim([-10 10]);
subplot(3,1,3);
plot(f_fft, abs(X_fft),'b','linewidth',2);
title('TF (Commande fft)');
xlabel('Fréquence (Hz)');
grid on; xlim([-10 10]);
