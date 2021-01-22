function f = agrupaSimbolos(fonte, bitsPsimbolo)
    fonte = double(fonte(:));
    f = zeros(ceil(length(fonte)/2), 1);
    
    if(rem(length(fonte),2) ~= 0)
        fonte = [fonte;0];
    end

    for i = 1:length(f)
        f(i) = fonte(2*i-1)*(2^bitsPsimbolo) + fonte(2*i);
    end
end