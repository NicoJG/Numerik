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
% Aufgabennummer:   1.1
% Program name:     B1A1
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% Berechnet 3 verschiedene Arten der Näherung von exp(-5.5)
clc;       % clear the Command Window
close all; % close all plots etc. 
clear all; % deletes all data in the Workspace

format long;
n = (3:3:30)'; % Spaltenvektor der n in 3er Schritten
a = myexp(-5.5,n); % berechne exp(-5.5)
b = 1./myexp(5.5,n); % berechne 1/exp(5.5)
c = myexp(-0.5,n).^11; % berechne exp(-0.5)^11
Ergebnis = [n,a,b,c] % Stelle das Ergebnis in einer Matrix dar
Vergleich = exp(-5.5) % berechne einen Vergleichswert für exp(-5.5)

% c wird am konvergiert am schnellsten gegen exp(-5.5) 
% und b konvergiert schneller als a