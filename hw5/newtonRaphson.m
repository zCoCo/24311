% Find the root of @f with the Newton-Raphson Method using x0 as an initial
% guess subject to the termination criteria: min/stopping approximation 
% error, es, and max iterations, imax. If plt is set to true, the
% convergence path will be plotted.
% Returns:
% xr, root found between lower and upper
% i, number of iterations required
function [xr, i] = newtonRaphson(f, x0, es, imax, plt)
    df = fdiff(f);
    
    if nargin < 5
        plt = false;
    end
    
    i = 0; ea = Inf; xr = x0;
    while ea > es && i <= imax
        xr_prev = xr;
        xr = xr - f(xr) / df(xr);
        if plt
            hold on
                quiver(xr_prev, f(xr_prev), (xr-xr_prev), (f(xr)-f(xr_prev)), 0, 'k');
            hold off
        end
        
        if x0 ~= 0
            ea = 100 * abs( (xr - xr_prev) / xr );
        end
        
        i = i+1;
    end
    
end