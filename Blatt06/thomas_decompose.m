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
% Aufgabennummer:   6.1a
% Program name:     thomas_decompose
%
% Program(version): MatLab R2020a
% OS:               Windows 10 64bit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function LR = thomas_decompose(A)
n = length(A);
% Diagonalelemente der Matrix A
a = diag(A);
b = diag(A,1);0;
c = diag(A,-1);
% x=alpha,y=beta,z=gamma
x = zeros(n,1);
y = zeros(n-1,1);
z = zeros(n-1,1);
% i=1
% alpha_1
x(1) = a(1);
% beta_1
y(1) = b(1);
for i = 2:n
    % gamma_i
    z(i-1) = c(i-1)/x(i-1);
    % alpha_i
    x(i) = a(i)-z(i-1)*y(i-1);
    if i < n
        % beta_i
        y(i) = b(i);
    end
end
LR = spdiags([[z;0],x,[0;y]],[-1;0;1],n,n);
end