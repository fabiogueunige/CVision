function [P] = loadPoints(name)
    Ptmp = load (name);
    oneColumn = ones(size(Ptmp,1),1);
    P = [Ptmp oneColumn];
end
