%Several quick examples illustrating how the toolbox functions are used
%Uncomment each set of lines to use them
close all
%x is the signal
%xNew is the inverted (reconstructed) signal

if(0)
    t=linspace(0,10,2000);
    x=cos(2*pi*(0.1*t.^2.6+3*sin(2*t)+10*t)) + exp(-0.2*t).*cos(2*pi*(40+t.^1.3).*t);
  
else
    N = 2^10; %N=length(x) ; T=1/N (1ms)
    Hz = N ;  %Frequenc Max=1024  (1kHz)
    L = 1 ;   %Temps Max (1s)
    time = [1/Hz:1/Hz:L]' ;t=time; dt=t(2)-t(1);Time=time;

    time = [1/Hz:1/Hz:L]' ;t=time;dt=t(2)-t(1);Time=time;
    if(0)
    x=0.2*sin(5*pi*2*time)+0.1*cos(10*pi*2*time)+cos(30*pi*2*time)+sin(60*pi*2*time)+0.5*sin(90*pi*2*time)+0.05*cos(120*pi*2*time);
    highfreq = 180 ;
    else
    x= 0.5+sin(2*pi*60*Time+pi/3)+.1*sin(2*pi*30*Time+pi/2)+.05*sin(2*pi*120*Time+pi/4)+.01*sin(2*pi*180*Time+pi)+0.01*sin(2*pi*240*Time-0.52)+.05*sin(2*pi*90*Time+0.22);
    highfreq = 280 ;
    end
    
    highglobal = highfreq;
end
  fmax=highfreq;xm=x;
  x=x(:);
  dt=t(2)-t(1);
%various options and parameters
CWTopt=struct('gamma',eps,'type','morlet','mu',6,'s',2,'om',0,'nv',64,'freqscale','linear');
STFTopt=struct('gamma',eps,'type','gauss','mu',0,'s',0.05,'om',0,'winlen',256,'squeezing','full');

% Continuous wavelet transform (CWT)

[Wx,as,dWx]=cwt_fw(x, CWTopt.type, CWTopt.nv, dt, CWTopt);
xNew = cwt_iw(Wx, CWTopt.type, CWTopt, length(x), mean(x)).';
figure;fs=as*Hz;im=find(fs<fmax);
imageSQ(t, fs(im), abs(Wx(:,im))) ; axis square; colorbar;
xlabel('Time') ; ylabel('Freq') ;
title(['CWT']);
figure;
tplot(Wx(:,im), t, fs(im)); colorbar; title('CWT','FontSize',14); xlabel('Time (seconds)','FontSize',14); ylabel('Frequency (hz)', 'FontSize',14);
figure(); plot(t,[x,xNew]);


% Short-time Fourier transform (STFT)

[Sx,fs,dSx] = stft_fw(x, dt, STFTopt);
xNew = stft_iw(Sx, fs, STFTopt).';
figure;im=find(fs<fmax);
imageSQ(t, fs(im), abs(Sx(:,im))) ; axis square; 
xlabel('Time') ; ylabel('Freq') ;
title(['STFT']);
figure;
tplot(Sx(:,im), t, fs(im)); colorbar; title('STFT','FontSize',14); xlabel('Time (seconds)','FontSize',14); ylabel('Frequency (hz)', 'FontSize',14);
figure(); plot(t,[x,xNew]);


% CWT Synchrosqueezing transform

[Tx, fs, Wx, as, Cw] = synsq_cwt_fw(t, x-mean(x), CWTopt.nv, CWTopt);
xNew = synsq_cwt_iw(Tx, fs, CWTopt).';
figure;im=find(fs<fmax);
imageSQ(t, fs(im), abs(Wx(:,im))) ; axis square; colorbar;
xlabel('Time') ; ylabel('Freq') ;
title(['CWT-Sq']);
figure;
tplot(Tx(:,im), t, fs(im)); colorbar; title('CWT Synchrosqueezing','FontSize',14); xlabel('Time (seconds)','FontSize',14); ylabel('Frequency (hz)', 'FontSize',14);
figure(); plot(t,[x,xNew(:,1)]);


% STFT Synchrosqueezing transform

[Tx, fs, Sx, Sfs, Sw, dSx] = synsq_stft_fw(t, x, STFTopt);	
xNew = synsq_stft_iw(Tx, fs, STFTopt).';
figure;im=find(fs<fmax);
imageSQ(t, fs(im), abs(Tx(:,im))) ; axis square; colorbar;
xlabel('Time') ; ylabel('Freq') ;
title(['STFT-Sq']);
figure(); tplot(Tx(:,im), t, fs(im)); colorbar; title('STFT Synchrosqueezing','FontSize',14); xlabel('Time (seconds)','FontSize',14); ylabel('Frequency (hz)', 'FontSize',14);
figure(); plot(t,[x,xNew(:,1)])


