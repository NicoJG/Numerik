clc;close all;clear all;
format long;

n = 7;

x = cell(n,1);
x(1,1) = {[0.5,0.5]};

for k = 2:n
    x(k,1) = {g(cell2mat(x(k-1,1)))};
end

k = [1:n].';

disp(table(k,cell2mat(x),'VariableNames',{'k','x transponiert'}));

% Funktion Phi aus der Aufgabe (2 dimensionale Abbildung)
function y = g(x)
y1 = (1/6)*cos(x(1)) + (1/3)*x(2);
y2 = (1/8)*x(1)*x(2)^2 + (1/8)*sin(x(1));
y = [y1,y2];
end