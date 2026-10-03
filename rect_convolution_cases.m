%% Convolution of Two Rectangular Pulses: Case Study
clear; clc; close all;

% 1. Parameters (fs=1 as per your code)
fs = 1;
t_tau = -10:fs:70; % Wider range to see the boxes moving

% 2. Define x(tau) and h(tau)
% x: Amplitude 2, Width 20
x = 2 * (t_tau >= 0 & t_tau <= 20);
% h: Amplitude 3, Width 40
h_base = 3 * (t_tau >= 0 & t_tau <= 40);

% 3. Calculate full convolution y(n) for the result plot
y_full = conv(x(x>0), h_base(h_base>0));
t_y = 0:fs:(length(y_full)-1);

% 4. Define 4 specific time points (shifts) to show the cases
case_shifts = [5, 15, 30, 55];
case_labels = {'Case 1: Partial Entry', 'Case 2: Full Entry (Plateau)', ...
               'Case 3: Still Inside Plateau', 'Case 4: Partial Exit'};

figure('Color', 'w', 'Name', 'Rectangle Convolution Subplots', 'Position', [100, 100, 1000, 800]);

for i = 1:4
    subplot(3, 2, i);

    t_shift = case_shifts(i);
    % Flip and shift h: h(t-tau)
    % h starts at 0, so shifted h starts at t_shift and goes backwards
    h_shifted = 3 * (t_tau <= t_shift & t_tau >= t_shift-40);

    product = x .* h_shifted;

    % Plot x and h_shifted
    plot(t_tau, x, 'b', 'LineWidth', 1.5); hold on;
    plot(t_tau, h_shifted, 'r', 'LineWidth', 1.5);
    fill(t_tau, product, 'y', 'FaceAlpha', 0.4); % Overlap Area

    title(case_labels{i});
    grid on; ylim([-0.5 4]); xlim([-10 70]);
    legend('x(\tau)', 'h(t-\tau)', 'Overlap');
end

% 5. Bottom subplot showing the final Trapezoid
subplot(3, 2, [5, 6]);
plot(t_y, y_full, 'm', 'LineWidth', 2); hold on;

% Add markers for the cases
for i = 1:4
    val = y_full(case_shifts(i) + 1);
    plot(case_shifts(i), val, 'ko', 'MarkerFaceColor', 'y');
    text(case_shifts(i), val + 10, ['Case ', num2str(i)], 'HorizontalAlignment', 'center');
end

title('Final Result: The Convolution Trapezoid');
xlabel('Time (t)'); ylabel('Amplitude');
grid on;
