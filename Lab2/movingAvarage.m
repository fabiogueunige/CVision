function movingAvarage(gaussian_img,sp_img,dim,nomeImg,type)
   %function that reduce the noise with the moving avarage method
    A=mediaMAtrix(dim);
    
    out_ma1 = conv2(gaussian_img,A,'same'); % convolution between immage with gaussian noise and k matrix
    out_ma2=conv2(sp_img,A,'same');

    mvSubplot (A,dim,out_ma1,out_ma2,nomeImg,type);
end