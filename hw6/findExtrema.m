% Find all local and absolute extrema of anonymous function f between xmin 
% and xmax using a random search, with max iterations imax.
% Returns a list of the x values of all the local minima, a list of the x 
% values of all the local maxima, as well as the x value of the absolute 
% minimum, and the x value of the absolute maximum.
function [xmins, xmaxs, absxmin, absxmax] = findExtrema(f, xmin, xmax, imax)
    rng('default');
    
    xmins = [];
    fmins = [];
    xmaxs = [];
    fmaxs = [];
    absxmin = Inf;
    absxmax = -Inf;
    
    i = 0;
    while i <= imax
        x0 = xmin + (xmax-xmin) * rand(1);
        [xc, isMin] = optimNewton(f, x0, 1e-8, 500);
        if ~isnan(isMin) && xc <= xmax && xc >= xmin
            if(isMin)
                xmins(end+1) = xc;
                fmins(end+1) = f(xc);
            else
                xmaxs(end+1) = xc;
                fmaxs(end+1) = f(xc);
            end
        end
        
        i = i+1;
    end

    % Select only unique points:
    [fmins, uidx] = unique(fmins);
    xmins = xmins(uidx);
    [fmaxs, uidx] = unique(fmaxs);
    xmaxs = xmaxs(uidx);
    
    if numel(xmins) > 0
        [~, absminidx] = min(fmins);
        absxmin = xmins(absminidx);
    end
    if numel(xmaxs) > 0
        [~, absmaxidx] = max(fmaxs);
        absxmax = xmaxs(absmaxidx);
    end
end