function [] = visualizacaoGrafica3(Sinal, Fs, TInicio, TFim, AMin, AMax)
% Execute o mesmo procedimento do ponto anterior, agora com a funcao axis do Matlab.
% restricao da zona de visualizacao e conseguida de forma mais simples atraves da funcao axis([xmin xmax ymin ymax]).
    Ts = 1/Fs;
    NAmostras = size(Sinal);
    Duracao = (0:NAmostras(1,1)-1) * Ts;
    % DESENHAR AQUI A FUNCAO --> VER EX 5.2 E 5.1 - A/FICHA1
    % Funcao - Canal Esquerdo
    subplot(2,1,1); % 2 linhas, 1 coluna, 1. posicacao
    plot(Duracao, Sinal);
    axis([TInicio TFim AMin AMax]);
    title('Canal Esquerdo');
    xlabel('Tempo (seg)');
    ylabel('Amplitude [-1;1]');
    % Funcao - Canal Direito
    subplot(2,1,2); % 2 linhas, 1 coluna, 2. posicacao
    plot(Duracao, Sinal(:,2:2));
    axis([TInicio TFim AMin AMax]);
    title('Canal Direito');
    xlabel('Tempo (seg)');
    ylabel('Amplitude [-1;1]');
end

