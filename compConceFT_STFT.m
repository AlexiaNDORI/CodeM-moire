% This code draws the ConceFT transform based on the synchrosqueezed short-time Fourier transform
% This code draws the ConceFT transform based on the synchrosqueezed wavelet transform
% load dat.mat;  %%Exemple par defaut
% N = 2^10; %N=length(x) ; T=1/N (1ms)
% Hz = N ;  %Frequenc Max=1024  (1kHz)
% L = 1 ;   %Temps Max (1s)
% 
% time = [1/Hz:1/Hz:L]' ;t=time;
% x=0.2*sin(5*pi*2*time)+0.1*cos(10*pi*2*time)+cos(30*pi*2*time)+sin(60*pi*2*time)+0.*sin(90*pi*2*time)+0.05*cos(120*pi*2*time);
% xm = x ;

% highFq = 130;
WinLen = 601;%301 ;
        %% Setup parameters
        %% alpha is the grid size in the freq axis
alpha = 0.25/Hz ;

MT = 10; %MT = 1: ordinary SST; MT > 1: ConceFT % number of random projections
hop = 1;
dim = 2; %1; 5% maximum order % number of orthogonal mother wavelet
supp = 6; %half time support (>= 6 recommended) 
Smooth = 1; % 0 or 1
Hemi = 1; % 0 or 1

% xm=0.2*sin(5*pi*2*time)+0.1*cos(10*pi*2*time)+cos(30*pi*2*time)+sin(60*pi*2*time)+0.5*sin(90*pi*2*time)+0.05*cos(120*pi*2*time);

%%%% call sqSTFT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[tfr, tfrtic, tfrsq, ConceFT, tfrsqtic] = ConceFT_STFT(xm,  0, 0.5*highfreq/Hz*2, alpha, hop, WinLen, dim, supp, MT, Smooth, Hemi) ;
pic = figure;
imageSQ(time, tfrsqtic*Hz, abs(ConceFT)) ; axis square; colorbar;
xlabel('Time') ; ylabel('Freq') ;
title(['ConceFT-STFT:MT=10, dim=2']);

% set(gca, 'FontSize', 18);
% b=get(gca);
% set(b.XLabel, 'FontSize', 18);set(b.YLabel, 'FontSize', 18);set(b.ZLabel, 'FontSize', 18);set(b.Title, 'FontSize', 18);
% str = 'results/nsSTFT';
% print(gcf, '-depsc2', str);      command = sprintf('epstopdf %s.eps',str);      system(command);


tfrsqtic=tfrsqtic(:)*Hz;
PostTrait_Freq;
