function [x,numit] = my_gauss_seidel(A,b,x0,eps,maxit,omega)
x = x0;
e = 1;
emin = eps*(norm(A*x0-b)/norm(x0));
numit = 0;
n = length(x0);

D = spdiags(spdiags(A,0),0,n,n);
L = sparse(tril(A,-1));
R = sparse(triu(A,1));

H = sparse(inv(D+omega*L)*((1-omega)*D-omega*R));
c = omega*inv(D+omega*L)*b;

while numit<=maxit && e>=emin
    oldX = x;
    x = H*oldX+c;
    e = norm(A*x-b)/norm(x);
    numit = numit+1;
end
if numit > maxit
    warning('Die maximal Anzahl der Iterationen wurde überschritten!')
end
end