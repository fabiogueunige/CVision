function [F] = EightPointsAlgorithm(P1, P2,row_number)
% Remember to pass P1 transpose

    % write the A matrix
    for i = 1:row_number
        a = P1(i,:) .* P2(:,i);
        A(i, :) = reshape(a, [1, 9]);        
    end

    % apply SDV decomposition to A mtrix
    [U, D, V] = svd(A);
    f = V(:, end);
    F = reshape(f, [3, 3]);
    
    % Force the rank of f to be 2
    [U, D, V] = svd(F);
    D(3,3) = 0;
    F = U*D*V';
end
