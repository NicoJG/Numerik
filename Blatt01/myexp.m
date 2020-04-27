function y = myexp(x,n)
% hier wird exp(x) über eine Näherung berechnet
% berechnet wird die Summe von k=0 bis n über (x^k)/(k!) aus
% bei eingegebenen n Vektor wird für jedes Komponente n(i) die Summe
% berechnet
y = zeros(length(n),1); % init Ergebnis Vektor
for i = 1:length(n) % führe die Summe für alle n(i) aus
for k = 0:n(i)
    y(i) = y(i) + x^k / factorial(k);
end
end
end