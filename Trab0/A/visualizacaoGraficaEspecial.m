function [] = visualizacaoGraficaEspecial(Sinal, Fs)
% apresente o sinal audio num grafico 2D
	
	Ts = 1/Fs;
    NAmostras = size(Sinal);
    Duracao = (0:NAmostras(1,1)-1) * Ts;
    
    % DESENHAR AQUI A FUNCAO --> VER EX 5.2 E 5.1 - A/FICHA1
    % Funcao - Canal Esquerdo
    subplot(1,1,1); % 2 linhas, 1 coluna, 1. posicacao
    plot(Duracao, Sinal(:,1));
    title('Canal Esquerdo');
    xlabel('Tempo (seg)');
    ylabel('Amplitude [-1;1]');

    
end