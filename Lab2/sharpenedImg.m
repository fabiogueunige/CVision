function sharpenedImg (img,detail_img,nomeImg)
%    

    sharpened_immage = img + 2*detail_img;
    
    figure;
    subplot(1,2,1);
    createGraph(img," ","Original image ","");
    subplot(1,2,2);
    createGraph(sharpened_immage," ","sharpened", "");
    sgtitle("Comparison between original and sharpened of "+nomeImg);
end