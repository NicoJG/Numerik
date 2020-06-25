%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften 2020     %%%
%%%  Programmierabgaben (Praktischer Teil des Uebungungsblattes)            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Student 1: Nico, Guth
%  Unimail-adress: nico.guth@tu-dortmund.de
%
%  Student 2: David, Venker
%  Unimail-adress: david.venker@tu-dortmund.de
%
% Uebungszettel-Nr: Blatt 9
% Aufgabennummer:   9.1
% Program name:     my_jacobi 
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Leider viel zu langsam

function [x, numit] = my_jacobi(A,b,x0,eps,maxit)
x = x0;
e = NaN;
emin = eps*(norm(A*x0-b)/norm(x0));
numit = 0;
n = length(x0);
while numit<=maxit && (isnan(e) || e>=emin)
    oldX = x;
    x = b;
    for i = 1:n
        x(i) = (x(i) - A(i,1:n)*oldX+A(i,i)*oldX(i))/A(i,i);
    end
    e = norm(A*x-b)/norm(x);
    numit = numit+1;
end
if numit > maxit
    warning('Die maximal Anzahl der Iterationen wurde überschritten!')
end
end

