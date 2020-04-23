% Finds Newton?s interpolating polynomial of order n for a given set of n+1
% data points. Takes two vectors containing the x and y value of the data 
% as well as the order n of the desired polynomial.
% Returns the interpolating polynomial as an anonymous/inline function. 
function f = interp_newton(x,y,n)
    % Validate Inputs:
    if length(x) ~= n+1 || length(y) ~= n+1
        error('n must be 1 greater than the number of datapoints and x and y must be the same size.');
    end
    if numel(x) ~= n+1 || numel(y) ~= n+1
        error('x and y must be vectors'); 
    end
    % Make column vectors:
    x = x(:); y = y(:);
    
    % Assign dependent variables to the first column of b:
    b = zeros(n+1,n+1);
    b(:,1) = y;
    for j = 2:(n+1)
        for i = 1:(n+2-j)
            b(i,j) = (b(i+1,j-1) - b(i,j-1)) / (x(i+j-1) - x(i));
        end
    end
    
    % Use the finite divided differences to interpolate:
    % Function of the polynomial (works even if xx is a vector):
    f = @(xx) b(1,:) * [ones(1,length(xx)); cumprod(xx(:)' - x(1:end-1), 1)];
end