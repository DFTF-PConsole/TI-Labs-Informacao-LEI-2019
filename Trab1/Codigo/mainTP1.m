%%  LANDSCAPE
landscape = imread("data/landscape.bmp");
infoLandscape = imfinfo("data/landscape.bmp");
agLandscape = agrupaSimbolos(landscape, infoLandscape.BitDepth);
%%  MRI
mri = imread("data/MRI.bmp");
infoMri = imfinfo("data/MRI.bmp");
agMri = agrupaSimbolos(mri, infoMri.BitDepth);
%%  MRI_BIN
mri_bin = imread("data/MRIbin.bmp");
infoMri_bin = imfinfo("data/MRIbin.bmp");
agMri_bin = agrupaSimbolos(mri_bin, infoMri_bin.BitDepth);
%%  SOUNDMONO
soundMono = audioread("data/soundMono.wav");
infoSoundMono = audioinfo("data/soundMono.wav");
agSoundMono = agrupaSimbolos(soundMono, infoSoundMono.BitsPerSample);
%%  LYRICS
lyrics = fileread("data/lyrics.txt");
lyrics = lyrics(isstrprop(lyrics, "alpha"));
lyrics = double(lyrics);
agLyrics = agrupaSimbolos(lyrics,7);

%%  EX3
fprintf(1, "Limite mínimo teórico da média bits/símbolo:\n");
fprintf(1, "\tlandscape.bmp: %g\n", calcEntropia(landscape, infoLandscape.NumColormapEntries));
fprintf(1, "\tMRI.bmp: %g\n", calcEntropia(mri, infoMri.NumColormapEntries));
fprintf(1, "\tMRIbin.bmp: %g\n", calcEntropia(mri_bin, infoMri_bin.NumColormapEntries));
fprintf(1, "\tsoundMono.wav: %g\n", calcEntropia(soundMono, 2^infoSoundMono.BitsPerSample));
fprintf(1, "\tlyrics.txt: %g\n", calcEntropia(lyrics,2^7)); % 7 bits por carater em standard ASCII

figure(1);
subplot(321);
histogram(landscape, infoLandscape.NumColormapEntries);
title("landscape.bmp");
xlabel("Intensidade dos pixeis, no intervalo [0;255]");
ylabel("Ocorrências");
subplot(322);
histogram(mri, infoMri.NumColormapEntries);
title("MRI.bmp");
xlabel("Intensidade dos pixeis, no intervalo [0;255]");
ylabel("Ocorrências");
subplot(323);
histogram(mri_bin, infoMri_bin.NumColormapEntries);
title("MRIbin.bmp");
xlabel("Intensidade dos pixeis, no intervalo [0;255]");
ylabel("Ocorrências");
subplot(324);
histogram(soundMono, 2^infoSoundMono.BitsPerSample);
title("soundMono.wav");
xlabel("Amplitude do som, no intervalo [-1;1]");
ylabel("Ocorrências");
subplot(325);
histogram(lyrics, 2^7); % 7 bits por carater em standard ASCII
title("lyrics.txt");
xlabel("Carateres do alfabeto, representados em ASCII");
ylabel("Ocorrências");

%% EX4
fprintf(1, "Média de bits/símbolo usando códigos de Huffman:\n");
[c, v] = compHuffman(landscape, infoLandscape.NumColormapEntries);
fprintf(1, "\tlandscape.bmp: %g\n\t\tVariância: %g\n", c, v);
[c, v] = compHuffman(mri, infoMri.NumColormapEntries);
fprintf(1, "\tMRI.bmp: %g\n\t\tVariância: %g\n", c, v);
[c, v] = compHuffman(mri_bin, infoMri_bin.NumColormapEntries);
fprintf(1, "\tMRIbin.bmp: %g\n\t\tVariância: %g\n", c, v);
[c, v] = compHuffman(soundMono, 2^infoSoundMono.BitsPerSample);
fprintf(1, "\tsoundMono.wav: %g\n\t\tVariância: %g\n", c, v);
[c, v] = compHuffman(lyrics,2^7);
fprintf(1, "\tlyrics.txt: %g\n\t\tVariância: %g\n", c, v); % 7 bits por carater em standard ASCII

%% EX5
fprintf(1, "Limite mínimo teórico da média bits/símbolo (com agrupamentos 2 a 2):\n");
fprintf(1, "\tlandscape.bmp: %g\n", calcEntropia(agLandscape, (infoLandscape.NumColormapEntries)^2)/2);
fprintf(1, "\tMRI.bmp: %g\n", calcEntropia(agMri, (infoMri.NumColormapEntries)^2)/2);
fprintf(1, "\tMRIbin.bmp: %g\n", calcEntropia(agMri_bin, (infoMri_bin.NumColormapEntries)^2)/2);
fprintf(1, "\tsoundMono.wav: %g\n", calcEntropia(agSoundMono, (2^infoSoundMono.BitsPerSample)^2)/2);
fprintf(1, "\tlyrics.txt: %g\n", calcEntropia(agLyrics,(2^7)^2)/2);

figure(2);
subplot(321);
histogram(agLandscape, (infoLandscape.NumColormapEntries)^2);
title("landscape.bmp");
xlabel("Agrupamentos de intensidades dos pixeis");
ylabel("Ocorrências");
subplot(322);
histogram(agMri, (infoMri.NumColormapEntries)^2);
title("MRI.bmp");
xlabel("Agrupamentos de intensidades dos pixeis");
ylabel("Ocorrências");
subplot(323);
histogram(agMri_bin, (infoMri_bin.NumColormapEntries)^2);
title("MRIbin.bmp");
xlabel("Agrupamentos de intensidades dos pixeis");
ylabel("Ocorrências");
subplot(324);
histogram(agSoundMono, (2^infoSoundMono.BitsPerSample)^2);
title("soundMono.wav");
xlabel("Agrupamentos de amplitude do som");
ylabel("Ocorrências");
subplot(325);
histogram(agLyrics,(2^7)^2);
title("lyrics.txt");
xlabel("Agrupamentos de carateres do alfabeto");
ylabel("Ocorrências");

%% EX6a
step = 1;
query = [2 6 ; 4 9];
target = [6 8 9 7 ; 2 4 9 9 ; 4 9 1 4];
[matrixInfoMutua] = infoMutua(query, target, 4, step) % para representar todos os valores presentes em query e target são necessários 4 bits

%% EX6b
step = 15;
query = imread("data/mi_data/query.bmp");
infoQuery = imfinfo("data/mi_data/query.bmp");

%% TARGET_ORIGINAL
fprintf(1, "Informação mútua máxima nos 4 primeiros target: \n");
figure(3);

target = imread("data/mi_data/target_original.bmp");
[matrixInfoMutua] = infoMutua(query, target, infoQuery.BitDepth, step);
[arraySortedDescend, arrayIndex] = calcSort(matrixInfoMutua);
index = nan(1,2); 
index(1)= arrayIndex(1,1);   % index: i do elemento maior
index(2)= arrayIndex(2,1);  % index: j do elemento maior
maxValue = arraySortedDescend(1,1);
[x, y, width, height] = calcCoordinates(query, target, step, index); % index = elemento max do arrayInfoMutua
fprintf(1, "\ttarget_original.bmp: %g, em (x,y): (%d, %d)\n", maxValue, round(x), round(y));

subplot(221);
colormap(gray(256));
image(target)
title("target\_original.bmp");
axis off
rectangle('Position', [x, y, width, height], 'LineWidth', 2, 'LineStyle', '--', 'EdgeColor', 'r');

%% TARGET_NOISE
target = imread("data/mi_data/target_noise.bmp");
[matrixInfoMutua] = infoMutua(query, target, infoQuery.BitDepth, step);
[arraySortedDescend, arrayIndex] = calcSort(matrixInfoMutua);
index = nan(1,2); 
index(1)= arrayIndex(1,1);   % index: i do elemento maior
index(2)= arrayIndex(2,1);  % index: j do elemento maior
maxValue = arraySortedDescend(1,1);
[x, y, width, height] = calcCoordinates(query, target, step, index); % index = elemento max do arrayInfoMutua
fprintf(1, "\ttarget_noise.bmp: %g, em (x,y): (%d, %d)\n", maxValue, round(x), round(y));

subplot(222);
colormap(gray(256));
image(target)
title("target\_noise.bmp");
axis off
rectangle('Position', [x, y, width, height], 'LineWidth', 2, 'LineStyle', '--', 'EdgeColor', 'r');
%% TARGET_INVERTED
target = imread("data/mi_data/target_inverted.bmp");
[matrixInfoMutua] = infoMutua(query, target, infoQuery.BitDepth, step);
[arraySortedDescend, arrayIndex] = calcSort(matrixInfoMutua);
index = nan(1,2); 
index(1)= arrayIndex(1,1);   % index: i do elemento maior
index(2)= arrayIndex(2,1);  % index: j do elemento maior
maxValue = arraySortedDescend(1,1);
[x, y, width, height] = calcCoordinates(query, target, step, index); % index = elemento max do arrayInfoMutua
fprintf(1, "\ttarget_inverted.bmp: %g, em (x,y): (%i, %i)\n", maxValue, round(x), round(y));

subplot(223);
colormap(gray(256));
image(target);
title("target\_inverted.bmp");
axis off
rectangle('Position', [x, y, width, height], 'LineWidth', 2, 'LineStyle', '--', 'EdgeColor', 'r');
%% TARGET_LIGHTING_CONTRAST
target = imread("data/mi_data/target_lightning_contrast.bmp");
[matrixInfoMutua] = infoMutua(query, target, infoQuery.BitDepth, step);
[arraySortedDescend, arrayIndex] = calcSort(matrixInfoMutua);
index = nan(1,2); 
index(1)= arrayIndex(1,1);   % index: i do elemento maior
index(2)= arrayIndex(2,1);  % index: j do elemento maior
maxValue = arraySortedDescend(1,1);
[x, y, width, height] = calcCoordinates(query, target, step, index); % index = elemento max do arrayInfoMutua
fprintf(1, "\ttarget_lightning_contrast.bmp: %g, em (x,y): (%d, %d)\n", maxValue, round(x), round(y));

subplot(224);
colormap(gray(256));
image(target)
title("target\_lightning\_contrast.bmp");
axis off
rectangle('Position', [x, y, width, height], 'LineWidth', 2, 'LineStyle', '--', 'EdgeColor', 'r');

%% EX6c
figure(4);

target = imread("data/mi_data/target1.bmp");
[matrixInfoMutua] = infoMutua(query, target, infoQuery.BitDepth, step);
[arraySortedDescend, arrayIndex] = calcSort(matrixInfoMutua);
index = nan(1,2); 
index(1)= arrayIndex(1,1);   % index: i do elemento maior
index(2)= arrayIndex(2,1);  % index: j do elemento maior
maxValue = arraySortedDescend(1,1);
[x, y, width, height] = calcCoordinates(query, target, step, index); % index = elemento max do arrayInfoMutua
t = table("target1.bmp", maxValue, round(x), round(y));

subplot(221);
colormap(gray(256));
image(target);
title("target1.bmp");
axis off
rectangle('Position', [x, y, width, height], 'LineWidth', 2, 'LineStyle', '--', 'EdgeColor', 'r');

target = imread("data/mi_data/target2.bmp");
[matrixInfoMutua] = infoMutua(query, target, infoQuery.BitDepth, step);
[arraySortedDescend, arrayIndex] = calcSort(matrixInfoMutua);
index = nan(1,2); 
index(1)= arrayIndex(1,1);   % index: i do elemento maior
index(2)= arrayIndex(2,1);  % index: j do elemento maior
maxValue = arraySortedDescend(1,1);
[x, y, width, height] = calcCoordinates(query, target, step, index); % index = elemento max do arrayInfoMutua
t = [t;table("target2.bmp", maxValue, round(x), round(y))];

subplot(222);
colormap(gray(256));
image(target);
title("target2.bmp");
axis off
rectangle('Position', [x, y, width, height], 'LineWidth', 2, 'LineStyle', '--', 'EdgeColor', 'r');

target = imread("data/mi_data/target3.bmp");
[matrixInfoMutua] = infoMutua(query, target, infoQuery.BitDepth, step);
[arraySortedDescend, arrayIndex] = calcSort(matrixInfoMutua);
index = nan(1,2); 
index(1)= arrayIndex(1,1);   % index: i do elemento maior
index(2)= arrayIndex(2,1);  % index: j do elemento maior
maxValue = arraySortedDescend(1,1);
[x, y, width, height] = calcCoordinates(query, target, step, index); % index = elemento max do arrayInfoMutua
t = [t; table("target3.bmp", maxValue, round(x), round(y))];

subplot(223);
colormap(gray(256));
image(target);
title("target3.bmp");
axis off
rectangle('Position', [x, y, width, height], 'LineWidth', 2, 'LineStyle', '--', 'EdgeColor', 'r');

target = imread("data/mi_data/target4.bmp");
[matrixInfoMutua] = infoMutua(query, target, infoQuery.BitDepth, step);
[arraySortedDescend, arrayIndex] = calcSort(matrixInfoMutua);
index = nan(1,2); 
index(1)= arrayIndex(1,1);   % index: i do elemento maior
index(2)= arrayIndex(2,1);  % index: j do elemento maior
maxValue = arraySortedDescend(1,1);
[x, y, width, height] = calcCoordinates(query, target, step, index); % index = elemento max do arrayInfoMutua
t = [t; table("target4.bmp", maxValue, round(x), round(y))];

subplot(224);
colormap(gray(256));
image(target);
title("target4.bmp");
axis off
rectangle('Position', [x, y, width, height], 'LineWidth', 2, 'LineStyle', '--', 'EdgeColor', 'r');

t = sortrows(t, 2, 'descend');
fprintf(1, "Informação mútua no target*.bmp, por ordem decrescente:\n");
for i = 1:size(t,1)
   fprintf(1, "\t%s: %g, em (x,y): (%d, %d)\n", t{i,1}, t{i,2}, t{i,3}, t{i,4});
end