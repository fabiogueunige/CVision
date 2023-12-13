function imgConvKernel (gaussian_img,dim,nomeImg)
%function that performs image convolution operations using kernels B and C
    B = bCreation(dim);
    
    out1 = conv2(gaussian_img, B, 'same');
    figure;
    subplot(1,2,1);
    createGraph(out1,nomeImg, "no chenge slides 41 of"," ");
    %1 pixel left shift
    C = zeros(dim);
    C (4,dim) = 1;
      
    out2 = conv2(gaussian_img, C,'same');
    
    subplot(1,2,2);
    createGraph(out2,nomeImg, "right shift of "," ");
end