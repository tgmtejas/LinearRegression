function [X, Wstar1, Ynew1, WstarValue, Error1]= Regress(X1,T,y, M, N, lambda)
X =zeros(M, N);
I= eye(N,N);%Identity matrix

[P, Q] = size(X1);

%Initializing weights with respect to order
for i= 1 : N
    for j =  1: P
        
        X(j,i)=X1(j,1).^(i-1);

    end
   
end

% for i=2:N
%     for j=2:N
%         if i == j
%             I(i,j)=1;
%         end
%        
%     end
% end

Wstar1 = (X'*X + (lambda/2) * I)\(X'*T);%W optimal calculation
% Wstar2 = (X'*X)\X'*T;

Ynew1 = X * Wstar1 ; %New Output vector
% Ynew2 = X * Wstar2;

%Error Calculation
Error1= 0;
% Error2= 0;

for i=1:M
    
     Error1 = Error1 + (Ynew1(i,1)-T(i,1))^2;
%      Error2 = Error2 + (Ynew2(i,1)-T(i,1))^2;

end

WstarValue = 0;
for i = 1: N
    
    WstarValue = WstarValue + Wstar1(i,1)^2 ;
    
end
Error1 = Error1/2 + (lambda/2) * WstarValue ;
% Error2 = Error2/2;

%Erms calculation
Error1 = sqrt(2*Error1/M);

end