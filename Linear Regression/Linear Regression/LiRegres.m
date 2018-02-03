function [Wstar, Ynew, X] = LiRegres( X1, T, lambda, N)

X =zeros(50, N);
I = eye(N,N);

[P, Q] = size(X1);

for i= 1 : N
    for j =  1: P
        
        X(j,i)=X1(j,1).^(i-1);

    end
   
end

Wstar = (X'*X + lambda/2 * I)\X'*T;

Ynew = X * Wstar; 

end
