% Performs 2D unconstrained optimization of a given anonymous function
% f(x,y) using Newton's 2D Hessian method with an initial guess of 
% (x0,y0), and stopping criteria of es, and a maximum iterations imax.
function [xc,yc,fc] = optim2d_newton(f, x0,y0, es, imax)
    syms x y;
    % Setup Derivatives:
    fx = fdiff_multi(f, [x,y], x);
    fy = fdiff_multi(f, [x,y], y);
    grad = @(x,y) [fx(x,y); fy(x,y)];
    
    % Setup Hessian:
    fxx = fdiff_multi(fx, [x,y], x);
    fyy = fdiff_multi(fy, [x,y], y);
    fxy = fdiff_multi(fx, [x,y], y);
    Hinv = @(x,y) inv([fxx(x,y), fxy(x,y); fxy(x,y), fyy(x,y)]);
    
    i = 0;
    Qc = [x0; y0];
    while norm(grad(Qc(1), Qc(2))) > es && i <= imax
        Qc = Qc - Hinv(Qc(1), Qc(2)) * grad(Qc(1), Qc(2));
        i = i + 1;
    end
    
    xc = Qc(1); yc = Qc(2);
    fc = f(xc,yc);
end