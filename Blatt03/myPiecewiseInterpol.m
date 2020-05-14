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
% Uebungszettel-Nr: Blatt 3
% Aufgabennummer:   3.1a
% Program name:     myPiecewiseInterpol
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
% Wertet die Stückweise lineare Interpolation aus.                   
% Input: x sind die Stuetzstellen
%        f sind die Funktionswerte an den Stützstellen
%        xEval sind die x-Stellen die Ausgewertet werden sollen
%
% Output: yEval Auswertung der stückweisen Interpolation
function [yEval] = myPiecewiseInterpol(x,f,xEval)
    yEval = zeros(1,length(xEval));
    % Berechne Summe von i=0 bis n über f(x_i)*phi_i(x)
    for i = 1:length(x)
        yEval = yEval + f(i).*phi(x,i,xEval);
    end
end

% Dachfunktion bei xi
function [yEval] = phi(x,i,xEval)
    % Bestimme Intervallpunkte x(i-1),x
    x2 = x(i);
    x1 = x2-1;
    x3 = x2+1;
    if i>1
        x1 = x(i-1);
    end
    if i<length(x)
        x3 = x(i+1);
    end
    % Werte Hutfunktion an xEval Stellen aus
    yEval = (x1<xEval & xEval<=x2).*(xEval-x1)./(x2-x1) + (x2<xEval & xEval<x3).*(x3-xEval)./(x3-x2);
end