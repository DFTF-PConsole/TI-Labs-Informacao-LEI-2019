function e = calcEntropia(fonte,bins)
    nSimbolos = size(fonte, 1) * size(fonte, 2);
    
    t = histcounts(fonte, bins);
    t = t/nSimbolos;
    
    for k = 1:length(t)
        if(t(k) ~= 0)
            t(k) = t(k)*log2(t(k));
        end
    end
    e = -sum(t);
end