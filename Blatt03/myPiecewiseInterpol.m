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