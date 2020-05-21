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
% Uebungszettel-Nr: Blatt 4
% Aufgabennummer:   4.1b
% Program name:     myQuadratur1DTest
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% Berechnet die Quadratur für f(x)=1/x^2 auf Intervall (0.5,1)
% Mithilfe der 3 Regeln:
% 1) Trapezregel 
% 2) Simpson-Regel
% 3) 3/8-Regel
clc;close all;clear all;

f = @(x) 1/x^2;

a = 0.5;
b = 1;

H = @(n) (b-a)/n;

x1 = [a b];
w1 = ((b-a)/2)*[1 1];
x2 = [a (a+b)/2 b];
w2 = ((b-a)/6)*[1 4 1];
x3 = [a a+H(3) b-H(3) b];
w3 = ((b-a)/8)*[1 3 3 1];

myQuadratur1D(f,w1,x1)
myQuadratur1D(f,w2,x2)
myQuadratur1D(f,w3,x3)