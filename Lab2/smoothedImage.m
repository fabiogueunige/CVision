function detail_img_1 = smoothedImage (dim,img,nomeImg)
    % filtering with moving average (3x3)
    
    sigma = (3/2)/3;
    LP = fspecial('gaussian',3,sigma);
    
    A = mediaMAtrix(dim);
    smooted_image = conv2(img, A, 'same');
    
    %%Problemi con il meno!! Funziona su live script e qui no
    detail_img = img - smooted_image;
    
    % filtering with LPF gaussian filter (3x3)
    smooted_image_1 = conv2(img, LP, 'same');
    detail_img_1 = img - smooted_image_1;
    


    figure;
    subplot(1,2,1);
    createGraph(detail_img,"","", " using moving average filter");

    subplot(1,2,2);
    createGraph(detail_img_1,"","","  using LPF gaussian" );
    sgtitle("Only details of "+nomeImg+" image");
end