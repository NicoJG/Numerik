function [v] = myQuadraturSum1D(f,w,p,a,b,N)
v = 0;
h = (b-a)/N;
R = length(p);
% Summe der Teilintervalle
for i = 1:N
    x1 = a + (i-1)*h;
    x2 = a + i*h;
    % Summe der der Quadratur (transformierte Stützstellen)
    for k = 1:R
        v = v + (x2-x1)/2 * w(k) * f((p(k)+1)*(x2-x1)/2 + x1);
    end
end
end