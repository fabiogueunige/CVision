function createGraph (img,nomeImg,startadd, endadd)
    %function that creates graphs
    imagesc(img), colormap gray, title(startadd+" "+ nomeImg+ " "+endadd);
    
    % %Only for saving all images and subplots
    % 
    % persistent index;  % Definisci la variabile persistente
    % 
    % if isempty(index)  % Inizializza la variabile alla prima chiamata
    %     index = 1;
    % end
    % 
    % imagefilename = strcat('D:\Matlab\ComputerVision\ComputerVIsion\Immagini\Subplot\figura', num2str(index));
    % 
    % print(imagefilename, '-dpng');
    % index = index + 1;

    %% Save an image with hold on 
    % frame = getframe(gcf);
    % 
    % % Converti il frame in un'immagine
    % img12 = frame2im(frame);
    % imwrite(img12, '2.png');

end