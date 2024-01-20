function mvSubplot (A,dim,out_ma1,out_ma2,nomeImg,type)
    figure;
    subplot(2,3,1);
    surf(A), colormap cool, title(dim+" support filter");
    % imagefilename = 'D:\Matlab\ComputerVision\ComputerVIsion\Immagini\suf2';
    % 
    % print(imagefilename, '-dpng');
    subplot(2,3,4);
    createHist(A,"Moving Avarage","Filter ");
    %I display the original images in grayscale
    subplot(2,3,2);
    createGraph(out_ma1,"",""," gaussian noise");
    
    subplot(2,3,5);
    createHist(out_ma1," ","Histogram of gaussian noise ");
    
    subplot(2,3,3);
    createGraph(out_ma2," ",""," salt&pepper noise");
    subplot(2,3,6);
    createHist(out_ma2," ","Histogram of S&P noise");

    sgtitle("Smoothing with Moving Avarege of "+nomeImg+ " with "+type);
end