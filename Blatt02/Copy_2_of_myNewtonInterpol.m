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