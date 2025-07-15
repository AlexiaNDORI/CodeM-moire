% load ('data_paper1.mat');  %%Signal de la BESS
% Y = fft( Ibess60(1:2500,1)); 
% L = length(Y); 
% Hz=25000
% 
% f = (0:L/2-1)*(Hz/L);  % Fréquence jusqu'à fs/2
% P2 = abs(Y/L);          % Normalisation
% 
% [pics,indice]=findpeaks(P2(1:L/2),'MinPeakHeight',.01/5); %Je prends l'index un parque le signal est en régime permanent
% Resultats=[f(indice)' 2*pics]
% % Spectre sur la moitié des fréquences
% figure;
% plot(f, 2*P2(1:L/2)); 
% xlabel('Fréquence (Hz)');
% ylabel('Amplitude normalisée');
% title('Spectre du signal (Moitié positive)');
% grid on;



% x= 0.5+sin(2*pi*60*time+pi/3)+.5*sin(2*pi*2*time+pi/2)+.05*sin(2*pi*120*time+pi/4)+.01*sin(2*pi*180*time+pi)+0.01*sin(2*pi*240*time-0.52)+.05*sin(2*pi*90*time+0.22);
% Y = fft( x); 
% L = length(Y); 
% Hz=2000;
% %time = [1/Hz:1/Hz:L]' ; t=time;dt=t(2)-t(1);Time=time;
% f = (0:L/2-1)*(Hz/L);  % Fréquence jusqu'à fs/2
% P2 = abs(Y/L);          % Normalisation
% Phase = rad2deg(angle(Y(1:L/2))); % Phase en radians
% Resultats=[f 2*P2(1:L/2) Phase(indice)]
% %Spectre sur la moitié des fréquences
% figure;
% plot(f, 2*P2(1:L/2)); 
% xlabel('Fréquence (Hz)');
% ylabel('Amplitude normalisée');
% title('Spectre du signal');
% grid on;

fs = 1024;                 % Fréquence d'échantillonnage (Hz)
T = 1/fs;                  % Période d'échantillonnage
t = 0:T:2;                 % Vecteur temps (2 secondes)
% 
% Modulation des fréquences : elles varient dans le temps
f1 = 60 + 10*t;    % La fréquence de la première sinusoïde passe de 60 Hz à 80 Hz
f2 = 30 + 20*t;    % La fréquence de la deuxième sinusoïde passe de 30 Hz à 70 Hz
f3 = 120 - 10*t;   % La fréquence de la troisième sinusoïde diminue de 120 Hz à 100 Hz
f4 = 180;          % Fréquence fixe pour comparaison
f5 = 240 - 20*t;   % La fréquence de la cinquième sinusoïde diminue de 240 Hz à 200 Hz
f6 = 90 + 15*t;    % La fréquence de la sixième sinusoïde passe de 90 Hz à 120 Hz
% 
% % Création du signal avec des fréquences variables
x = 0.5 + sin(2*pi*f1.*t + pi/3) + ...
    0.1*sin(2*pi*f2.*t + pi/2) + ...
    0.05*sin(2*pi*f3.*t + pi/4) + ...
    0.01*sin(2*pi*f4.*t + pi) + ...
    0.01*sin(2*pi*f5.*t - 0.52) + ...
    0.05*sin(2*pi*f6.*t + 0.22);

% % Affichage du signal dans le domaine temporel
% figure;
% plot(t, x);
% xlabel('Temps (s)');
% ylabel('Amplitude');
% title('Signal Non-Stationnaire Modulé');
% grid on;
N = length(x);             % Nombre de points du signal
Y = fft(x);                % Calcul de la FFT
P2 = abs(Y/N);             % Normalisation
P1 =[P2(1) 2*P2(2:N/2)] ;          % Prendre uniquement la moitié positive

f = (0:N/2-1)*(fs/N);      % Vecteur des fréquences
% Affichage du spectre de la FFT
figure;
stem(f, P1, Marker="+");
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
title('Spectre du Signal (FFT) - Limitations');
grid on;
