function lpGaussianFilter (gaussian_img,sp_img,dim,nomeImg)
% function of filtering with low pass gaussian filter
    
    sigma = (dim/2)/3;
    LP = fspecial('gaussian',dim,sigma);
    % apply gauusian filter to immage1 with gaussian_noise
    out_gf = conv2(gaussian_img, LP, 'same');
     

    % apply gaussian filter to immage1 with sp_noise
    out_gf2 = conv2(sp_img, LP, 'same');

    lpSubplot(LP,dim,out_gf,out_gf2,nomeImg);
     
end