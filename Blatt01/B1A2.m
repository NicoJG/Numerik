% Plottet (x-1)^7
clc;clear all;close all;

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