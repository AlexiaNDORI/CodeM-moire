close all
load arn
Iabc=[IaALinecurrent IbBLinecurrent IcCLinecurrent]/(1e3)/4;
Vabc=[VaANodevoltage VbBNodevoltage VcCNodevoltage]/(1e3);

load bcv
Iabc1=[IaALinecurrent IbBLinecurrent IcCLinecurrent]/1e3;
Vabc1=[VaANodevoltage VbBNodevoltage VcCNodevoltage]/1e3;
figure;
subplot(211);
plot(t,Vabc);grid;title(['Substation #1 - Bus Voltage']);xlabel(['time(sec)']);ylabel(['kV']); axis tight
subplot(212);
plot(t,Vabc);grid;title(['Substation #1 - Bus Voltage']);xlabel(['time(sec)']);ylabel(['kV']); axis tight
subplot(221); plot(t,Iabc);grid;title(['Substation #1 - Line Currents']);xlabel(['time(sec)']); ylabel(['kA']);axis tight
subplot(223); plot(t,Vabc);grid;title(['Substation #1 - Bus Voltage']);xlabel(['time(sec)']);ylabel(['kV']); axis tight
subplot(222); plot(t,Iabc1);grid;title(['Substation #2 - Line Currents']);xlabel(['time(sec)']); ylabel(['kA']);axis tight
subplot(224); plot(t,Vabc1);grid;title(['Substation #2 - Bus Voltage']);xlabel(['time(sec)']);ylabel(['kV']); axis tight

figure;n1=t<2 & t>.25;t1=t(n1);
subplot(221); plot(t(n1),Iabc(n1,:));grid;title(['Substation #1 - Line Currents']);xlabel(['time(sec)']); ylabel(['kA']);
axis([t1(1) max(t1) max(max(Iabc(n1,:)))/1.5 max(max(Iabc(n1,:)))]); %axis tight
subplot(223); plot(t(n1),Vabc(n1,:));grid;title(['Substation #1 - Bus Voltage']);xlabel(['time(sec)']);ylabel(['kV']);% axis tight
axis([t1(1) max(t1) max(max(Vabc(n1,:)))/1.3 max(max(Vabc(n1,:)))]); legend('a','b','c');%axis tight
subplot(222); plot(t(n1),Iabc1(n1,:));grid;title(['Substation #2 - Line Currents']);xlabel(['time(sec)']); ylabel(['kA']);%axis tight
axis([t1(1) max(t1) max(max(Iabc1(n1,:)))/1.5 max(max(Iabc1(n1,:)))]); %axis tight
subplot(224); plot(t(n1),Vabc1(n1,:));grid;title(['Substation #2 - Bus Voltage']);xlabel(['time(sec)']);ylabel(['kV']);% axis tight
axis([t1(1) max(t1) max(max(Vabc1(n1,:)))/1.3 max(max(Vabc1(n1,:)))]); %axis tight


% T=1/(48*60);sim('reech2PMU');
% MVA=2081;
% KV=735/sqrt(3);
% T_START=0.5;
% Xq=0;
% fc=60;
% Phasor=0;
% [n,m]=size(vabc1);
% t=[0:n-1]*T;t=t(:);
% Vabc=vabc;Iabc=iabc;


time=t'; dt=t(2)-t(1);Hz=1/dt;


%x is the signal
%xNew is the inverted (reconstructed) signa
    N = 1024*39; %N=length(x) ; T=1/N (1ms)
    L=(N-1)*dt;time=time(1:N);Time=time; 
    highfreq = 70 ;    highglobal = highfreq;lowfreq =50 ;
%   compCWT;%Wavelet

%    % This code draws the synchrosqueezed wavelet transform in Figure 1 of
% % H. Yang, Robustness Analysis of Synchrosqueezed Transforms, preprint,
% % 2014.
% 
% display('CWT-I')
% xm=Iabc(1:N,1);x=xm;
% compCWT;%Wavelet
% compConceFT_CWT; %Squeeze-Wavelet
% 
display('CWT-V')
xm=Vabc(1:N,1);x=xm;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compCWT;%SST-CWT
% [FondVal,I]= max(tfrsq,[],1);  %extraction des differentes valeurs de la fondamentale avec SST-CWT
% t=time; f=tfrsqtic (I);
% plot (t,f);
% title(['Variation temps-fréquence du signal de 2001 - SST-CWT'])
% xlabel(['temps (sec)']); ylabel(['fréquences (Hz)']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compConceFT_CWT; %ConceFT-CWT
% [FondVal2,I2]= max(tfrsq,[],1); %extraction des differentes valeurs de la fondamentale avec ConceFT-CWT
% t2=time; f2=tfrsqtic (I2);
% plot(t2,f2);
% title(['Variation temps-fréquence du signal de 2001 - ConceFT-CWT'])
% xlabel(['temps (sec)']); ylabel(['fréquences (Hz)']);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compSTFT;%STFT
%[FondVal3,I3]= max(tfrsq,[],1); %extraction des differentes valeurs de la fondamentale avec SST-STFT
t1=time; %f3=tfrsqtic (I3)
load Conceft-STFT-0_025.mat 
%load Fréquence-SST-STFT-0_001.mat
figure
plot(t1,f1)
title(['Variation temps-fréquence du signal de 2001 - SST-STFT'])
xlabel(['temps (sec)']); ylabel(['fréquences (Hz)']);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compConceFT_STFT;%Squeze-STFT
% [FondVal4,I4]= max(tfrsq,[],1); %extraction des differentes valeurs de la fondamentale avec ConceFT-STFT
% plot(time,tfrsqtic (I4))
% title(['Variation temps-fréquence du signal de 2001 - ConceFT-STFT'])
% xlabel(['temps (sec)']); ylabel(['fréquences (Hz)']);











% % 
% %display('CWT-I1')
% % xm=Iabc1(1:N,1);x=xm;
% % compCWT;%Wavelet
% % compConceFT_CWT; %Squeeze-Wavelet
% % 
% % display('CWT-V1')
% %xm=Vabc1(1:N,1);x=xm;
% % compCWT;%Wavelet
% % compConceFT_CWT; %Squeeze-Wavelet
% % 
% % display('STFT-I')
% %xm=Iabc(1:N,1);x=xm;
%     %compSTFT;%STFT
% %compConceFT_STFT%Squeze-STFT
% % 
% % display('STFT-V')
% % xm=Vabc(1:N,1);x=xm;
% % compSTFT;%STFT
% % compConceFT_STFT;%Squeze-STFT
% % 
% % diary off
% 
