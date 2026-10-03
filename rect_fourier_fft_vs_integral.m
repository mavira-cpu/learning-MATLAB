% 1. إعدادات الإشارة
t = -50:0.01:50;
dt = t(2) - t(1);
A = 1;
T = 20;
N = length(t);

% 2. إنشاء دالة المستطيل (Rect)
x = A * (abs(t) <= T/2);

% 3. حساب تحويل فورييه بالـ FFT (للحصول على الترددات والطور)
X_fft = fftshift(fft(ifftshift(x))) * dt;
f = (-N/2 : N/2-1) / (N * dt); % ناقل التردد الموحد

% 4. حساب تحويل فورييه بالتعريف (Integral) على نفس ناقل التردد
% ملاحظة: للحفاظ على سرعة التنفيذ سنختار عينة من الترددات أو نحسبها للكل
% هنا سأحسبها لنطاق الزووم (-0.5 إلى 0.5) لضمان التطابق
f_idx = find(f >= -0.5 & f <= 0.5); % تحديد المؤشرات المطلوبة فقط للسرعة
f_plot = f(f_idx);
X_integral = zeros(size(f_plot));

for i = 1:length(f_plot)
    X_integral(i) = sum(x .* exp(-1j*2*pi*f_plot(i)*t)) * dt;
end

% 5. تجهيز البيانات للرسم
mag_integral = abs(X_integral); % المطال من التكامل كما طلبت
phase_fft = rad2deg(angle(X_fft(f_idx))); % الطور من FFT
real_fft = real(X_fft(f_idx)); % الجزء الحقيقي من FFT

% تنظيف الطور
phase_fft(mag_integral < 1e-4) = 0;

% --- عرض النتائج ---
figure('Name', 'Analyse Fourier: Integral Magnitude vs FFT Phase', 'Color', 'w');

% الرسم 1: إشارة المستطيل في الزمن
subplot(4,1,1)
plot(t, x, 'b', 'LineWidth', 2)
title('1. Signal Rectangulaire x(t)')
grid on; ylim([-0.2 1.2]); xlim([-25 25]);

% الرسم 2: مطال التكامل (Magnitude from Integral)
subplot(4,1,2)
plot(f_plot, mag_integral, 'k', 'LineWidth', 2)
title('2. Spectre de Magnitude |X(f)| (Calculé par Intégrale)')
grid on; xlim([-0.5 0.5]); ylabel('abs(Integral)');

% الرسم 3: الجزء الحقيقي من FFT (Sinc)
subplot(4,1,3)
plot(f_plot, real_fft, 'g', 'LineWidth', 1.5)
title('3. FFT Real Part (Sinc)')
grid on; xlim([-0.5 0.5]); ylabel('real(FFT)');

% الرسم 4: طيف الطور من FFT
subplot(4,1,4)
plot(f_plot, phase_fft, 'm', 'LineWidth', 1.5)
title('4. Spectre de Phase (Calculé par FFT)')
grid on; xlim([-0.5 0.5]); ylim([-200 200]);
xlabel('Fréquence (Hz)'); ylabel('Phase (Deg)');
