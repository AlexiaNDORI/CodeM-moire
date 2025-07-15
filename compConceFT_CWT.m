% This code draws the ConceFT transform based on the synchrosqueezed wavelet transform
% load dat.mat;  %%Exemple par defaut
% N = 2^10; %N=length(x) ; T=1/N (1ms)
% Hz = N ;  %Frequenc Max=1024  (1kHz)
% L = 1 ;   %Temps Max (1s)
% 
% time = [1/Hz:1/Hz:L]' ;
% x=0.2*sin(5*pi*2*time)+0.1*cos(10*pi*2*time)+cos(30*pi*2*time)+sin(60*pi*2*time)+0.*sin(90*pi*2*time)+0.05*cos(120*pi*2*time);
% xm = x ;
% lowfreq = 0 ;
% highfreq = 130 ;

opts = struct();
opts.motherwavelet = 'Cinfc' ;
opts.CENTER = 1 ;
opts.FWHM = 0.3 ;
opts.dim = 2;%1; 5% maximum order


%% 
% Hz = 2*2^10 ;
% L = 1 ;
% time = [1/Hz:1/Hz:L]' ;
% N = length(time) ;
alpha = 0.25 ;
MT = 10;
Smooth = 1;
Hemi = 1;

scrsz = get(0,'ScreenSize');

% load dat.mat;
% xm = (x);
% xm=0.2*sin(5*pi*2*time)+0.1*cos(10*pi*2*time)+cos(30*pi*2*time)+sin(60*pi*2*time)+0.*sin(90*pi*2*time)+0.05*cos(120*pi*2*time);

[tfrsq, ConceFT, tfrsqtic] = ConceFT_CWT(time, xm, lowfreq, highfreq, alpha, MT, opts, Smooth, Hemi) ;
%[~, tfrsq, ~, tfrsqtic] = sqCWT(time, xm, lowfreq, highfreq, alpha, opts);
figure;
imageSQ(time, tfrsqtic, abs(ConceFT)); axis square;colorbar;
xlabel('Time') ; ylabel('Freq') ; 
title(['ConceFT-CWT:MT=',num2str(MT)]);
% figure;
% imageSQ(time, tfrsqtic, angle(ConceFT)); axis square;
% xlabel('Time') ; ylabel('Freq') ; 
% title('MT=10');
% set(gca, 'FontSize', 18);
% b=get(gca);
% set(b.XLabel, 'FontSize', 18);set(b.YLabel, 'FontSize', 18);set(b.ZLabel, 'FontSize', 18);set(b.Title, 'FontSize', 18);
% str = 'results/nsCWT';
% print(gcf, '-depsc2', str);      command = sprintf('epstopdf %s.eps',str);      system(command);


tfrsqtic=tfrsqtic(:);
PostTrait_Freq;