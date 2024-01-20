function [zero_matrix] = magnitudeTranSharpening(dim,sharpening_filter)
    zero_matrix = zeros(dim, dim);
    
    % find the center of big matrix
    center_row = ceil(size(zero_matrix, 1) / 2);
    center_column = ceil(size(zero_matrix, 2) / 2);
    
    % calculate the starting_point, the row and the column
    start_row = center_row - 3; 
    start_column = center_column - 3;
    
    zero_matrix(start_row:(start_row+6), start_column:(start_column+6)) = sharpening_filter;

end