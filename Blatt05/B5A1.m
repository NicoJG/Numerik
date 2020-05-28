clc;close all;clear all;

format long;

f = @(x) exp(x)+1;
a = -1;
b = 1;
maxM = 100;
I1 = zeros(maxM,1);
I2 = zeros(maxM,1);
ms = zeros(maxM,1);

for k = 1:maxM
    m = k;
    ms(k) = m;
    h = (b-a)/m;

    x = zeros(m+1);
    for i = 0:m
        x(i+1) = a + i*h;
    end

    I1(k) = h/2*(f(a)+f(b));
    for i = (1:m-1)
        I1(k) = I1(k) + h*f(x(i+1));
    end
    
    for i = (1:m)
        I2(k) = I2(k) + I_2(f,x(i),x(i+1));
    end
end

exakt = exp(1) + 1 - exp(-1) + 1;

fehler1 = abs(exakt-I1);
fehler2 = abs(exakt-I2);

table(ms,I1,fehler1,I2,fehler2,'VariableNames',{'m','I_1','fehler_1','I_2','fehler_2'})

function I = I_2(f,a,b)
    I = (b-a)/6*(f(a)+4*f((a+b)/2)+f(b));
end