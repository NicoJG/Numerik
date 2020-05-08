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
% Aufgabennummer:   2.1a
% Program name:     myNewtonInterpol
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
%                    
% Input: x sind die Stuetzstellen
%        f sind die Funktionswerte an den Stützstellen
%
% Output: Koeffizienten der Newton Interpolation
%
% Berechnet alle Koeffizienten mithilfe der dividierten Differenzen
% Diese werden rekursiv nach den Formeln aus der Vorlesung
% in der Funktion y berechnet
% Input von y(...): k und i für y[x_k,...,x_(k+i)]
%                   x sind die Stützstellen
%                   f sind die Funktionswerte an den Stützstellen
function c = myNewtonInterpol(x,f)
n = length(x)-1;
c = zeros(1,n+1);
c(1) = f(1);
for k = [1:n]
    c(k+1) = y(0,k,x,f);
end
end

function a = y(k,i,x,f)
if i == 0
    a = f(k+1);
else
    a = (y(k+1,i-1,x,f)-y(k,i-1,x,f))/(x(k+i+1)-x(k+1));
end
end

% Ich habe außerdem weitere Versuche gemacht die Koeffizienten ohne 
% die dividierten Differenzen zu berechnen, da die Rekursion sehr ineffizient ist
% und habe mich beim Versurch direkt an die Formeln aus der Vorlesung gehalten
% allerdings haben die Versuche falsche Koeffizienten gebracht.
% Können Sie erkennen wo der Fehler liegt?
% Ich habe einfach die Formeln von Folie 7 und 9 aus VL2
% in Code umgesetzt und die Summen als for Schleifen realisiert

% function c = myNewtonInterpol(x,f)
% n = length(x)-1;
% c = zeros(1,n+1);
% c(1) = f(1);
% for k = [1:n]
%     % p_(k-1)(x_k) berechnen
%     p = 0;
%     for i = [0:k-1]
%         % N_i(x_k) berechnen
%         N=1;
%         for j = [0:i-1]
%             if j == 0
%                 N = 1;
%             else
%                 N = N*(x(k+1)-x(j+1));
%             end
%         end
%         p = p + c(i+1)*N;
%     end
%     % N_k(x_k) berechnen
%     for i = [0:k-1]
%         if i == 0
%             N = 1;
%         else
%             N = N*(x(k+1)-x(j+1));
%         end
%     end
%     
%     c(k+1) = (f(k+1) - p)/N;
% end
% end