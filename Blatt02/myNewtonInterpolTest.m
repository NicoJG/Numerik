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
% Uebungszettel-Nr: Blatt 2
% Aufgabennummer:   2.1b
% Program name:     myNewtonInterpolTest
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
%         
% Plottet die Runge-Funktion und dessen Newton Interpolation
%         
% Variablen: f f(x) aus der Aufgabenstellung
%            x Array der x Werte für die Plots
%            pos Position des Plots im Subplot
%            n (+1) Anzahl der Stützstellen
%            x1 Äquidistante Knoten
%            x2 Tschebyscheff-Knoten
%            c1 c2 Array der berechneten Koeffizienten für x1 bzw x2
%
% Funktion p: berechnet die Newton Interpolation
% Input: x Werte für die p(x) ausgewertet werden soll
%        x_knoten Stützstellen
%        c Koeffizienten des Newton Polynoms
% Output: y Array der berechneten p(x)
%
% Zu beobachten:
%   die Äquidistanten Knoten erreichen ein recht genaue Interpolation
%   in der Mitte des Intervalls, aber an den Rändern
%   ist der Fehler der Interpoation sehr hoch.
%   Die Tschebyscheff-Knoten erreichen eine ausgewogenere Interpolation
%   in der die Intervall Ränder auch einen geringen Fehler besitzen
%   allerdings ist hier die Interpolation in der Mitte etwas ungenauer
%
clc;       % clear the Wommand Window
close all; % close all plots etc. 
clear all; % deletes all data in the Workspace

f = @(x) (1+25*x.^2).^(-1);

x = [-1:0.001:1];
pos = 1;
for n = [7 12 17]
    subplot(2,2,pos);
    pos = pos +1;
    x1 = zeros(1,n+1);
    x2 = zeros(1,n+1);
    for i = [0:n]
        x1(i+1) = -1+2*i/n;
        x2(i+1) = cos((2*i+1)*pi/(2*n+2));
    end

    c1 = myNewtonInterpol(x1,f(x1));
    c2 = myNewtonInterpol(x2,f(x2));

    plot(x,f(x),'g');
    hold on;
    plot(x1,f(x1),'r*');
    hold on;
    plot(x2,f(x2),'b*');
    hold on;
    plot(x,p(x,x1,c1),'r');
    hold on;
    plot(x,p(x,x2,c2),'b');
end
    
function y = p(x,x_knoten,c)
    n = length(c)-1;
    y = zeros(1,length(x));
    N = ones(1,length(x));
    for k = [0:n]
        y = y + c(k+1)*N;
        N = N.*(x-x_knoten(k+1));
    end
end