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
% Uebungszettel-Nr: Blatt 6
% Aufgabennummer:   6.1c
% Program name:     LR_Thomas_Test
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;close all;clear all;

n = [10;10^2;10^3;10^4;10^5;10^6;10^7];
t = zeros(length(n),1);
Res = zeros(length(n),1);
for i = 1:length(n)
    fprintf('n=%i\n',n(i))
    A = gallery('tridiag',n(i),-2,8,-2);
    b = [ones(ceil(n(i)/2)-1,1);2.*ones(floor(n(i)/2)+1,1)];
    tic;
    fprintf('thomas_decompose\n')
    LR = thomas_decompose(A);
    t(i) = toc();
    fprintf('forward_solve\n')
    y = forward_solve(LR,b);
    fprintf('backward_solve\n')
    x = backward_solve(LR,y);
    fprintf('Residuum\n\n')
    Res(i) = norm(A*x-b,2);
end
table(n,t,Res,'VariableNames',{'n','t','Residuum'})

%%% Ergebnis:
%      n          t         Residuum 
%    _____    _________    __________
%
%      10    0.0085796    6.3777e-16
%     100    0.0029739     2.237e-15
%    1000     0.012054    9.6257e-15
%   10000     0.069932    3.1307e-14
%   1e+05      0.57039    9.9271e-14
%   1e+06       5.5417    3.1401e-13
%   1e+07       56.337    9.9301e-13
%
% Ist viel schneller, als die Lösung aus Moodle, weil dort keine sparse Matrizen benutzt wurden.
% ungefähr O(n) also linear