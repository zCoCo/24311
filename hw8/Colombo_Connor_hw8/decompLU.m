% Performs LU decomposition using Naive Gaussian Elminination.
function [L,U] = decompLU(A)
    arguments
        A(:,:) {validateattributes(A,{'numeric'},{'square'})} % ensure input is a square matrix
    end
    
    % Make sure matrix is not singular or ill-conditioned (warn if so):
    invertibleMatrix(A);
    
    % Forward elimination, modified from p.239 in book to support growing L and U at same time:
    [m,n] = size(A);
    U = A; % U starts as A and is eliminated down
    L = eye(n); % L starts as In and is built up using the elimination factors
    for r = 2:m
        for c = 1:(r-1)
            L(r,c) = U(r,c) / U(c,c); % L is composed of the factors used in the elimination to produce U
            U(r,:) = U(r,:) - L(r,c) * U(c,:);
        end
    end
    
end