x = linspace(0, 4*pi, 100); % Creates 100 points between 0 and 2*pi
y = sin(x);
plot(x, y, 'r-')            % 'r-' makes a red solid line
grid on
title('Plot of Sine Function')
xlabel('x (radians)')
ylabel('sin(x)')
