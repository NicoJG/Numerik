function [A,b] = my_test_system(n)
% Testmatrix fuer Aufgabe 9
    T = sparse(n,n); I = sparse(n,n);
    T = 4 * speye(n) - diag(ones(n-1,1),-1) - diag(ones(n-1,1),1);
    I = speye(n);

    A = sparse(n^2,n^2);
    for i = 1 : n
        idx = (i-1) * n + 1 : i*n;
        A(idx,idx) = T;
        if (i > 1)
            A(idx-n,idx) = -I;
            A(idx,idx-n) = -I;
        end
    end
    
     b = ones(n^2,1);
end