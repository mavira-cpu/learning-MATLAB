pkg load symbolic


syms a s t w x;

fprintf('1. laplace(10): \n');
disp(laplace(10, t, s));

fprintf('2. laplace(t^5): \n');
disp(laplace(t^5, t, s));

fprintf('3. laplace(exp(a*t)): \n');
disp(laplace(exp(a*t), t, s));

fprintf('4. laplace(sin(w*x), t): \n');
disp(laplace(sin(w*x), t));
fprintf('5. laplace(sin(w*x), s): \n');
disp(laplace(sin(w*x), s));
fprintf('6. laplace(cos(w*x), w,t): \n');
disp(laplace(sin(w*x),w,t));

fprintf('7. laplace(t^(3/2)): \n');
disp(laplace(t^(sym(3)/2),  s));

fprintf('8. laplace(dirac(t)): \n');
disp(laplace(dirac(t), t, s));
