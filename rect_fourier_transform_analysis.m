%% Convolution with Numerical Integral & Case Visualization
clear; clc; close all;

% 1. Define Functions
x_func = @(tau) (0.6 .* (tau >= -1.2 & tau <= 0.5)) + ...
                (0.3 .* (tau > 0.5 & tau <= 3.0));
h_func = @(t) (t >= 0) .* exp(-t);

% 2. Setup Plotting
t_tau = -4:0.01:6;
case_times = [-2.0, -0.2, 1.5, 4.5];
case_labels = {'Case 1: No Overlap', 'Case 2: First Step', ...
               'Case 3: Both Steps', 'Case 4: The Tail'};

figure('Color', 'w', 'Position', [100, 100, 1000, 800]);

for i = 1:4
    subplot(3, 2, i);
    t = case_times(i);

    % The "Flipped and Shifted" impulse response
    h_shifted = h_func(t - t_tau);

    % The Product (The Integrand)
    integrand = x_func(t_tau) .* h_shifted;

    % NUMERICAL INTEGRATION: Calculate the area for this specific t
    area_val = integral(@(tau) x_func(tau) .* h_func(t - tau), -2, 4);

    % Visuals
    plot(t_tau, x_func(t_tau), 'b', 'LineWidth', 1.5); hold on;
    plot(t_tau, h_shifted, 'r', 'LineWidth', 1.5);
    fill(t_tau, integrand, 'y', 'FaceAlpha', 0.4);

    title(sprintf('%s (t = %.1f, Area = %.3f)', case_labels{i}, t, area_val));
    grid on; ylim([-0.1 1.2]); xlim([-3 5]);
    legend('x(\tau)', 'h(t-\tau)', 'Integrand Area');
end

% 3. The Continuous Result
t_final = -2:0.05:8;
y_final = zeros(size(t_final));

for j = 1:length(t_final)
    % Using 'integral' for every single point to build the curve
    y_final(j) = integral(@(tau) x_func(tau) .* h_func(t_final(j) - tau), -1.2, 3.0);
end

subplot(3, 2, [5, 6]);
plot(t_final, y_final, 'm', 'LineWidth', 2); hold on;
for i = 1:4
    t_m = case_times(i);
    [~, idx] = min(abs(t_final - t_m));
    plot(t_m, y_final(idx), 'ko', 'MarkerFaceColor', 'y');
    text(t_m, y_final(idx) + 0.05, ['Case ', num2str(i)]);
end
title('Final Output y(t) via Numerical Integration');
xlabel('Time (t)'); ylabel('y(t)'); grid on;
