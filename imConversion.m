function [imgnew] = imConversion (img)
    % Converts the image in gray scale
    imgnew = im2gray(img);
    % if size(img, 3) == 3 % Controlla se l'immagine ha 3 canali (è un'immagine RGB)
    %     img = im2gray(img); % Se è un'immagine RGB, converte in scala di grigi
    % end
end