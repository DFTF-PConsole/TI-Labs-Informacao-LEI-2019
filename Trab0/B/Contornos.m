function [YConto] = Contornos(YBina)
%
%  
    Dimensao = size(YBina);
    Alt = Dimensao(1);
    Larg = Dimensao(2);
    YConto = YBina;
    YConto(:,:)=0;
    for i = 1:1:Alt
        iMais = i +1;
        if iMais > Alt
            iMais = i;
        end
        for j = 1:1:Larg
            jMais = j +1;
            if jMais > Larg
                jMais = j;
            end
            if (YBina(i,j)==0 && YBina(i,jMais)==255) || (YBina(i,j)==255 && YBina(i,jMais)==0) % (horinzontal, compara lado a lado)
                YConto(i,j)=255;
            end
            if (YBina(i,j)==0 && YBina(iMais,j)==255) || (YBina(i,j)==255 && YBina(iMais,j)==0)   % (vertical, compara cima e baixo)
                % Comparando com o resultado no enunciado, com este if (vertical) obtenho melhores resultados.
                YConto(i,j)=255;
            end
        end
    
    end

end

