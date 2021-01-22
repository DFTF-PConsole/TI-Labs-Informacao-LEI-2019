function [arraySortedDescend, arrayIndex] = calcSort(matrixInfoMutua)
% ORDENAR NUM ARRAY, OS ELEMENTOS DA MATRIZ POR ORDEM DE DECRESCENTE 
% arrayIndex(2, n. elementos) , i(1.linha=index i/linha, 2.linha=index j/coluna) do elemento j >> matrixInfoMutua
% arraySortedDescend(1, n. elementos) >> matrixInfoMutua
    
    [rowsMatrixInfoMutua, columnsMatrixInfoMutua] = size(matrixInfoMutua);

    total = rowsMatrixInfoMutua * columnsMatrixInfoMutua;
    arraySortedDescend = nan(1, total);
    arrayIndex = nan(2, total);
    counter = 0;
    
    while counter < total
        
        maxValue = max(matrixInfoMutua, [], 'all');
        [rowsFind, columnsFind] = find(matrixInfoMutua==maxValue);
        [sizeFind, ~] = size(rowsFind);
        
        for i = 1:1:sizeFind
            counter = counter + 1;
            arraySortedDescend(1, counter) = maxValue;
            arrayIndex(1,counter) = rowsFind(i,1);
            arrayIndex(2,counter) = columnsFind(i,1);
            matrixInfoMutua(rowsFind(i,1), columnsFind(i,1)) = nan;
        end
    end
end

