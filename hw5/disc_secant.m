% Find the root of the discrete function, (x,y), where (x,y) are two vectors 
% comprising a list of discrete value pairs, with the Secant Method using 
% x0 and x1 as initial guesses, subject to the termination criteria: 
% min/stopping approximation error, es, and max iterations, imax.
% Returns:
% xr, root found between lower and upper
% i, number of iterations required
function [xr, i] = disc_secant(x,y, x0, x1, es, imax)
    % Use linear interpolation to allow estimation of any point along the
    % given discrete function
    f = @(xx) interp1(x,y, xx, 'linear', 'extrap');

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