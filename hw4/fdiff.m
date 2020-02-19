% Computes the derivative of a function
% Input (func): An anonymous function
% Output (dfunc): Derivative of func as an anonymous function
function dfunc = fdiff(func)
    syms x;                         % define a symbol
    symf = sym(func);           % generate symbolic expression
    deriv = diff(symf,x);           % take derivative
    dfunc = matlabFunction(deriv);    % generate function
end