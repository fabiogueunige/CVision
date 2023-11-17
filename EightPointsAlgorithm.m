function [F] = EightPointsAlgorithm (P1,P2)
    A = P1'.*P2;
    [U,D,V] = svd(A);
    f = V(:,end);
    F = reshape(f',[3,3]);


end