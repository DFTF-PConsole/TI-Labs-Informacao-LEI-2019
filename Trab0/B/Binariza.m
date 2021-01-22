function [YBina] = Binariza(YCinza,Limiar)
%
%   
    YBina = YCinza;
    IndexBranco = YCinza >= Limiar;
    IndexPreto = find(YCinza < Limiar);
    YBina(IndexBranco) = 255;
    YBina(IndexPreto) = 0;

    
end

