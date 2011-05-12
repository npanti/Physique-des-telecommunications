function E = electric_field(Pr,Tr, R)
%ELECTRIC_FIELD Retourne le champ electrique d'une composante multi-trajet
%   Detailed explanation goes here

    global beta G_TX P_TX TX RX;

    E = zeros(size(Pr,3),1);
    
    if Pr == 0
        d = distance_ray(0,TX,RX);
        E = Tr*sqrt(60*G_TX*P_TX)*exp(-1i*beta*d)/d;
    else
        for i=1:+1:size(Pr,3)
        
            d = distance_ray(Pr(:,:,i),TX,RX);

            E(i) = R(i)*Tr(i)*sqrt(60*G_TX*P_TX)*exp(-1i*beta*d)/d;
        
        end
    end

end

