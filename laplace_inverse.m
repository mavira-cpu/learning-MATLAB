pkg load symbolic

syms s t x y real;
syms w positive;
disp(ilaplace(1, s, t))
disp(ilaplace(1/s, s, t))
disp(ilaplace(1/(s-1), s, t))
disp(ilaplace(1/(s^2+1), s, t))
disp(ilaplace(y/(y^2+w^2), y, x))
disp(ilaplace(2*s^(-3), s, t))
