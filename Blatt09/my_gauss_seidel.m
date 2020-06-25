function [x,numit] = my_gauss_seidel(A,b,x0,eps,maxit)
x = x0;
e = 1;
emin = eps*(norm(A*x0-b)/norm(x0));
numit = 0;
n = length(x0);
%für Px(k+1)=Nx(k)+b
P = sparse(tril(A));
N = sparse(-1*triu(A,1));
while numit<=maxit && e>=emin
    oldX = x;
    x = P\(N*oldX+b);
    e = norm(A*x-b)/norm(x);
    numit = numit+1;
end
if numit > maxit
    warning('Die maximal Anzahl der Iterationen wurde überschritten!')
end
end