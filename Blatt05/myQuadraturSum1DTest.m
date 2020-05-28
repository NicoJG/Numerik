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
% Uebungszettel-Nr: Blatt 5
% Aufgabennummer:   5.1b
% Program name:     myQuadraturSum1DTest
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;close all;clear all;

format long;

% Funktionen
f = @(x) 1./(1+25.*x.^2);
g = @(x) exp(x) + 1;

% Stammfunktionen
F = @(x) (1/5).*atan(5.*x);
G = @(x) exp(x) + x;

% Intervallgrenzen
a_f = -1;
b_f = 1;
a_g = 0;
b_g = 1;

% Exakte Integrale
I_f_exact = F(b_f) - F(a_f);
I_g_exact = G(b_g) - G(a_g);

% Trapezregel auf Einheitsintervall
w1 = [1 1];
p1 = [-1 1];

% Simpsonregel auf Einheitsintervall
w2 = (1/3).*[1 4 1];
p2 = [-1 0 1];

maxN = 1000;
Ns = (1:maxN).';
% Ergebnis Vektoren
I_f_1 = zeros(maxN,1);
I_f_2 = zeros(maxN,1);
I_g_1 = zeros(maxN,1);
I_g_2 = zeros(maxN,1);
% Summierte Quadratur berechnen
for k = 1:length(Ns)
    N = Ns(k);
    I_f_1(N) = myQuadraturSum1D(f,w1,p1,a_f,b_f,N);
    I_f_2(N) = myQuadraturSum1D(f,w2,p2,a_f,b_f,N);
    I_g_1(N) = myQuadraturSum1D(g,w1,p1,a_g,b_g,N);
    I_g_2(N) = myQuadraturSum1D(g,w2,p2,a_g,b_g,N);
end

% Fehler berechnen
dI_f_1 = abs(I_f_exact - I_f_1);
dI_f_2 = abs(I_f_exact - I_f_2);
dI_g_1 = abs(I_g_exact - I_g_1);
dI_g_2 = abs(I_g_exact - I_g_2);

% Ergebnisse ausgeben
table(I_f_exact,I_g_exact,'VariableNames',{'I_f_exact','I_g_exact'})
table(Ns,I_f_1,I_f_2,I_g_1,I_g_2,'VariableNames',{'N','I_f_1','I_f_2','I_g_1','I_g_2'})
table(Ns,dI_f_1,dI_f_2,dI_g_1,dI_g_2,'VariableNames',{'N','dI_f_1','dI_f_2','dI_g_1','dI_g_2'})

% Plots erstellen
subplot(1,2,1);
loglog(Ns,dI_f_1,'r',Ns,dI_f_2,'b');
title('Fehler für f(x)');
legend('Trapez','Simpson');

subplot(1,2,2);
loglog(Ns,dI_g_1,'r',Ns,dI_g_2,'b');
title('Fehler für g(x)');
legend('Trapez','Simpson');

