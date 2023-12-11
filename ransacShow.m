function ransacShow (list)
    A_1 = [list(:, 1:2)];
    B_1 = [list(:, 3:4)];

    row_number = size(A_1, 1);
    ones_column = ones(row_number, 1);
    
    % convert in homogeneous coordinate and transpose, need to have every point in each column 
    A = [A_1, ones_column];
    A = A';
    % want to consider a row vector
    B = [B_1, ones_column];
    B = B';
    
    [bestF, consensus, outliers] = ransacF(A, B, 0.008);
    % Points of first image 
    A_2 = consensus(1:2, :)';
    B_2 = consensus(4:5, :)';
    visualizeEpipolarLines(imgM1, imgM2, bestF, A_2, B_2);

    % [bestF, consensus, outliers] = ransacF(A, B, 0.01);
   
end