% Performs 2D unconstrained optimization of a given anonymous function
% f(x,y) using the optimal steepest descent method with an initial guess of 
% (x0,y0), and stopping criteria of es, and a maximum iterations imax.
function [xc,yc,fc] = optim2d_steep(f, x0,y0, es, imax)
    syms x y;
    fx = fdiff_multi(f, [x,y], x);
    fy = fdiff_multi(f, [x,y], y);
    
    % Predetermine static sym conversions for speed:
    symf = sym(f);
    
    i = 0;
    xc = x0; yc = y0;
    while norm([fx(xc,yc), fy(xc,yc)]) > es && i <= imax
        % Find Optimal Step Size:
        g = subs(symf, [x,y], {xc-x*fx(xc,yc),yc-x*fy(xc,yc)}); % 'x' is alpha in this case b/c that's what optimNewton expects
        a_opt = optimNewton(matlabFunction(g), 0.1, es, imax);
    
        % Perform Gradient Descent Update:
        x_new = xc - a_opt * fx(xc,yc);
        y_new = yc - a_opt * fy(xc,yc);
        xc = x_new; yc = y_new;
        
        i = i + 1;
    end
    
    fc = f(xc,yc);
end