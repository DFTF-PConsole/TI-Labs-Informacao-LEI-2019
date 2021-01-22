%% Exercicio 2 (Inicio)
disp('Exercicio 2 - Pressiona Para Começar...');
pause;
    [Sinal, Fs] = audioread ("saxriff.wav");
    Info = audioinfo ('saxriff.wav');
    Quant = Info.BitsPerSample;
    Nome = Info.Filename';
    % Taxa = Info.SampleRate; (Redudante = Fs)


%% Exercicio 3
disp('Exercicio 3 - Pressiona Para Começar...');
pause;
    % wavplay
    AP = audioplayer (Sinal, Fs);
    AP.play();


%% Exercicio 4
disp('Exercicio 4 - Pressiona Para Começar...');
pause;
    apresentarInfo(Nome, Fs, Quant);


%% Exercicio 5
disp('Exercicio 5 - Pressiona Para Começar...');
pause;
    visualizacaoGrafica(Sinal, Fs);


%% Exercicio 6
disp('Exercicio 6 - Pressiona Para Começar...');
pause;

disp('***PRESS*** - Funcao com 2 parametros (NORMAL)');
pause;
    visualizacaoGrafica2(Sinal, Fs);
    
disp('***PRESS*** - Funcao com 3 parametros (TInicio)');    
pause;
    visualizacaoGrafica2(Sinal, Fs, 1);
    
disp('***PRESS*** - Funcao com 4 parametros (TInicio e TFim)');    
pause;
    visualizacaoGrafica2(Sinal, Fs, 1, 1.5);
    
disp('***PRESS*** - Funcao com 1 parametros (ERRO)');    
pause;
    visualizacaoGrafica2(Sinal);

%% Exercicio 7
disp('Exercicio 7 - Pressiona Para Começar...');
pause;
    visualizacaoGrafica3(Sinal, Fs, 0.05, 0.6, -0.3, 0.2);  % (Sinal, Fs, TInicio, TFim, AMin, AMax)
    
%% Exercicio 8
disp('Exercicio 8 - Pressiona Para Começar...');
pause;
    [SinalRuidoso] = ruido(Sinal, 0.5);
    % wavplay
    APNew = audioplayer (SinalRuidoso, Fs);
    APNew.play();
    
%% Exercicio 9
disp('Exercicio 9 - Pressiona Para Começar...');
pause;
    [EnergiaE, EnergiaD] = energia(Sinal);
    fprintf('Energia Stereo-Esquerdo: %d \n', EnergiaE);
    fprintf('Energia Stereo-Direita: %d \n', EnergiaD);

%% Exercicio 10
disp('Exercicio 10 - Pressiona Para Começar...');
pause;
FichNovoSinal = "beats.wav";    
[SinalMisturado, FsNovo] = substituaCanal(Sinal, FichNovoSinal, 2);     % (Sinal, FichNovoSinal, TInicio)
    
    % wavplay 10.2
    APMist = audioplayer (SinalMisturado, FsNovo);
    APMist.play();
    
    % Grafico 10.3
    visualizacaoGrafica(SinalMisturado, FsNovo);

disp('Press para começar II Parte...');
pause;
    
    % Mono e Mistura - Play e Grafico 10.4
    [SinalMonoMix] = monoMix(SinalMisturado);
    visualizacaoGraficaEspecial(SinalMonoMix, FsNovo);
    
    % Save 10.4
    audiowrite("MinhaMusica.wav", SinalMonoMix, FsNovo);
    
%% Exercicio 11
disp('Exercicio 11 - Pressiona Para Começar...');
pause;
    
    
    