clc;close all;clear all;
format long;

n = [10:60];
it_jacobi = zeros(length(n),1);
it_jacobi_vector = zeros(length(n),1);
it_gauss_seidel = zeros(length(n),1);
it_sor = zeros(length(n),1);

t = zeros(4,1);

eps = 1e-6;
maxit = 1e8;

for k = 1:length(n)
    fprintf('n=%i : ',n(k))
    [A,b] = my_test_system(n(k));
    x0 = b;
    
    % Dieses Verfahren ist viel zu langsam.
    %{
    if k == length(n)
        tic;
    end
    fprintf('Jacobi... ')
    [x,numit] = my_jacobi(A,b,x0,eps,maxit);
    it_jacobi(k) = numit;
    if k == length(n)
        t(1) = toc;
    end
    %}
    
    if k == length(n)
        tic;
    end
    fprintf('Jacobi_Vector... ')
    [x,numit] = my_jacobi_vector(A,b,x0,eps,maxit);
    it_jacobi_vector(k) = numit;
    if k == length(n)
        t(2) = toc;
    end
    
    if k == length(n)
        tic;
    end
    fprintf('Gauss_Seidel... ')
    [x,numit] = my_gauss_seidel(A,b,x0,eps,maxit);
    it_gauss_seidel(k) = numit;
    if k == length(n)
        t(3) = toc;
    end
    
    if k == length(n)
        tic;
    end
    fprintf('SOR... \n')
    omega = 2/(1+sin(pi/n(k)));
    [x,numit] = my_sor(A,b,x0,eps,maxit,omega);
    it_sor(k) = numit;
    if k == length(n)
        t(4) = toc;
    end
end

nHeader = ['Zeit für n=' num2str(n(length(n)))];
fprintf('\n\n');
disp(table({'Jacobi','Jacobi_Vector','Gauss_Seidel','SOR'}.',t,'VariableNames',{'Verfahren',nHeader}))

plot(n,it_jacobi)
hold on
plot(n,it_jacobi_vector)
hold on
plot(n,it_gauss_seidel)
hold on
plot(n,it_sor)

legend('Jacobi','Jacobi\_Vector','Gauss\_Seidel','SOR')
print('PA10','-dpdf')