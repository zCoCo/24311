% Checks to see if the given matrix is nicely invertible (not singular or
% ill-conditioned).
function good = invertibleMatrix(M)
    arguments
        M(:,:) {validateattributes(M,{'numeric'},{'square'})} % ensure input is a square matrix
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