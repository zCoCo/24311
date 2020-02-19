% Find the root of the function, f, with the Modified Secant 
% Method using x0 as an initial guess with a perturbation fraction dx,
% subject to the termination criteria: min/stopping approximation error, 
% es, and max iterations, imax.
% Returns:
% xr, root found between lower and upper
% i, number of iterations required
function [xr, i] = mod_secant(f, x0, dx, es, imax)
    i = 0; ea = Inf; xr = x0;
    while ea > es && i <= imax
        df = (f(xr+dx) - f(xr)) / dx;
        xr_prev = xr;
        xr = xr - f(xr) / df;
        
        if x0 ~= 0
            ea = 100 * abs( (xr - xr_prev) / xr );
        end
        
        i = i+1;
    end
    
end