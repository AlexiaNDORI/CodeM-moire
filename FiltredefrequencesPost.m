
% Définir le seuil pour la segmentation
delta = 10;  % Seuil pour la segmentation basée sur la première colonne

% Initialisation des variables
freqband = {};  % Cell array pour stocker les segments
Results = [];  % Matrice finale pour stocker les valeurs moyennes et maximales

current_freqband = Resultat(1,:);  % Premier segment avec la première ligne
principal_frqband= Resultat(1,1);
% Parcourir la matrice pour créer les segments

for i = 2:size(Resultat,1)
    % Comparer avec la ligne précédente et non avec la première du segment
    if abs(Resultat(i,1) - principal_frqband) > delta
        % Ajouter le segment courant
        freqband{end+1} = current_freqband;
        
        % Trouver l'indice du max de la colonne 2
        [~, max_idx] = max(current_freqband(:,2));
        
        % Ajouter les résultats à la matrice finale
        Results = [Results; current_freqband(max_idx,:)];
        
        % Commencer un nouveau segment
        current_freqband = Resultat(i,:);
        principal_frqband = Resultat(i,1)
    else
        % Ajouter la ligne au segment actuel
        current_freqband = [current_freqband; Resultat(i,:)];
    end
end

% % Ajouter le dernier segment
freqband{end+1} = current_freqband;
[~, max_idx] = max(current_freqband(:,2));
Results = [Results; current_freqband(max_idx,:)];

taille_total_seg=0;
% Affichage des segments
disp('Segments détectés :');
for k = 1:length(freqband)
%     if k==2
    disp(['Segment ', num2str(k), ':']);
    disp(array2table(freqband{k}, 'VariableNames', {'Col1', 'Col2', 'Col3'}));
%     end
    taille_total_seg=taille_total_seg+ length(freqband{k})
end

% Affichage des résultats finaux
disp('Résultats finaux :');
disp(array2table(Results, 'VariableNames', {'FreqDom', 'Amp', 'Phase'}));
disp(taille_total_seg)
