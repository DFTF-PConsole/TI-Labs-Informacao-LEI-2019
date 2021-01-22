function [ImagFinal] = mosaicos(ImagInicial, W)  % W = N.Pixeis a formar o mosaico (Numero Impar)
% NOTA AO NOME DAS VARIAVEIS INTERNAS DA FUNCAO:
%   Onde se le linha(s) devia se ler coluna(s) e vice-versa.

    ImagemSize = size(ImagInicial);
    Linhas = ImagemSize(2);   % Largura
    Colunas = ImagemSize(1);   % Comprimento
    ImagFinal = ones(Colunas, Linhas, 3, 'uint8');   %Matriz[j, i, rgb]
    rgb = 1;
    while rgb < 4
        
        iLinha = 1;
        while iLinha < Linhas
            iPixel = iLinha + floor(W/2);
            iFator = W;
            if (Linhas - iLinha) < W
                iLast = Linhas - iLinha;
                iLastMetade = floor(iLast/2);
                iPixel = iLastMetade;
                iFator = iLast;
            end
            
            jColuna = 1;
            while jColuna < Colunas
                jPixel = jColuna + floor(W/2);
                jFator = W;
                if (Colunas - jColuna) < W
                    jLast = Colunas - jColuna;
                    jLastMetade = floor(jLast/2);
                    jPixel = jLastMetade;
                    jFator = jLast;
                end
                
                Pixel = ImagInicial(jPixel, iPixel, rgb);
                ImagFinal( jColuna:(jColuna + jFator) , iLinha:(iLinha + iFator) , rgb ) = Pixel;
                jColuna = jColuna + jFator;
            end
            
            iLinha = iLinha + iFator;
        end
        
        rgb = rgb + 1;
    end
    
end

