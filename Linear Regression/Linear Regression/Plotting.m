function [Error] = Plotting(x, y, T, Ynew, r, N,Wstar)
WstarValue = 0;
for i = 1: 5
    
    WstarValue = WstarValue + (Wstar(i,1))^2 ;
    
end

Error= 0;
for i=1:50
    
   
        Error = Error + (Ynew(i,1)-T(i,1))^2;
   
end

if N==0
   disp(Error);
else
    Error = Error/2 + (0.5/2) * WstarValue ;
    disp(Error);



% err =ones(size(x))*(Error/N)^(1/2);
% 
% h = shadedErrorBar(x,ynew,err,{'b-','color','b','LineWidth',2},0);
% 

t=T';
if (r==1)
    figure;
end
subplot(2,1, r);
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
 hold on
 plot(x,Ynew)
 hold on
 plot (x,y)
 % Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('x')
 ylabel('t')

 legend('Data','y=sin(x)','Y=[W^*][X]')


end