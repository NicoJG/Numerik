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
% Uebungszettel-Nr: Blatt 1
% Aufgabennummer:   1.2
% Program name:     B1A2 
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% Plottet (x-1)^7
clc;       % clear the Command Window
close all; % close all plots etc. 
clear all; % deletes all data in the Workspace

f = @(x) (x-1).^7;
h = @(x) ((((((x-7).*x+21).*x-35).*x+35).*x-21).*x+7).*x-1; % Horner-Form

x = single([0.8:5*10^(-5):1.2]); % Init x-Werte als single Array

plot(x,h(x),'b');
hold;
plot(x,f(x),'r','LineWidth',1);

% Erklärung der Ungenauigkeit vom Plot der Horner-Form:
% in der Horner Form werden viele verschieden Rechenoperationen
% hintereinander mit x ausgeführt, mit niedrigerer Auflösung durch single
% wird jedes Ergebnis von h(x) dann sehr Ungenau im Vergleich zu f(x) wo
% nur 2 Rechenoperationen ausgeführt werden.