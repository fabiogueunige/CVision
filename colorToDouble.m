function [img] = colorToDouble (img)
%Function that transform the image rom color to gray
    
    img = rgb2gray(img);
    img = double(img);
end