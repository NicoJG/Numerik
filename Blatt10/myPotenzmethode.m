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
% Uebungszettel-Nr: Blatt 10
% Aufgabennummer:   10.1.a
% Program name:     myPotenzmethode 
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [z,lambda] = myPotenzmethode(A,z0,tol,maxit)
z = z0;
Az = A*z;
lambda = 0;
k = 1;
while k<=maxit
    oldZ = z;
    z = (1/norm(Az))*Az;
    Az = A*z;
    lambda = norm(Az,Inf)/norm(z,Inf);
    if lambda > 0 && norm(z-oldZ,Inf) < tol
        break
    end
    if lambda < 0 && norm(z+oldZ,Inf) < tol
        break
    end
    k = k+1;
end
if k > maxit
    warning('Die maximal Anzahl der Iterationen wurde überschritten!')
end