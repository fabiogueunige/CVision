function [gaussian_img] = gaussianNoise (img,stdDeviation)%,nomeImg)
%Gaussian noise with standard deviation
    gaussian_img = double(img)+stdDeviation*randn(size(img));
end
