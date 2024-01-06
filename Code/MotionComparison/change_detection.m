function [It, Bt,Mt] = change_detection(Bprev, filename, TAU, TAU_PRIMO, ALPHA)
    
    % Play with these parameters

    
    % Now start the change detection while updating the background with the
    % running average. For that you have to set the values for TAU and ALPHA

    % For loop started here
    It = imread(filename);
    Ig = rgb2gray(It);
    
    Mt = (abs(double(Ig) - Bprev) > TAU);
    
    % Implement the background update as a running average (SEE THE SLIDES)
    Dt = (abs(double(Ig)) - abs(Bprev));
    if (Dt > TAU_PRIMO)
        Bt = Bprev;
    else
        Bt = ((1 - ALPHA) * Bprev + ALPHA * (double(Ig)));
    end    
end
