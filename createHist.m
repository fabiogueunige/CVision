function createHist (img,type,nomeImg)
%function that creates the histogram
    %figure;

    imhist(uint8(img),256), title("histo of "+type+" "+nomeImg+" image");
    xlabel("gray scale");
    ylabel("number of pixels");
    
    %%Only for saving all hinstograms

    % persistent index;  % Definisci la variabile persistente
    % 
    % if isempty(index)  % Inizializza la variabile alla prima chiamata
    %     index = 1;
    % end
    % 
    % imagefilename = strcat('D:\Matlab\ComputerVision\ComputerVIsion\Immagini\Subplot\Hist', num2str(index));
    % 
    % print(imagefilename, '-dpng');
    % index = index + 1;
end