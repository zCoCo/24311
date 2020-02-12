% Computes and displays an approximation of sin(x) using the taylor series 
% up to the given order (number of terms). Displays all lower orders as 
% well.
function approxSine(x, order)
    approx = 0; % Cumulative series approximation;
    fprintf("\t Order \t\t Exp \t\t sin(x) \t\t series \t\t %%error \n");
    for i = 1 : order
        expon = (2*i-1); % Exponent
        approx = approx + x^expon / factorial(expon) * (-1)^(i-1);
        sine = sin(x);
        fprintf("\t %d \t\t %d \t\t %0.7f \t\t %0.7f \t\t %0.7g \n", i, expon, sine, approx, percentError(sine,approx));
    end
end

function e = percentError(true, approx)
    e = (true - approx) / true * 100;
end