[Fa, Fi] = max(abs(tfrsq), [], 1); 
f_fundamental = tfrsqtic(Fi);         
figure;
imagesc(time, f_fundamental, abs(tfrsq))
%plot(time, f_fundamental, 'LineWidth', 0.5);
xlabel('Temps');
ylabel('Fréquence fondamentale (Hz)');
title('Variation de la fréquence fondamentale dans le temps avec SST-CWT');
grid on;

% % Supposons que les variables suivantes sont déjà définies :
% % - tfrsq    : matrice de coefficients (résultats SST-CWT) [nb_freq x nb_time]
% % - tfrsqtic : vecteur des fréquences correspondant aux lignes de tfrsq
% % - time     : vecteur temps (pour chaque colonne de tfrsq)
% 
% Nf = length(tfrsqtic);    % Nombre de bins de fréquence
% Nt = length(time);        % Nombre d'instants
% 
% % Préallocation du vecteur de fréquence fondamentale
% f_fundamental = zeros(1, Nt);
% 
% % Calcul de la magnitude de la CWT
% abs_tfrsq = abs(tfrsq);
% 
% % Pour chaque instant, extraire l'indice du maximum et appliquer l'interpolation parabolique
% for it = 1:Nt
%     [~, k] = max(abs_tfrsq(:, it));
%     
%     % Si le pic est à la frontière, pas d'interpolation
%     if k <= 1 || k >= Nf
%         f_fundamental(it) = tfrsqtic(k);
%     else
%         % Récupérer les amplitudes du pic et de ses voisins
%         alfa = abs_tfrsq(k-1, it);
%         beta  = abs_tfrsq(k, it);
%         gamma = abs_tfrsq(k+1, it);
%         
%         % Calcul de l'offset par interpolation parabolique
%         offset = 0.5 * (alfa - gamma) / (alfa - 2*beta + gamma);
%         
%         % Calcul du pas en fréquence
%         df = tfrsqtic(2) - tfrsqtic(1);
%         
%         % Estimation raffiné de la fréquence fondamentale
%         f_fundamental(it) = tfrsqtic(k) + offset * df;
%     end
% end
% 
% % Tracé de la fréquence fondamentale en fonction du temps
% figure;
% plot(time, f_fundamental, 'LineWidth', 0.5);
% xlabel('Temps');
% ylabel('Fréquence fondamentale (Hz)');
% title('Variation de la fréquence fondamentale dans le temps avec SST-CWT');
% grid on;
