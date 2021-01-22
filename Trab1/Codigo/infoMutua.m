function [matrixInfoMutua] = infoMutua(query, target, bitsPerSymbol, step)
% CALCULAR A INFORMACAO MUTUA PARA CADA JANELA DO TARGET & QUERY
% I(X,Y) = H(Y) -  H(X,Y) + H(X)
% H(X) -> Query   | H(X) = 
% H(Y) -> partTarget
    
    % Iniciacao - 1.Parte
    [rowsQuery, columnsQuery] = size(query);
    [rowsTarget, columnsTarget] = size(target);
    
    %Calcular quantos i de iteracoes e se o ultimo step e maior que o target (linhas)
    n = rowsQuery;
    iFinal = 0;
    specialStepRows = 0;
    rowsFactor = 0;
    if n == rowsTarget
        rowsFactor = -1;
        specialStepRows = 0;
        iFinal = iFinal+1;
    elseif (n + step) > rowsTarget
        rowsFactor = -1;
    	specialStepRows = rowsTarget - n;
    	iFinal = iFinal+2;
    else
        while n <= rowsTarget 
            if (n + step) > rowsTarget
                specialStepRows = rowsTarget - n;
                iFinal = iFinal+1;
                break;
            end
            n = n + step;
            iFinal = iFinal+1;
        end
    end
    
    %Calcular quantos j de iteracoes e se o ultimo step e maior que o target (colunas)
    n = columnsQuery;
    jFinal = 0;
    specialStepColumns = 0;
    columnsFactor = 0;
    if n == columnsTarget
        columnsFactor = -1;
    	specialStepColumns = 0;
    	jFinal = jFinal+1;
    elseif (n + step) > columnsTarget
        columnsFactor = -1;
    	specialStepColumns = columnsTarget - n;
    	jFinal = jFinal+2;
    else
        while n <= columnsTarget
            if (n + step) > columnsTarget
                specialStepColumns = columnsTarget - n;
                jFinal = jFinal+1;
                break;
            end
            n = n + step;
            jFinal = jFinal+1;
        end
    end
        
    % Entropia do Query
    entropyQuery = calcEntropia(query, 2^bitsPerSymbol);
    % Iniciacao - 2.Parte
    matrixInfoMutua = zeros(iFinal,jFinal);
    stepRows = step;
    stepDoneRows =1;
    i = 1;
    
    % InfoMutua, Entropia partTarget, Entropia Conjunta
    while  i <= iFinal
        if ( ((iFinal - i) == 1) && (rowsFactor == -1) )
            stepRows = specialStepRows;
        end
        
    	stepDoneColumns =1;
        j = 1;
        stepColumns = step;
    	while j <= jFinal
            if ( ((jFinal - j) == 1) && (columnsFactor == -1) )
                stepColumns = specialStepColumns;
            end
            
            partTarget = target(stepDoneRows:(stepDoneRows+rowsQuery-1), stepDoneColumns:(stepDoneColumns+columnsQuery-1));
            entropyPartTarget = calcEntropia(partTarget, 2^bitsPerSymbol);
            
            %  ******  Retirado da internet - INICIO  *****
            % https://codeday.me/es/qa/20190304/273310.html
            indrow = double(query(:))+1;
            indcol = double(partTarget(:))+1; %// Should be the same size as indrow
            jointHistogram = accumarray([indrow indcol], 1);
            jointProb = jointHistogram / numel(indrow);
            indNoZero = jointHistogram ~= 0;
            jointProb1DNoZero = jointProb(indNoZero);
            jointEntropy = -sum(jointProb1DNoZero.*log2(jointProb1DNoZero));
            %    ******  Retirado da internet - FIM  *****
            
            matrixInfoMutua(i, j) = entropyQuery + entropyPartTarget - jointEntropy; 
            j = j + 1;
            stepDoneColumns = stepDoneColumns + stepColumns;
            
    	end
        stepDoneRows = stepDoneRows + stepRows;
        i = i + 1;
    end
end

