% Handcrafted matrix multiplication function
function C = matmult(A,B)
    % Validate Inputs:
    if ~(isnumeric(A) && isnumeric(B))
        error("Inputs must be numeric");
    end
    if ~(ismatrix(A) && ismatrix(B))
        error("Inputs must be 2D");
    end
    
    % Check size requirements:
    [ma,na] = size(A);
    [mb,nb] = size(B);
    
    if na ~= mb
        error('Matrix multiplication requires that the number of columns in A matches the number of rows in B');
    end
    
    C = zeros(ma,nb);
    for r = 1:ma
        for c = 1:nb
            C(r,c) = sum(A(r,:) .* B(:,c)');
        end
    end

end