% Näherung von e^(-5.5)
clc;clear all;close all;
format long;
n = (3:3:30)'; % Spaltenvektor der n in 3er Schritten
a = myexp(-5.5,n); % berechne exp(-5.5)
b = 1./myexp(5.5,n); % berechne 1/exp(5.5)
c = myexp(-0.5,n).^11; % berechne exp(-0.5)^11
Ergebnis = [n,a,b,c] % Stelle das Ergebnis in einer Matrix dar
Vergleich = exp(-5.5) % berechne einen Vergleichswert für exp(-5.5)

% c wird am konvergiert am schnellsten gegen exp(-5.5) 
% und b konvergiert schneller als a
% 