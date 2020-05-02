% Checks to see if the given matrix is nicely invertible (not singular or
% ill-conditioned).
function good = invertibleMatrix(M)
    if ~isnumeric(M)
        error("Input must be numeric");
    end
    if ~ismatrix(M)
        error("Input must be a 2D matrix");
    end
    if diff(size(M))
        error("Input must be square");
    end
    
    good = det(M)~=0;
    
    if ~good
        error('Determinant is zero. Matrix input must be invertible and not singular.');
    end
    
    good = good & abs(det(M)) > 1e-12;
    
    if ~good
        warning('Determinant magnitude is close to zero thus matrix is close to singular and ill-conditioned.');
    end
end