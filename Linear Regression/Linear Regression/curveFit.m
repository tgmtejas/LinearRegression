%start code for project #1: linear regression
%pattern recognition, CSE583/EE552
%Weina Ge, Aug 2008
%Christopher Funk, Jan 2018

 addpath export_fig/
% 
%   npts = 50;
%   [x, y, t] = generateData (npts);

%load the data points
 load data1.mat  % load data

%plot the groud truth curve
% figure(1)
%  clf
%  hold on;
%  xx = linspace(1,4*pi,50);
%  yy = sin(.5*xx);
%  err = ones(size(xx))*0.3;
% % plot the x and y color the area around the line by err (here the std)
% h = shadedErrorBar(x,y,err,{'b-','color','b','LineWidth',2},0);
% %plot the noisy observations
% plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
%  hold off; 
% % Make it look good
%  grid on;
%  set(gca,'FontWeight','bold','LineWidth',2)
%  xlabel('x')
%  ylabel('t')
% 
% % Save the image into a decent resolution
%  export_fig sampleplot -png -transparent -r150

% Start your curve fitting program 

X1= x'; % inverting x into N x 1
T=t'; % inverting t into N x 1

% Points= 50, order = 0, Lambda =0
[X2, Wstar2, Ynew2, WstarValue2, Error2] = Regress(X1,T,y, 50, 0, 0);  
figure()
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
 hold on
 plot(x,Ynew2) %Plot new weight estimated curve
 hold on
 plot (x,y)
 % Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('x                        Order =0')
 ylabel('t,    y(x, W^*)')
 legend('Data = 50', 'Order = 0', 'sin(x)')
% hold on
export_fig LeastSquareOrder0 -png -transparent -r150


% Points= 50, order = 1, Lambda =0
[X3, Wstar3, Ynew3, WstarValue3, Error3] = Regress(X1,T,y,50, 1, 0);
figure();
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
 hold on
 plot(x,Ynew3)
 hold on
 plot (x,y)
 % Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('x                       Order =1')
 ylabel('t,    y(x, W^*)')
 legend('Data = 50', 'Order = 1', 'sin(x)')
 hold on
export_fig LeastSquareOrder1 -png -transparent -r150


% Points= 50, order = 3, Lambda =0
[X4, Wstar4, Ynew4, WstarValue4, Error4] = Regress(X1,T,y, 50, 3, 0);
figure();
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
 hold on
 plot(x,Ynew4)
 hold on
 plot (x,y)
 % Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('x                        Order =3')
 legend('Data = 50', 'Order = 3', 'sin(x)')
 ylabel('t,    y(x, W^*)')
 hold on
export_fig LeastSquareOrder3 -png -transparent -r150


% Points= 50, order = 6, Lambda =0
 [X5, Wstar5, Ynew5, WstarValue5, Error5] = Regress(X1,T,y, 50,6, 0);
figure();
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
 hold on
 plot(x,Ynew5)
 hold on
 plot (x,y)
 %Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('x                        Order =6')
 legend('Data = 50', 'Order = 6', 'sin(x)')
 ylabel('t,    y(x, W^*)')
 hold on
 export_fig LeastSquareOrder6 -png -transparent -r150 % save the image

 
 % Points= 50, order = 9, Lambda =0
 [X6, Wstar6, Ynew6, WstarValue6, Error6] = Regress(X1,T,y, 50, 9, 0);
figure();
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
 hold on
 plot(x,Ynew6)
 hold on
 plot (x,y)
 %Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('x                       Order =9')
 ylabel('t,    y(x, W^*)')
 legend('Data = 50', 'Order = 9', 'sin(x)')
 hold on
export_fig LeastSquareOrder9 -png -transparent -r150
 
 %%
 %Regularization
 
%    npts = 10;
%   [x, y, t] = generateData (npts);
%load the data points
 load data1.mat % load the data1 file
 
 X1= x';
T=t';

%Training set
for i=1:40  
    Xu(i,1)=X1(i,1);
    Tu(i,1)=T(i,1);
    yu(1,i) = y(1,i);
end

%Testing set
for i= 41:50
    Xl(i,1)=X1(i,1);
    Tl(i,1)=T(i,1);
    yl(1,i) = y(1,i);
end

 Erroru =zeros(1,3); %Erms error for training set
 Errorl =zeros(1,3); %Erms error for testing set
 Lambda =[exp(-18), exp(-15), exp(-13)]; %lambda value
 
 % ln(lambda) =-18, Points =40, Order=9
 [X7, Wstar7, Ynew7, WstarValue7, Erroru(1,1)] = Regress(Xu,Tu,yu,40, 9, exp(-18));
 
 % ln(lambda) =-18, Points =10, Order=9
 [X8, Wstar8, Ynew8, WstarValue8, Errorl(1,1)] = Regress(Xl,Tl,yl,10, 9, exp(-18));
 
 % ln(lambda) =-15, Points =40, Order=9
 [X9, Wstar9, Ynew9, WstarValue9, Erroru(1,2)] = Regress(Xu,Tu,yu,40, 9, exp(-15));

% ln(lambda) =-15, Points =10, Order=9
 [X10, Wstar10, Ynew10, WstarValue10, Errorl(1,2)] = Regress(Xl,Tl,yl,10, 9, exp(-15));
 
 % ln(lambda) =-13, Points =40, Order=9
 [X11, Wstar11, Ynew11, WstarValue11, Erroru(1,3)] = Regress(Xu,Tu,yu,40, 9, exp(-13));
  
 % ln(lambda) =-13, Points =10, Order=9
 [X12, Wstar12, Ynew12, WstarValue12, Errorl(1,3)] = Regress(Xl,Tl,yl,10, 9, exp(-13));

 figure();
% plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
%  hold on
 plot(log(Lambda),Erroru) %Ploting Erms for training set
 hold on
 plot (log(Lambda),Errorl) %Ploting Erms for testing set
 % Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('Lambda (ln)             Order =9')
 ylabel('ERRORerms')
 legend('Training', 'Testing')
 hold on
 export_fig GraphRMSERRORvslnLambda -png -transparent -r150
 
 
 %Order =9, Lambda =0.3
 [X13, Wstar13, Ynew13, WstarValue13, Error13] = Regress(X1,T,y, 50, 9, 0.3);
 figure();
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
 hold on
 plot(x,Ynew13)
 hold on
 plot (x,y)
 % Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('x    Order =9')
 ylabel('t')
 legend('Data = 50', 'Order = 9, lambda= 0.3', 'sin(x)')
 hold on
export_fig RegularizationLambda0.3 -png -transparent -r150
 
 
%Order =9, Lambda =0.6
  [X14, Wstar14, Ynew14, WstarValue14, Error14] = Regress(X1,T,y, 50, 9, 0.6);
   figure();
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
 hold on
 plot(x,Ynew14)
 hold on
 plot (x,y)
 % Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('x                       Order =9')
 ylabel('t')
 legend('Data = 50', 'Order = 9, lambda= 0.6', 'sin(x)')
 hold on
export_fig RegularizationLambda0.6 -png -transparent -r150


%Order =9, Lambda =5
  [X15, Wstar15, Ynew15, WstarValue15, Error15] = Regress(X1,T,y, 50, 9, 5);
   figure();
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
 hold on
 plot(x,Ynew15)
 hold on
 plot (x,y)
 % Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('x                       Order =9')
 ylabel('t')
 legend('Data = 50', 'Order = 9, lambda= 5', 'sin(x)')
 hold on
export_fig RegularizationLambda5 -png -transparent -r150
 
%% Maximum likelihood
 
  
 [p,q] = size(Ynew5);
 
 variance1 = sum((Ynew5 - T).^2)/p; %calculating variance for Points= 50, order = 6, Lambda =0 
 
%  disp(variance)
 
 err = ones(size(x))* sqrt(variance1);

 %plot the groud truth curve
 figure();
  clf
  hold on;
%  xx = linspace(1,4*pi,50);
%  yy = sin(.5*xx);
%  err = ones(size(xx))*0.3;
% plot the x and y color the area around the line by err (here the std)
h = shadedErrorBar(x,Ynew5',err,{'b-','color','b','LineWidth',2},0);
%plot the noisy observations
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
 hold on; 
 plot(x,y)
  hold on
% Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('x                    MLE order=6')
 ylabel('t,    y(x,w^*)')
legend('', '', '', 'MLE Order = 6', 'Data = 50', 'sin(x)')
% Save the image into a decent resolution
 export_fig MLEOrder=6 -png -transparent -r150
 
 
 
 [p,q] = size(Ynew6);
 
 variance2 = sum((Ynew6 - T).^2)/p; %calculating variance for Points= 50, order = 9, Lambda =0
 
%  disp(variance)
 
 err = ones(size(x))* sqrt(variance2);

 %plot the groud truth curve
 figure();
  clf
  hold on;
%  xx = linspace(1,4*pi,50);
%  yy = sin(.5*xx);
%  err = ones(size(xx))*0.3;
% plot the x and y color the area around the line by err (here the std)
h = shadedErrorBar(x,Ynew6',err,{'b-','color','b','LineWidth',2},0);
%plot the noisy observations
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
 hold on; 
 plot(x,y)
  hold on
% Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('x                    MLE order=6')
 ylabel('t,    y(x,w^*)')
legend('', '', '', 'MLE Order = 9', 'Data = 50', 'sin(x)')
% Save the image into a decent resolution
 export_fig MLEOrder=9 -png -transparent -r150


%% MAP

beta = 1/(0.3)^2; % Standard deviation = 0.3
alpha = 2; % Defining Alpha value
lm = alpha/ beta;

%Points =50, Order =9, Lambda =lm, Alpha = 2
[X16, Wstar16, Ynew16, WstarValue16, Error16] = Regress(X1,T,y, 50, 9, lm);

[p,q] = size(Ynew16);
 
 variance3 = sum((Ynew16 - T).^2)/p; %Calculating variance
 
%  disp(variance)
 
 err = ones(size(x))* 0.3; %Finding error range

 %plot the groud truth curve
 figure();
  clf
  hold on;
%  xx = linspace(1,4*pi,50);
%  yy = sin(.5*xx);
%  err = ones(size(xx))*0.3;
% plot the x and y color the area around the line by err (here the std)
h = shadedErrorBar(x,Ynew16',err,{'b-','color','b','LineWidth',2},0);
%plot the noisy observations
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
 hold on; 
 plot(x,y)
  hold on
% Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('x                    MAP order = 9')
 ylabel('t,    y(x,w^*)')
legend('', '', '', 'MAp Order = 9, Alpha = 2', 'Data = 50', 'sin(x)')
% Save the image into a decent resolution
 export_fig MAPOrder9Alpha2 -png -transparent -r150
 
 
 
 beta = 1/(0.3)^2;
alpha = 6;
lm = alpha/ beta;

%Points =50, Order =9, Lambda =lm, Alpha =6
[X17, Wstar17, Ynew17, WstarValue17, Error17] = Regress(X1,T,y, 50, 9, lm);

[p,q] = size(Ynew17);
 
 variance4 = sum((Ynew17 - T).^2)/p;
 
%  disp(variance)
 
 err = ones(size(x))* (0.3);

 %plot the groud truth curve
 figure();
  clf
  hold on;
%  xx = linspace(1,4*pi,50);
%  yy = sin(.5*xx);
%  err = ones(size(xx))*0.3;
% plot the x and y color the area around the line by err (here the std)
h = shadedErrorBar(x,Ynew17',err,{'b-','color','b','LineWidth',2},0);
%plot the noisy observations
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
 hold on; 
 plot(x,y)
  hold on
% Make it look good
 grid on;
 set(gca,'FontWeight','bold','LineWidth',2)
 xlabel('x                    MAP order = 9')
 ylabel('t,    y(x,w^*)')
legend('', '', '', 'MAP Order = 9, Alpha = 6', 'Data = 50', 'sin(x)')
% Save the image into a decent resolution
 export_fig MAPOrder9Alpha6 -png -transparent -r150
