function [F] = EightPointsAlgorithmN(P1, P2, row_number)

    [nP1, T1] = normalise2dpts(P1);
    [nP2, T2] = normalise2dpts(P2);
    
    % normalized founfamental matrix
    Z = EightPointsAlgorithm(nP1', nP2, row_number);
    F = (T2')*Z*(T1);

end

