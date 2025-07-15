%xm=0.2*sin(5*pi*2*time)+0.1*cos(10*pi*2*time)+cos(30*pi
mid=length(time)/2;
ScalMax=max(max(abs(ConceFT(:,mid))));ConceFT=ConceFT/ScalMax;
[pks,locs]=findpeaks(abs(ConceFT(:,mid)),'MinPeakHeight',.01); %Je prends l'index un parque le signal est en régime permanent

%Résultats:
[tfrsqtic(locs) pks abs(ConceFT(locs,mid)) angle(ConceFT(locs,mid))*180/pi]
Delta=9;ij=[];fij=[];aij=[];sij=[];

figure;
for il=1:length(locs)
    ij=[locs(il)-Delta:locs(il) locs(il)+1:locs(il)+Delta]; %Bandes spectrales
    %ij=ij(ij>0)
    aij=[aij abs(ConceFT(ij,mid))];fij=[fij tfrsqtic(ij)];
    plot(fij(:,il),aij(:,il));if(il==1) hold;end
    [amax,imax]=max(aij(:,il));sij{il}=['Freq=',num2str(fij(imax,il)),'Hz;A=',num2str(amax),'pu'];
end;grid; hold;legend(sij);

figure;
subplot(211); plot(tfrsqtic,abs(ConceFT(:,mid))); grid;axis tight; xlabel('Hz'); %snapshot 
title(['t=',num2str(time(mid)),'sec']);ylabel('pu')
subplot(212); plot(tfrsqtic,angle(ConceFT(:,mid))*180/pi); grid;axis tight; xlabel('Hz'); %snapshot 
title(['t=',num2str(time(mid)),'sec']);ylabel('Deg');