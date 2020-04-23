% Performs 1D optimization of the given function, f, using Newton's method
% with an initial guess of x0, and stopping criteria of es, and a maximum
% iterations imax.
% Returns critical point, xc, and sets isMin to 1 if xc is a minimum, 0 if
% it is a maximum, and NaN if it is neither (inflection point).
function [xc, isMin] = optimNewton(f, x0, es, imax)
    df = fdiff(f);
    ddf = fdiff(df);
    
    isMin = NaN;
    xc = x0;
    ea = Inf;
    i = 0;
    while ea > es && i <= imax
        xc_new = xc - df(xc)/ddf(xc);
        ea = 100 * abs( (xc_new - xc) / xc_new );
        xc = xc_new;
        
        if ddf(xc) < 0
            isMin = 0;
        elseif ddf(xc) > 0
            isMin = 1;
        else
            isMin = NaN;
        end
        
        i = i+1;
    end
end