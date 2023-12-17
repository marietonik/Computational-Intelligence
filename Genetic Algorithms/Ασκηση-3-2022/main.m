%% Main function - minimization:
clc; clear;

type Equation_fitness.m;

FitnessFcn = @Equation_fitness; 

nvars = 3;

lb = [-10 -10 -10]; ub = [10 10 10];

%ploting for lb, ub:
x_t = -10:0.5:10;
func_to_plot = x_t.^(3) + x_t.^(2) + x_t + 57;
plot(x_t, func_to_plot, 'LineWidth', 2, 'Color', [1 0.85 0])
title('Plot of objectives ''x^3 + x^2 + x + 57''');
grid on

options = optimoptions(@gamultiobj,'PlotFcn',{@gaplotpareto,@gaplotscorediversity});
options.PopulationSize = 200;

[x, fval, exitflag, output, population, score] = gamultiobj(FitnessFcn, nvars, [], [], [], [], lb, ub, options);

