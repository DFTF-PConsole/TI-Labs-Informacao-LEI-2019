function [] = visualizacaoGrafica2(Sinal, Fs, TInicio, TFim)
% Torne a funcao anterior mais generica, atraves da definicao do intervalo de tempo de graficacao
%- No caso de apenas serem introduzidos os dois primeiros argumentos, o
%funcionamento devera ser identico ao do ponto 5.
%- No caso de se introduzir tambem o instante inicial, devera fazer o plot
%desde ai ate ao fim do sinal.
%- Caso sejam introduzidos os 4 parametros, o plot devera ser restringido ao
%intervalo [tIni, tEnd]

    switch nargin
        case 2
            Ts = 1/Fs;
            NAmostras = size(Sinal);
            Duracao = (0:NAmostras(1,1)-1) * Ts;
            % DESENHAR AQUI A FUNCAO --> VER EX 5.2 E 5.1 - A/FICHA1
            % Funcao - Canal Esquerdo
            subplot(2,1,1); % 2 linhas, 1 coluna, 1. posicacao
            plot(Duracao, Sinal);
            title('Canal Esquerdo');
            xlabel('Tempo (seg)');
            ylabel('Amplitude [-1;1]');
            % Funcao - Canal Direito
            subplot(2,1,2); % 2 linhas, 1 coluna, 2. posicacao
            plot(Duracao, Sinal(:,2:2));
            title('Canal Direito');
            xlabel('Tempo (seg)');
            ylabel('Amplitude [-1;1]');
    
        case 3
            Ts = 1/Fs;
            NAmostras = size(Sinal);
            Duracao = (0:NAmostras(1,1)-1) * Ts;
            % DESENHAR AQUI A FUNCAO --> VER EX 5.2 E 5.1 - A/FICHA1
            % Funcao - Canal Esquerdo
            subplot(2,1,1); % 2 linhas, 1 coluna, 1. posicacao
            plot(Duracao, Sinal);
            Valor = Duracao(1,size(Duracao));
            xlim([TInicio Valor(1,2)]);
            title('Canal Esquerdo');
            xlabel('Tempo (seg)');
            ylabel('Amplitude [-1;1]');
            % Funcao - Canal Direito
            subplot(2,1,2); % 2 linhas, 1 coluna, 2. posicacao
            plot(Duracao, Sinal(:,2:2));
            xlim([TInicio Valor(1,2)]);
            title('Canal Direito');
            xlabel('Tempo (seg)');
            ylabel('Amplitude [-1;1]');
            
        case 4
            Ts = 1/Fs;
            NAmostras = size(Sinal);
            Duracao = (0:NAmostras(1,1)-1) * Ts;
            % DESENHAR AQUI A FUNCAO --> VER EX 5.2 E 5.1 - A/FICHA1
            % Funcao - Canal Esquerdo
            subplot(2,1,1); % 2 linhas, 1 coluna, 1. posicacao
            plot(Duracao, Sinal);
            xlim([TInicio TFim]);
            title('Canal Esquerdo');
            xlabel('Tempo (seg)');
            ylabel('Amplitude [-1;1]');
            % Funcao - Canal Direito
            subplot(2,1,2); % 2 linhas, 1 coluna, 2. posicacao
            plot(Duracao, Sinal(:,2:2));
            xlim([TInicio TFim]);
            title('Canal Direito');
            xlabel('Tempo (seg)');
            ylabel('Amplitude [-1;1]');
            
        otherwise
            disp("ERRO NA FUNCAO visualizacaoGrafica2: Numeros de Inputs Inesperados");
    end
end

