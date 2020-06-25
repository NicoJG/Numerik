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
% Program name:     my_test_system 
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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