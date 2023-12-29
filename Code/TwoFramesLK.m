function [U,V] = TwoFramesLK(pathframe1, pathframe2, windowSize)

    At = imread(pathframe1);
    At1 = imread(pathframe2);
    
    [rows, cols, dep]=size(At);
    if (dep==3)
        At = rgb2gray(At);
        At1 = rgb2gray(At1);
    end
    
    [U,V] = LucasKanade(At, At1, windowSize);
    
    figure
    subplot(1,2,1)
    imshow(At)
    subplot(1,2,2)
    imshow(At+1)
    figure
    % SEE help quiver for more information
    quiver(U(1:10:size(U,1), 1:10:size(U,2)), V(1:10:size(V,1), 1:10:size(V,2)))
    % suggestion to use somethng bigger than 1
    
    %Uso quiver(u, -v, 0) per visualizzare il campo vettoriale (u,v)
    %
    quiver(Reduce((Reduce(medfilt2(flipud(U),[5 5])))), -Reduce((Reduce(medfilt2(flipud(V),[5 5])))), 0), axis equal
end

function result = Reduce(matrix)
    result = matrix(1:2:end, 1:2:end);
end