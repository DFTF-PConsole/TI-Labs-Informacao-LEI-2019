function [SinalMisturado, FsNovo] = substituaCanal(Sinal, FichNovoSinal, TInicio)
% 
%   
    [SinalNovo, FsNovo] = audioread (FichNovoSinal);
    AmostrasZeroInicio = TInicio * FsNovo;       % Tempo = n_amostras / Fs <==> n_amostras = Tempo * Fs(Frequencia)
    SizeSinal = size(Sinal);
    SizeSinal = SizeSinal(1,1);
    SizeSinalNovo = size(SinalNovo);
    SizeSinalNovo = SizeSinalNovo(1,1);
    if ( SizeSinal > (SizeSinalNovo+AmostrasZeroInicio) )
        Tamanho = SizeSinal;
    else
        Tamanho = (SizeSinalNovo+AmostrasZeroInicio);
    end
    SinalMisturado = nan(Tamanho, 2);
    for i = 1:1:AmostrasZeroInicio      % coluna 2 >>> lado direito
        SinalMisturado(i,2) = 0;
    end
    for i = 1:1:SizeSinalNovo
        SinalMisturado((i+AmostrasZeroInicio),2) = SinalNovo(i,1);      %Usar lado esquerdo >>>> lado direito
    end
    for i = (SizeSinalNovo+AmostrasZeroInicio):1:Tamanho
        SinalMisturado(i,2) = 0;
    end
    for i = 1:1:SizeSinal      % Coluna 1 >>> Lado Esquerdo
        SinalMisturado(i,1) = Sinal(i,1);
    end
    for i = SizeSinal:1:Tamanho
        SinalMisturado(i,1) = 0;
    end
    
    
end

