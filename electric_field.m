function E = electric_field(wall,Pr,Tr, R,G_TX, P_TX, TX, RX)
%ELECTRIC_FIELD Retourne le champ electrique d'une composante multi-trajet
%   Detailed explanation goes here

    E = zeros(size(Pr,3),1);
    %gamma = propagation_const(wall(1,6),wall(1,7));
    gamma = propagation_const(1,0);

    for i=1:+1:size(Pr,3)
        
        d = distance_ray(Pr(:,:,i),TX,RX);
        
        E(i) = R(i)*Tr(i)*sqrt(60*G_TX*P_TX)*exp(-gamma*d)/d;
        
    end

end

