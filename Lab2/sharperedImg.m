function [sharpening_filter] = sharperedImg (dim, img1, img2)
%
    
    A = mediaMAtrix(dim);
    B = bCreation(dim);

    sharpening_filter = (2 * B) - A;
    figure;
    surf (sharpening_filter), colormap cool, title ("sharpening filter");
    % imagefilename = 'D:\Matlab\ComputerVision\ComputerVIsion\Immagini\suf3';
    % 
    % print(imagefilename, '-dpng');
    
    sharpered_image1 = conv2(img1, sharpening_filter, 'same');
    
    sharpered_image2 = conv2(img2, sharpening_filter, 'same');
    
    figure;
    subplot(1,2,1);
    createGraph(sharpered_image1,"tree","sharpered ", " ");
    
    subplot(1,2,2);
    createGraph(sharpered_image2,"img i235","sharpered ","");
    

end