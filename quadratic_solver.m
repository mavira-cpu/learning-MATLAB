% Script to solve ax^2 + bx + c = 0
a = input('Enter a: ');
b = input('Enter b: ');
c = input('Enter c: ');
delta = b^2 - 4*a*c;
if delta > 0
   x1 = (-b + sqrt(delta)) / (2*a);
   x2 = (-b - sqrt(delta)) / (2*a);
   disp(['Two real roots: ', num2str(x1), ' and ', num2str(x2)]);
elseif delta == 0
   x = -b / (2*a);
   disp(['One double root: ', num2str(x)]);
else
   x1 = (-b + 1i*sqrt(abs(delta))) / (2*a);
   x2 = (-b - i*sqrt(abs(delta))) / (2*a);
   disp('Two complex roots');
end

