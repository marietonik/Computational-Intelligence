%% Main function - minimization:
clc; clear;
x_t = 0:0.05:2;
func_to_plot = x_t.^(2) + sqrt(x_t.^(2)+ 1) - 2;
plot(x_t, func_to_plot, 'LineWidth', 2.5, 'Color', [1 0.85 0])
title('Plot of objectives ''x^2 + sqrt(x^2+ 1) - 2''');
grid on

%%
clc; clear;

disp("This is the function used for Multiobjective Optimization Problem:")

type Equation_fitness.m;

FitnessFcn = @Equation_fitness; 

nvars = 2;

lb = [0 0]; ub = [2 2];

x_t = 0:0.05:2;
func_to_plot = (x_t.^(2) + sqrt(x_t.^(2)+ 1) - 2).^2;
plot(x_t, func_to_plot, 'LineWidth', 2.5, 'Color', [0.9100 0.4100 0.170])
title('Plot of objectives ''(x^2 + sqrt(x^2+ 1) - 2)^2''');
grid on

options = optimoptions(@gamultiobj,'PlotFcn',{@gaplotpareto,@gaplotscorediversity,@gaplotrankhist,@gaplotgenealogy});

[x, fval, exitflag, output, population, score] = gamultiobj(FitnessFcn, nvars, [], [], [], [], lb, ub, options)
disp('The number of points on the Pareto front was:' ); size(x,1)

bin_x = string(zeros(size(x,1),size(x,2)));
bin_fval = string(zeros(size(fval,1),size(fval,2)));

for i = 1:size(x,1) 
    bin_x(i,1) = convertCharsToStrings(Dec2Bin(x(i,1)));
    bin_x(i,2) = convertCharsToStrings(Dec2Bin(x(i,2)));
    
    bin_fval(i,1) = convertCharsToStrings(Dec2Bin(fval(i,1)));
    bin_fval(i,2) = convertCharsToStrings(Dec2Bin(fval(i,2)));
end

disp(["Binary Values of x's is:"]); bin_x;
disp(["Binary Values of fval's is:"]); bin_fval;
