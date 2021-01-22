function [] = apresentarInfo(Nome,Fs,Quant)
% Apresente no ecra informacoes sobre o ficheiro
% Informacao sobre o ficheiro; Nome do ficheiro; Taxa de amostragem;
% Quantizacao;
    n_max = length(Nome);
    NovoNome = "";
    for i = n_max:-1:1
        if ( Nome(i) == '\' )
            %if ( Nome(i-1) == '\' )
            NovoNome = Nome((i+1):n_max);
            %end
            break;
        end
    end
    disp('Informações sobre o Ficheiro:');
    fprintf('Nome do Ficheiro: %s \n', NovoNome); %criar algoritmo para ter apenas a ultima parte da string
    fprintf('Taxa de Amostragem: %.1f Hz \n', Fs);
    fprintf('Quantização: %d bits \n', Quant);
end

