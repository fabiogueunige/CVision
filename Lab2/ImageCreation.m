function ImageCreation(img,gaussian_img,sp_img,name)
   %Function that creates the subplot for all the images 
    figure; 
    subplot(2,3,1);
    createGraph(img,"", "Original "," ");
    subplot(2,3,4);
    createHist(img,"Original","");
    %I display the original images in grayscale
    subplot(2,3,2);
    createGraph(gaussian_img,"","gaussian noise","with 20 dev standard");
    subplot(2,3,5);
    createHist(gaussian_img,"Gaussian noise","");
    
    subplot(2,3,3);
    createGraph(sp_img,"","Salt & Pepper noise","with 20 distr density");
    subplot(2,3,6);
    createHist(sp_img,"Salt & Pepper","");
    sgtitle("Imge "+name+" with noise comparison");

end