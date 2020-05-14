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
% Aufgabennummer:   3.1b
% Program name:     myPiecewiseInterpolTest
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description of the program
%         
% Vergleicht die Stückweise Lineare mit der Newton Interpolation
%       am Beispiel exp(x) und f(x)=1/(1+25*x^2)
%
% Zu beobachten:
%   Die Newton Interpolation konvergiert schneller für exp(x)
%   Dies liegt daran, dass exp(x) eine 'runde' Funktion ohne Sprungstellen
%   in der Ableitung ist
%   allerdings bleibt der Fehler bei f(x) ab n=4 gleich
clc;       % clear the Command Window
close all; % close all plots etc. 
clear all; % deletes all data in the Workspace

format long;

f = @(x) 1./1+25.*x.^2;

% Berechne Gitter Delta
m = 100;
delta = zeros(1,m+1);
for j=0:m
    delta(j+1) = -1+2*j/m;
end
% Plots initialisieren
fig = figure();
% Initialisiere Arrays für die Fehler
E_S_exp = zeros(1,7); % 2^7=128
E_S_f = zeros(1,7);
E_I_exp = zeros(1,7); % 2^4=16
E_I_f = zeros(1,7);
% Berechne alles für n= 2,4,8,...,128
for k = 1:7
    n = 2^k;
    % Berechne n äquidistante Stellen in [-1,1]
    x = zeros(1,n+1);
    for i=0:n
        x(i+1) = -1+2*i/n;
    end
    % Werte die Polynome und die exakte Funktion aus
    exp_exact = exp(delta);
    exp_piecewise = myPiecewiseInterpol(x,exp(x),delta);
    f_exact = f(delta);
    f_piecewise = myPiecewiseInterpol(x,f(x),delta);
    exp_newton = zeros(1,length(delta));
    f_newton = zeros(1,length(delta));
    if n<=16
    exp_newton = (n<=16).*myNewtonInterpolEval(x,exp(x),delta);
        f_newton = myNewtonInterpolEval(x,f(x),delta);
    end
    % Fehler der Interpolation für je (S und I) und (exp und f(x))
    E_S_exp(k) = max(abs(exp_exact-exp_piecewise));
    E_S_f(k) = max(abs(f_exact-f_piecewise));
    if n <= 16
        E_I_exp(k) = max(abs(exp_exact-exp_newton));
        E_I_f(k) = max(abs(f_exact-f_newton));
    end
    if n <= 16
        % Plotte exp(x) für beide Interpolationen und die exakte Funktion
        subplot(4,2,2*k-1);
        plot(delta,exp_exact,'k');
        hold on;
        plot(delta,exp_piecewise,'b');
        hold on;
        plot(delta,exp_newton,'r');
        if k == 1
            title('exp(x)');
        end
        subplot(4,2,2*k);
        plot(delta,f_exact,'k');
        hold on;
        plot(delta,f_piecewise,'b');
        hold on;
        plot(delta,f_newton,'r');
        if k == 1
            title('f(x)');
        end
    end
end

% Speichere die Plots
sgtitle('schwarz=exakt,blau=stückweise linear,rot=Newton');
exportgraphics(fig,'plots.pdf');

% Gib die Fehler aus
n = [2 4 8 16 32 64 128];
T = table(n.',E_S_exp.',E_I_exp.',E_S_f.',E_I_f.','VariableNames',{'n','E_S_exp','E_I_exp','E_S_f','E_I_f'});
disp('Fehler der Interpolation:')
disp(T)

% Evaluiere die Newton Interpolation an Stellen xEval
function yEval = myNewtonInterpolEval(x,f,xEval)
    c = myNewtonInterpol(x,f);
    n = length(c)-1;
    yEval = zeros(1,length(xEval));
    N = ones(1,length(xEval));
    for k = [0:n]
        yEval = yEval + c(k+1)*N;
        N = N.*(xEval-x(k+1));
    end
end