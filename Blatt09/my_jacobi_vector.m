function [x,numit] = my_jacobi_vector(A,b,x0,eps,maxit)
x = x0;
e = NaN;
emin = eps*(norm(A*x0-b)/norm(x0));
numit = 0;
n = length(x0);
%für Px(k+1)=Nx(k)+b
P = spdiags(spdiags(A,0),0,n,n);
Pinv = spdiags(1./spdiags(A,0),0,n,n);
N = P-A;
while numit<=maxit && (isnan(e) || e>=emin)
    oldX = x;
    x = Pinv*(N*oldX+b);
    e = norm(A*x-b)/norm(x);
    numit = numit+1;
end
if numit > maxit
    warning('Die maximal Anzahl der Iterationen wurde überschritten!')
end
end

