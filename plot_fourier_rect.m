function plot_fourier_rect(N)
    % N: Number of harmonics (should be an odd integer)

    t = -2:0.001:2; % High resolution time vector
    x = zeros(size(t));

    % Summing the odd harmonics up to N
    for n = 1:2:N
        term = (4/(n*pi)) * sin(n*pi*t);
        x = x + term;
    end

    % Plotting the result
    plot(t, x, 'LineWidth', 2);
    grid on;
    title(['Fourier Synthesis with N = ', num2str(N), ' Harmonics']);
    xlabel('Time (t)');
    ylabel('Amplitude');
    ylim([-1.5 1.5]);
end
