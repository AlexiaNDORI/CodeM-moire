%Compare signal;
close all
% load dat.mat;  %%Exemple par defaut
N = 2^10; %N=length(x) ; T=1/N (1ms)
Hz = N ;  %Frequenc Max=1024  (1kHz)
L = 1 ;   %Temps Max (1s)
lowfreq = 0 ;


time = [1/Hz:1/Hz:L]' ;t=time;dt=t(2)-t(1);Time=time;
if(0)
x=0.2*sin(5*pi*2*time)+0.1*cos(10*pi*2*time)+cos(30*pi*2*time)+sin(60*pi*2*time)+0.5*sin(90*pi*2*time)+0.05*cos(120*pi*2*time);
highfreq = 180 ;
else
x= 0.5+sin(2*pi*60*Time+pi/3)+.1*sin(2*pi*30*Time+pi/2)+.05*sin(2*pi*120*Time+pi/4)+.01*sin(2*pi*180*Time+pi)+0.01*sin(2*pi*240*Time-0.52)+.05*sin(2*pi*90*Time+0.22);
highfreq = 280 ;
end
highglobal = highfreq;
xm = x ;
diary on

outputDir = 'experimentations';
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end
 
diary on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  CWT  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global_title = "Experimentation du ";
method="SST-CWT";
path = "experimentations/output_SST-CWT.pdf";
opts = struct();

% Définir les plages de valeurs pour chaque paramètre
lowfreq_values = [0, 0.5];  % Fréquences basses
highfreq_values = [180, 280];  % Fréquences hautes
alpha_values = [0.01, 0.015, 0.025];  % Valeurs d'alpha
motherwavelet_values = {'morlet','Cinfc'}; %{'morlet','Cinfc', 'morse', 'meyer','BL3'}; 

% Générer toutes les combinaisons possibles
[lowfreq_grid, highfreq_grid, alpha_grid, wavelet_grid] = ndgrid(lowfreq_values, highfreq_values, alpha_values, 1:length(motherwavelet_values));

% Organiser les combinaisons sous forme de tableau
param_combinations = [lowfreq_grid(:), highfreq_grid(:), alpha_grid(:), wavelet_grid(:)];

% Itérer sur toutes les combinaisons
for i = 1:size(param_combinations, 1)
    % Extraire les paramètres actuels
    lowfreq = param_combinations(i, 1);
    highfreq = param_combinations(i, 2);
    alpha = param_combinations(i, 3);
    opts.motherwavelet = motherwavelet_values{param_combinations(i, 4)};

    compCWT; %SST-Wavelet
    params = {
        sprintf('Time: %d', length(time)), ...
        sprintf('Low Frequency: %f', lowfreq), ...
        sprintf('High Frequency: %f', highfreq), ...
        sprintf('Alpha: %f', alpha), ...
        sprintf('Motherwavelet: %s', opts.motherwavelet), ...
        %sprintf('Gamma: %f', Gamma), ...
        %sprintf('Nvoice: %d', Nvoice), ...
        %sprintf('Scale: %f', scale), ...
        %sprintf('Octave: %f', oct)
    };
    figure;
    annotation('textbox', [0.1, 0.3, 0.8, 0.4], 'String', strjoin(params, '\n'), 'FitBoxToText', 'on', 'FontSize', 10, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    
    set(gcf, 'PaperPositionMode', 'auto');
    exportgraphics(gcf, path, 'Append', true);
    close all;
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  STFT  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
method="SST-STFT";
path = "experimentations/output_SST-STFT.pdf";

% Définir les plages de valeurs pour chaque paramètre
mo_values = [1, 2, 3]; % Valeurs pour mo
tm_values = [6, 7, 8]; % Valeurs pour tm
Lowfreq_values = [0,0.5]; % Fréquences basses
Highfreq_values = [120.0, 180.0, 280.0]; % Fréquences hautes

% Générer toutes les combinaisons possibles
[mo_grid, tm_grid, Lowfreq_grid, Highfreq_grid] = ndgrid(mo_values, tm_values, Lowfreq_values, Highfreq_values);

% Organiser les combinaisons sous forme de tableau
param_combinations = [mo_grid(:), tm_grid(:), Lowfreq_grid(:), Highfreq_grid(:)];

% Itérer sur toutes les combinaisons
for i = 1:size(param_combinations, 1)
    % Extraire les paramètres actuels
    mo = param_combinations(i, 1);
    tm = param_combinations(i, 2);
    lowfreq = param_combinations(i, 3);
    highfreq = param_combinations(i, 4);

    compSTFT; %SST-STFT

    params = {
        %sprintf('Opt.Winlen: %d (Nombre de points ou longueur de la fenêtre)', opts.Winlen), ...
        %sprintf('Alpha (Grid Size in Frequency Axis): %f', Alpha), ...
        %sprintf('Hermf: %f (Maximum Order, tm or Half-time support)', Hermf), ...
        sprintf('mo: %f', mo), ...
        sprintf('tm : %f', tm), ...
        sprintf('Lowfreq: %f', lowfreq), ...
        sprintf('Highfreq: %f', highfreq),
    };
    
    figure;
    annotation('textbox', [0.1, 0.3, 0.8, 0.4], 'String', strjoin(params, '\n'), 'FitBoxToText', 'on', 'FontSize', 10, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    
    set(gcf, 'PaperPositionMode', 'auto');
    exportgraphics(gcf, path, 'Append', true);
    close all;
end


%method="WPT";
%path = "experimentations/output_WPT.pdf";
%compWPT; %Wavelet Packet
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ConceFT_CWT  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



method="ConceFT_CWT";
path = "experimentations/output_ConceFT_CWT.pdf";


% Définir les plages de valeurs pour chaque paramètre
Lowfreq_values = [0,0.5]; % Fréquences basses
Highfreq_values = [130.0, 180.0,280.0]; % Fréquences hautes
MT_values = [2, 5, 10, 20];  % Nombre de projections aléatoires (doit être > 1)
Hemi_values = 1;  % Paramètre pour l'analyse hémisphérique
motherwavelet_values = {'morlet','Cinfc'}; 

% Générer toutes les combinaisons possibles
[MT_grid, Hemi_grid,Lowfreq_grid,Highfreq_grid,wavelet_grid] = ndgrid(MT_values, Hemi_values,Lowfreq_values,Highfreq_values, 1:length(motherwavelet_values));

% Organiser les combinaisons sous forme de tableau
param_combinations = [MT_grid(:), Hemi_grid(:),Lowfreq_grid(:),Highfreq_grid(:), wavelet_grid(:)];

% Itérer sur toutes les combinaisons
for i = 1:size(param_combinations, 1)
    % Extraire les paramètres actuels
    MT = param_combinations(i, 1);
    Hemi = param_combinations(i, 2);
    lowfreq= param_combinations(i, 3);
    highfreq= param_combinations(i, 4);
    opts.motherwavelet = motherwavelet_values{param_combinations(i, 5)};

    compConceFT_CWT; %ConceFT-CWT

    params = {
        sprintf('MT: %d (Number of random projections, must be > 1)', MT), ...
        sprintf('Hemi: %d (Hemispheric analysis parameter)',Hemi), ...
        sprintf('Lowfreq: %f', lowfreq), ...
        sprintf('Highfreq: %f', highfreq),
    };
    figure;
    annotation('textbox', [0.1, 0.3, 0.8, 0.4], 'String', strjoin(params, '\n'), 'FitBoxToText', 'on', 'FontSize', 10, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    
    set(gcf, 'PaperPositionMode', 'auto');
    exportgraphics(gcf, path, 'Append', true);
    close all;
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Squeze-STFT  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



method="ConceFT-STFT";
path = "experimentations/output_ConceFT_STFT.pdf";

% Définir les plages de valeurs pour chaque paramètre
Lowfreq_values = [0, 0.5]; % Fréquences basses
Highfreq_values = [130.0, 180.0,280.0]; % Fréquences hautes
MT_values = [2, 5, 10, 20];  % Nombre de projections aléatoires (doit être > 1)
Hemi_values = 1;  % Paramètre pour l'analyse hémisphérique
Hop_values = [0.5, 1] % Paramètre de chevauchement des fenêtres
dim_values = [1, 2, 3, 5]; % Exemples de dimensions
supp_values = [6, 10, 15, 20]; % Exemples de valeurs pour "supp"

% Générer toutes les combinaisons possibles
[MT_grid, Hemi_grid,Lowfreq_grid,Highfreq_grid,dim_grid, supp_grid] = ndgrid(MT_values, Hemi_values,Lowfreq_values,Highfreq_values,dim_values, supp_values);

% Organiser les combinaisons sous forme de tableau
param_combinations = [MT_grid(:), Hemi_grid(:),Lowfreq_grid(:),Highfreq_grid(:),dim_grid(:), supp_grid(:)];

% Itérer sur toutes les combinaisons
for i = 1:size(param_combinations, 1)
    % Extraire les paramètres actuels
    MT = param_combinations(i, 1);
    Hemi = param_combinations(i, 2);
    lowfreq= param_combinations(i, 3);
    highfreq= param_combinations(i, 4);
    dim = param_combinations(i, 5);
    supp = param_combinations(i, 6);


    compConceFT_STFT; %Squeze-STFT
    params = {
        sprintf('MT: %d (Number of random projections, must be > 1)', MT), ...
        sprintf('Hemi: %d (Hemispheric analysis parameter)',Hemi), ...
        sprintf('dim : %d', dim ), ...
        sprintf('supp : %d',supp ), ...
        sprintf('Lowfreq: %f', lowfreq), ...
        sprintf('Highfreq: %f', highfreq),
    };
    figure;
    annotation('textbox', [0.1, 0.3, 0.8, 0.4], 'String', strjoin(params, '\n'), 'FitBoxToText', 'on', 'FontSize', 10, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    
    set(gcf, 'PaperPositionMode', 'auto');
    exportgraphics(gcf, path, 'Append', true);
    close all;
end

diary off