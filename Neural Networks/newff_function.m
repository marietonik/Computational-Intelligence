function y = newff_function(population)

data = zeros(population,4);
for i = 1:population
    inputs = (1+1).*rand(3,1) - 1;
    x_input = inputs(1);
    y_input = inputs(2);
    z_input = inputs(3);
    
    out = (z_input.^2) + (x_input.^3) - (2 .* x_input) * cos(y_input .* z_input + 4);

    data(i,1) = x_input;
    data(i,2) = y_input;
    data(i,3) = z_input;
    data(i,4) = out;
end
y = data;
end

