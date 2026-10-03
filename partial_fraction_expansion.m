
pkg load symbolic

% H(s) = (2s^3 + 5s^2 + 3s + 6) / (s^3 + 6s^2 + 11s + 6)
num = [2 5 3 6];
den = [1 6 11 6];
fprintf('Fonction de Transfert H(s) :\n');
[r, p, k] = residue(num, den);
fprintf('\nRésultats du développement :\n');
fprintf('Résidus (r) : \n'); disp(r);
fprintf('Pôles (p) : \n'); disp(p);
fprintf('Terme direct (k) : \n'); disp(k);
