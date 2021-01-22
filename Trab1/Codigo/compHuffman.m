function [l, v] = compHuffman(fonte, bins)
    nSimbolos = size(fonte, 1) * size(fonte, 2);

    t = histcounts(fonte,bins);
    t = t(t~=0); % remove as entradas dos símbolos do alfabeto que não existem na fonte
    t = t/nSimbolos;
    
    l = hufflen(t);
    v = var(l, t); % calcula a variância do comprimento dos códigos
    
    l = l*t';
end