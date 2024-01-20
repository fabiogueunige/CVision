function [U,V, At, At1] = TwoFramesLK(pathframe1, pathframe2, windowSize)

    At = imread(pathframe1);
    At1 = imread(pathframe2);
    
    [rows, cols, dep]=size(At);
    if (dep==3)
        At = rgb2gray(At);
        At1 = rgb2gray(At1);
    end
    
    [U,V] = LucasKanade(At, At1, windowSize);
end

