clc;clear
x = 0:.01:4; 
y=humps(x); % humps function
            % y = 1 ./ ((x-.3).^2 + .01) + 1 ./ ((x-.9).^2 + .04) - 6; 
            
P=x; T=y;

%    DESIGN THE NETWORK 
%    ================== 
% We try a simple one feedforward (multilayer perceptron) network 

net=newff([0 4], [30,30,1], {'tansig','tansig','purelin'},'traingd');
%  Here newff defines feedforward network architecture
%  The first argument [0 2] defines the range of
%  the input and initializes the network parameters. 
%  The second argument the structure of the network. There are two layers.  
%  5 is the number of the nodes in the first hidden layer, 
%  1 is the number of nodes in the output layer, 
%  Next the activation functions in the layers are defined. 
%  In the first hidden layer there are 5 tansig functions. 
%  In the output layer there is 1 linear function. 
% �?learngd’ defines the basic learning scheme – gradient method 
% Define learning parameters 
net.trainParam.show = 50; % The result is shown at every 50th iteration (epoch) 
net.trainParam.lr = 0.01; % Learning rate used in some gradient schemes 
net.trainParam.epochs =1000; % Max number of iterations 
net.trainParam.goal = 1e-5; % Error tolerance; stopping criterion 
%Train network 
net1 = train(net, P, T); % Iterates gradient type of loop 

% Simulate how good a result is achieved: 
% Input is the same input vector P. 
% Output is the output of the neural network, which should be compared with output data
% Create testing dataset
N = 100;
Ptest = 4*rand(1,N);
% Target Value of testing dataset
yTest = humps(Ptest);
% Response - output of Neural Netowrk
atest= sim(net1,Ptest);
% Estimate Mean Square Error
mse = sum((yTest-atest).^2)/N;
fprintf('Mean square Error = %.4f\n', mse)
% Plot result and compare 
plot(P,T,'r--',Ptest,atest,'ro', Ptest,yTest,'b*'); grid;
legend('Function','predicted value','actual value')