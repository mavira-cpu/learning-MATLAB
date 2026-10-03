
t = 0:0.001:4;
T = 2;
w = pi;

N_values = [1 3 9 29];

figure;

for i = 1:length(N_values)

    N = N_values(i);
    x = zeros(size(t));
    b = zeros(1, N);
    for n = 1:N
        if mod(n,2) == 1

            b(n) = 4/(n*pi);
            x = x + b(n)*sin(n*w*t);

        end
    end

    subplot(4,2,2*i-1)
    plot(t,x,'LineWidth', 2)
    title(['N = ' num2str(N)])
    ylim([-1.5 1.5])
    grid on

    subplot(4,2,2*i)
    stem(1:N, b, 'm', 'LineWidth', 2)
    title('Spectrum')
    grid on

end
