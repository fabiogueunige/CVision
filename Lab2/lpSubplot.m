function lpSubplot(LP,dim,out_gf,out_gf2,nomeImg)

    figure;
    subplot(2,3,1);
    surf (LP), colormap cool, title ("gaussian filter ");
    % imagefilename = 'D:\Matlab\ComputerVision\ComputerVIsion\Immagini\figurasurf';
    % 
    % print(imagefilename, '-dpng');

    subplot(2,3,4);
    createGraph(LP,nomeImg,"GaussianFilter with graph"," ");
    %I display the original images in grayscale
    subplot(2,3,2);
    createGraph(out_gf,nomeImg,"","gaussian-noise ");
    
    subplot(2,3,5);
    createHist(out_gf,"gausssian noise",nomeImg);
    
    subplot(2,3,3);
    createGraph(out_gf2,nomeImg,"",("S&Pnoise "));
    subplot(2,3,6);
    createHist(out_gf2,"S&P noise " ,nomeImg);

    sgtitle("Smoothing using LP Gaussian "+dim+"x"+dim+" pixel");
end