% Find the root of @f with the Newton-Raphson Method using x0 as an initial
% guess subject to the termination criteria: min/stopping approximation 
% error, es, and max iterations, imax, .
% Returns:
% xr, root found between lower and upper
% i, number of iterations required
function [xr, i] = newtonRaphson(f, x0, es, imax)
    df = fdiff(f);
    
    i = 0; ea = Inf; xr = x0;
    while ea > es && i <= imax
        xr_prev = xr;
        xr = xr - f(xr) / df(xr);
        
        if x0 ~= 0
            ea = 100 * abs( (xr - xr_prev) / xr );
        end
        
        i = i+1;
    end
    
end