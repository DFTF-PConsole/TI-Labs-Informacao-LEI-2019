function [EnergiaE, EnergiaD] = energia(Sinal)
% - Funcao para o calculo da energia do sinal; a função em causa
% devera receber o sinal (mono ou stereo) e devolver a sua energia (ou a energia de
% cada canal, no caso de sinais stereo), calculada segundo a formula:
% SOMATORIO: i=0(sum)N-1 [X^2(ti)]
% onde x representa o sinal em analise. Utilize a funcao sum do Matlab
    SinalD = ( Sinal(:,2).*Sinal(:,2) );
    SinalE = ( Sinal(:,1).*Sinal(:,1) );
    EnergiaD = sum(SinalD);
    EnergiaE = sum(SinalE);
    
end

