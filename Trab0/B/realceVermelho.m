function [YNew] = realceVermelho(Y,Fator)
%
%  
    YNew = Y(:,:,:);
    %Temp = Fator * Y(:,:,:);
    %Temp(Temp>255) = 255;
    YNew(:,:,1) = YNew(:,:,1) * Fator;
    
end

