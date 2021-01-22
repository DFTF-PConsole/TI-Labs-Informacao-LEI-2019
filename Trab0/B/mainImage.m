%% Exercicio 2 (Inicio)
disp('Exercicio 2 - Pressiona Para Começar...');
pause;
    Y = imread("image008.jpg");
    
%% Exercicio 3 
disp('Exercicio 3 - Pressiona Para Começar...');
pause;
    Info = imfinfo("image008.jpg");
    %Info.Width >> 500 (largura)
    %Info.Height >> 460 (altura)
    %Info.CodingMethod >> Huffman
    
%% Exercicio 4 
disp('Exercicio 4 - Pressiona Para Começar...');
pause;
    colormap('default');
    image(Y);
    axis off;   % Retirar os eixos
    
%% Exercicio 5
disp('Exercicio 5 - Pressiona Para Começar...');
pause;
    colormap('default');
    YNew = realceVermelho(Y,2);
    image(YNew);
    
%% Exercicio 6
disp('Exercicio 6 - Pressiona Para Começar...');
pause;
    colormap('default');
    [ImagFinal] = mosaicos(Y,34);    % usar/testar imapares: 11 , 25 e 35 ||| PODE SE USAR 1 [Fica Igual]
    image(ImagFinal);
    axis off;
    
%% Exercicio 7
disp('Exercicio 7 - Pressiona Para Começar...');
pause;
    YCinza = zeros(Info.Height, Info.Width, 'uint8');
    YCinza = 0.2978*Y(:,:,1) + 0.5870*Y(:,:,2) + 0.1140*Y(:,:,3);
    colormap(gray(256));
    image(YCinza);
    
    
%% Exercicio 8
disp('Exercicio 8 - Pressiona Para Começar...');
pause;
    YBina = Binariza(YCinza, 100);  % Limiar = 100
    colormap(gray(256));
    image(YBina);
    
%% Exercicio 9 
disp('Exercicio 9 - Pressiona Para Começar...');
pause;
    [YConto] = Contornos(YBina);
    colormap(gray(256));
    image(YConto);
    axis off;
    
%% Exercicio 10
disp('Exercicio 10 - Pressiona Para Começar...');
pause;
    imwrite(YConto,'MinhaImagem.bmp','bmp'); %imwrite(A-Array,FILENAME,Formato)
    
