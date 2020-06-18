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
% Uebungszettel-Nr: Blatt 8
% Aufgabennummer:   8.1b
% Program name:     myNewtonTest
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;close all;clear all;
format long;

f = @(x) cos(2*x)^2 - x^2;
df = @(x) -2*(x+2*sin(2*x)*cos(2*x));

x0 = 0.75;

[x,e,v] = myNewton(f,df,x0);

[x2,e2,v2] = mybisect(f,0,0.75);

k = [1:length(x)].';

fprintf('Newton Verfahren:\n');
disp(table(k,x,v,e,'VariableNames',{'k','x','f(x)','Fehler'}));

k2 = [1:length(x2)].';

fprintf('\nBisektionsverfahren:\n');
disp(table(k2,x2,v2,e2,'VariableNames',{'k','x','f(x)','Fehler'}));

semilogy(k,e);
hold on;
semilogy(k2,e2);
savefig('PA8.1.fig');

% Das Konvergenzverhalten stimmt mit der Theorie überein.