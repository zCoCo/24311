% Performs least-squares linear regression to determine a best fit line 
% given two vectors containing the x and y coordinates of the data.
% Returns a vector containing the a0 and a1 coefficients of the best-fit 
% line, and the coefficient of determination r2.
function [a, r2] = lsq_linear(x,y)
    % Validate inputs:
    n = length(x);
    if length(y) ~= n
        error('x and y must be same length'); 
    end
    if numel(x) ~= n || numel(y) ~= n
        error('x and y must be vectors'); 
    end
    % Make column vectors:
    x = x(:); y = y(:);
    
    % Compute core paramters:
    sx = sum(x);
    sx2 = sum(x.^2);
    sy = sum(y);
    sy2 = sum(y.^2);
    syx = sum(y.*x);
    
    % Perform Regression:
    a = [n sx; sx sx2] \ [sy; syx];
    r2 = ((n*syx-sx*sy)/sqrt(n*sx2-sx^2)/sqrt(n*sy2-sy^2))^2;
end