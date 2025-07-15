Hz = 1024;
L = 1;
load ('SignalStationnaireExper.mat'); 
%time = [1/Hz:1/Hz:L]';
time=time60(1:2500);
y= Ibess60(1:2500,1);
%x= 0.5+sin(2*pi*60*time+pi/3)+.1*sin(2*pi*30*time+pi/2)+.05*sin(2*pi*120*time+pi/4)+.01*sin(2*pi*180*time+pi)+0.01*sin(2*pi*240*time-0.52)+.05*sin(2*pi*90*time+0.22);
plot(time, y)
xlabel ("temps (s)")
ylabel ("amplitude")
title("Signal expérimental non-stationnaire" )