% Computes the derivative of a multivariate function with sym inputs, vars,
% with respect to sym variable d.
% Ensures the output function takes the same inputs as the input function 
% (no input dimension reduction from say f(x,y) to df(y) ).
% Input (func): An anonymous function
% Output (dfunc): Derivative of func as an anonymous function
function dfunc = fdiff_multi(func, vars, d)
    symf = sym(func);           % generate symbolic expression
    deriv = diff(symf,d);           % take derivative
    dfunc = matlabFunction(deriv, 'Vars', vars);    % generate function
end