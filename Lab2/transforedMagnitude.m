function transforedMagnitude (img,nomeImg)
    img_fft = fft2(img);
    module_img = abs(img_fft);
    phi_img = angle(img_fft);
    
    
    figure;
    % subplot(2,2,1);
    createGraph((log(fftshift(module_img))),nomeImg,"fftshift(MOD)", " ");
    xlabel('wx'),ylabel('wy'),axis square;

    % subplot(2,2,2);
    % createGraph((fftshift(phi_img)),"","shift(PHI)", " ");
    % xlabel('wx'),ylabel('wy'),axis square;
    % 
    % subplot(2,2,3);
    % createGraph((real(fftshift((ifft2(module_img))))),"","ifft2(MOD)", " ");
    % xlabel('wx'),ylabel('wy'),axis square;
    % 
    % subplot(2,2,4);
    % createGraph((real((ifft2(exp(1i*phi_img))))),"","ifft2(exp)(...) of ", " ");
    % xlabel('wx'),ylabel('wy'),axis square;

    %sgtitle("Fourier Transform of "+nomeImg);

end