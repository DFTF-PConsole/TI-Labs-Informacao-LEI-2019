function [SinalRuidoso] = ruido(Sinal, AmplitudeRuido)
% - Funcao que adicione ruido uniforme ao sinal. Esta funcao devera receber
%o sinal original e a amplitude do ruido e devolver o sinal original com ruido
% - Recorrer ao Rand do MatLAb
    Tamanho = size(Sinal);
    Aleat = -AmplitudeRuido + ( (2*AmplitudeRuido)*rand([Tamanho(1,1),Tamanho(1,2)]));
    SinalRuidoso = Sinal + Aleat;
    
end

