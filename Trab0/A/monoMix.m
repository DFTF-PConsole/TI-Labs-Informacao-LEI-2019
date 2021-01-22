function [SinalMonoMix] = monoMix(SinalMisturado)
%
%   
    Tamanho = size(SinalMisturado);
    Tamanho = Tamanho(1,1);
    SinalMonoMix = nan(Tamanho, 1);
    
    for i = 1:1:Tamanho
        SinalMonoMix(i,1) = SinalMisturado(i,1) + SinalMisturado(i,2);
    end


end

