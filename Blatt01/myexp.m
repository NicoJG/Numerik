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
% Program name:     myexp 
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% hier wird exp(x) über eine Näherung berechnet
% berechnet wird die Summe von k=0 bis n über (x^k)/(k!) aus
% bei eingegebenen n Vektor wird für jedes Komponente n(i) die Summe
% berechnet
% 
% Input: 
%       x: Exponent
%       n: Laenge der durgefuehrten Summe

function y = myexp(x,n)
y = zeros(length(n),1); % init Ergebnis Vektor
for i = 1:length(n) % führe die Summe für alle n(i) aus
for k = 0:n(i)
    y(i) = y(i) + x^k / factorial(k);
end
end
end