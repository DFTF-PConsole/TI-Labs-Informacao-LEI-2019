function [x, y, width, height] = calcCoordinates(query, target, step, index)
% CALCULAR AS COORDENADAS X E Y DADO O INDEX DA JANELA NA MATRIZ InfoMutua E O TAMANHO DA JANELA = Query 
    % Inicicao
    [rowsQuery, columnsQuery] = size(query);
    [rowsTarget, columnsTarget] = size(target);
    rowsIndex = index(1);
    columnsIndex = index(2);
    
    % calculo posicao x com base nas colunas
    if (1 + columnsQuery + step*(columnsIndex-1)) > columnsTarget
        x = columnsTarget - columnsQuery - 0.5;
    else
        x = 0.5 + step*(columnsIndex-1);
    end
    
    % calculo posicao y com base nas linhas
    if (1 + rowsQuery + step*(rowsIndex-1)) > rowsTarget
        y = rowsTarget - rowsQuery - 0.5;
    else
        y = 0.5 + step*(rowsIndex-1);
    end
    
    % calculo da largura e do comprimento da janela = tamanho query
    width = columnsQuery;
    height = rowsQuery;
end

