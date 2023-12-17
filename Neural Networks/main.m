%% Main program for testing
clc; clear;

%Creating Samples from Function
population = 200;
population_test = 40;

%Importing Data
data = newff_function(population);

%Data Seperation
inputs = [data(:,1) data(:,2) data(:,3)]';
targets = data(:,4)';

%Design Network
scalling = minmax(inputs);
net = newff(scalling,[5,10,1], {'tansig','tansig','purelin'},'traingd');

% Define learning parameters 
net.trainParam.show = 50; % The result is shown at every 50th iteration (epoch) 
net.trainParam.lr = 0.01; % Learning rate used in some gradient schemes 
net.trainParam.epochs =1000; % Max number of iterations 
net.trainParam.goal = 1e-5; % Error tolerance; stopping criterion 

%Train the model:
[net,tr] = train(net,inputs,targets);

%Data for Testing:
data_test = newff_function(population_test);
inputs_test = [data_test(:,1) data_test(:,2) data_test(:,3)]';
targets_test = data_test(:,4)';

% Response - output of Neural Netowrk
test = sim(net,inputs_test);

% Estimate Mean Square Error
mse = sum((targets_test - test).^2) / population_test;
fprintf('Mean square Error = %.4f\n', mse)

% Plot result and compare 
plotperform(tr)
plottrainstate(tr)
plotregression(targets_test,test)

