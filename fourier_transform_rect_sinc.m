
t = -50:0.01:50;
dt = t(2) - t(1);
A = 1;
T = 20;
N = length(t);

%
x = A * (abs(t) <= T/2);

f_range = linspace(-0.5, 0.5, 500);
X_integral = zeros(size(f_range));
for i = 1:length(f_range)
    X_integral(i) = sum(x .* exp(-1j*2*pi*f_range(i)*t)) * dt;
end

X_fft_raw = fftshift(fft(ifftshift(x))) * dt;
f_fft = (-N/2 : N/2-1) / (N * dt);


magnitude_fft = abs(X_fft_raw);
phase_fft = rad2deg(angle(X_fft_raw));
phase_fft(magnitude_fft < 1e-4) = 0;


figure('Name', 'Rect: Time, Integral Magnitude, FFT Real, and Phase', 'Color', 'w');


subplot(4,1,1)
plot(t, x, 'b', 'LineWidth', 2)
title('1. Signal Rectangulaire x(t)')
grid on; ylim([-0.2 1.2]); xlim([-25 25]);
ylabel('x(t)');

\
subplot(4,1,2)
plot(f_range, abs(X_integral), 'k', 'LineWidth', 2)
title('2. Magnitude |X(f)| ( Intégrale)')
grid on; xlim([-0.5 0.5]);
ylabel('|Integral|');

subplot(4,1,3)
plot(f_fft, real(X_fft_raw), 'LineWidth', 2, 'Color', [0 0.45 0.74])
title('3. Transformée de Fourier (Par FFT - Real Part)')
grid on; xlim([-0.5 0.5]);
ylabel('Real(FFT)');


subplot(4,1,4)
plot(f_fft, phase_fft, 'm', 'LineWidth', 1.5)
title('4. Spectre de Phase \angle X(f) (Par FFT)')
xlabel('Fréquence (Hz)'); ylabel('Phase (Deg)');
grid on; xlim([-0.5 0.5]); ylim([-200 200]);
