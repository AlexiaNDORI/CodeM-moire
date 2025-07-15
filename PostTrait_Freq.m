max(max(abs(ConceFT)));
ScalMax = max(max(abs(ConceFT))); 
ConceFT = ConceFT ;
% Détection des pics dans TOUTES les colonnes pour capturer l’évolution temporelle
[MaxAmp, I] = max(abs(ConceFT), [], 2); % Trouve l’amplitude max par fréquence
ScalMax = max(MaxAmp);
MaxAmp = MaxAmp / ScalMax; % Normalisation pour éviter la suppression de composants faibles
% Recherche des pics temporels significatifs (dans le domaine fréquentiel)
[pk, loc] = findpeaks(MaxAmp, 'MinPeakHeight', 0.01); 
% Récupérer les indices temporels pour chaque fréquence détectée
indtime = I(loc); % `I(loc)` donne les indices temporels où le max est atteint
% Vérification des indices pour éviter les erreurs d’indexation
validIdx = (loc <= size(ConceFT, 1)) & (indtime <= size(ConceFT, 2));
loc = loc(validIdx);
indtime = indtime(validIdx);
% Conversion en indices linéaires pour accéder aux bons coefficients
idxLinear = sub2ind(size(ConceFT), loc, indtime); 
% Extraction des phases associées
Phase = unwrap(rad2deg(angle(ConceFT(idxLinear))))+90;
% Stockage des résultats (fréquence, amplitude, phase) en suivant l’évolution temporelle
frequencies= tfrsqtic(loc)
Resultat = [frequencies pk Phase];
% Affichage des résultats
disp('Fréquence - Amplitude - Phase');
disp(Resultat);




% %xm=0.2*sin(5*pi*2*time)+0.1*cos(10*pi*2*time)+cos(30*pi
% mid= length(time)/2;
% ScalMax=max(max(abs(ConceFT(:,mid))));ConceFT=ConceFT/ScalMax;
% [pks,locs]=findpeaks(abs(ConceFT(:,mid)),'MinPeakHeight',.01/4); %Je prends l'index un parque le signal est en régime permanent
% 
% %Résultats:
% Resultats=[tfrsqtic(locs) pks abs(ConceFT(locs,mid)) rad2deg(angle(ConceFT(locs,mid)))]
% Delta=9;ij=[];fij=[];aij=[];sij=[];
% 
% 
% for il=1:length(locs)
%     ij=[locs(il)-Delta:locs(il) locs(il)+1:locs(il)+Delta]; %Bandes spectrales
%     if(ij(1)<=0) break;end
%     %ij=ij(ij>0)
%     aij=[aij abs(ConceFT(ij,mid))];fij=[fij tfrsqtic(ij)];
%    if(il==1) figure;end
%    plot(fij(:,il),aij(:,il));
%    if(il==1) hold;end
%     [amax,imax]=max(aij(:,il));sij{il}=['Freq=',num2str(fij(imax,il)),'Hz;A=',num2str(amax),'pu'];
% end;grid; hold;legend(sij);
% 
% figure;
% subplot(211); plot(tfrsqtic,abs(ConceFT(:,mid))); grid;axis tight; xlabel('Hz'); %snapshot 
% title(['t=',num2str(time(mid)),'sec']);ylabel('pu')
% subplot(212); plot(tfrsqtic,angle(ConceFT(:,mid))*180/pi); grid;axis tight; xlabel('Hz'); %snapshot 
% title(['t=',num2str(time(mid)),'sec']);ylabel('Deg');
