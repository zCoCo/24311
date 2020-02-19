% Find the root of @f with the Secant Method using x0 and x1 as an initial
% guesses subject to the termination criteria: min/stopping approximation 
% error, es, and max iterations, imax, .
% Returns:
% xr, root found between lower and upper
% i, number of iterations required
function [xr, i] = secant(f, x0, x1, es, imax)
    i = 0; ea = Inf; xr = x1; xr_prev = x0;
    while ea > es && i <= imax
        df = (f(xr_prev) - f(xr)) / (xr_prev - xr);
        xr_prev = xr;
        xr = xr - f(xr) / df;
        
        if x0 ~= 0
            ea = 100 * abs( (xr - xr_prev) / xr );
        end
        
        i = i+1;
    end
    
end