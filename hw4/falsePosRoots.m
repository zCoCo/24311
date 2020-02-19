% Find the root of @f between the given lower bound, xl, and upper bound,
% xu, subject to the termination criteria: min/stopping approximation error,
% es, and max iterations, imax, using the false position method.
% Returns:
% x0, root found between lower and upper
% i, number of iterations required
% ea, final approximation error
function [x0, i, ea] = falsePosRoots(f, xl, xu, es, imax)
    
    if f(xl)*f(xu) > 0 % if sign doesn't change in [xl, xu]
        error("No iniial sign change between f(lower) and f(upper)");
    elseif f(xl)*f(xu) == 0
        % Unlikely, but one of the bounds sits exactly on a root
        if f(xl) == 0
            x0 = xl;
        else
            x0 = xu;
        end
    else % there's a sign change between the given bounds
        
        i = 0; ea = 100; x0 = xl;
        while ea > es && i <= imax
            % Compute a new guess for the root:
            x0_prev = x0;
            x0 = xu - f(xu) * (xl-xu) / (f(xl) - f(xu));
            if x0 ~= 0
                ea = 100 * abs( (x0 - x0_prev) / x0 );
            end
            
            % Perform search update:
            test = f(xl)*f(x0);
            if test < 0 % if sign changes in [xl, x0]
                xu = x0; % Make x0 the new upper bound
            elseif test > 0 % if sign changes in [x0, xu]
                xl = x0; % Make x0 the new lower bound
            else
                % An exact solution for the root has been found to within
                % the machine epsilon
                ea = 0;
            end
            
            i = i+1;
        end
        
    end
end