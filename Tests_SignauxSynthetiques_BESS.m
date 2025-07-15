%Compare signal;
clear 
clc
close all
load ('SignalStationnaireExper.mat');  %%Exemple par defaut
%load ("resultats.mat")
load("CompconceFTSTFT.mat")
N =25000; %N=length(x) ; T=1/N (1ms) %fréquence d'échantillonage du signal
%expérimental stationnaire
%N =1024; %N=length(x) ; T=1/N (1ms) %fréquence d'échantillonage du signal
%syntétique stationnaire
Hz = N ;  %Frequenc Max=1024  (1kHz)
L = 1;   %Temps Max (1s)
lowfreq = 0 ;
tic
time=time60(1:2500);

%time = [1/Hz:1/Hz:L]' ;
t=time;dt=t(2)-t(1);Time=time;
y= Ibess60(1:2500,1); %Signal Expérimental
% % Modulation des fréquences : elles varient dans le temps
f1 = 60 + 10*t;    % La fréquence de la première sinusoïde passe de 60 Hz à 80 Hz
f2 = 30 + 20*t;    % La fréquence de la deuxième sinusoïde passe de 30 Hz à 70 Hz
f3 = 120 - 10*t;   % La fréquence de la troisième sinusoïde diminue de 120 Hz à 100 Hz
f4 = 180;          % Fréquence fixe pour comparaison
f5 = 240 - 20*t;   % La fréquence de la cinquième sinusoïde diminue de 240 Hz à 200 Hz
f6 = 90 + 15*t;    % La fréquence de la sixième sinusoïde passe de 90 Hz à 120 Hz

% Création du signal avec des fréquences variables
z = 0.5 + sin(2*pi*f1.*t + pi/3)+ ...
    0.1*sin(2*pi*f2.*t + pi/2) + ...
    0.05*sin(2*pi*f3.*t + pi/4) + ...
    0.01*sin(2*pi*f4.*t + pi) + ...
    0.01*sin(2*pi*f5.*t - 0.52) + ...
    0.05*sin(2*pi*f6.*t + 0.22);
x= 0.5+sin(2*pi*60*time+pi/3)+.1*sin(2*pi*30*time+pi/2)+.05*sin(2*pi*120*time+pi/4)+.01*sin(2*pi*180*time+pi)+0.01*sin(2*pi*240*time-0.52)+.05*sin(2*pi*90*time+0.22); %Signal synthétique stationnaire
highfreq = 1200;
%highfreq = 280;
highglobal = highfreq;
xm = y;
diary on
%compCWT;%Wavelet
compSTFT;%STFT
%compConceFT_CWT; %Squeeze-Wavelet
%compConceFT_STFT;%Squeze-STFT

temps_execution = toc;
diary off
%mean(x)
