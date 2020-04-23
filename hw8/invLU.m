% Uses LU decomposition and associated Gaussian Elminination techniques to
% compute the inverse of the given square matrix A.
function X = invLU(A)
    arguments
        A(:,:) {validateattributes(A,{'numeric'},{'square'})} % ensure input is a square matrix
    end
    
    % Make sure matrix is not singular or ill-conditioned (warn if so):
    invertibleMatrix(A);
    
    % Break A apart into A=L*U:
    [L,U] = decompLU(A);
   
    n = size(A,2);
    I = eye(n);
    D = zeros(n);
    X = zeros(n);
    for c = 1:n
        D(:,c) = GaussNaive(L, I(:,c)); % Solve L*D=I for D
        X(:,c) = GaussNaive(U, D(:,c)); % Solve L*D=I for D
    end

end