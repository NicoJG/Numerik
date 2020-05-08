function c = myNewtonInterpol(x,f)
n = length(x)-1;
c = zeros(1,n+1);
c(1) = f(1);
for k = [1:n]
    for j = [0:k-1]
        if j == 0
            N = 1;
            p = c(1);
        else
            N = N * (x(k+1) - x(j+1));
            p = p + c(j+1)*N;
        end
    end
    c(k+1) = (f(k+1) - p)/N;
end
end