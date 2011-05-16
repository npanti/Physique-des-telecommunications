function E = electric_field(Pr,Tr, R, TX, RX,varargin)
%ELECTRIC_FIELD Retourne le champ electrique d'une composante multi-trajet
%   Detailed explanation goes here
    global beta G_TX P_TX;
    
    if ~isempty(varargin)
        D = varargin{1};
    end
    
    
    E = zeros(size(Pr,3),1);
    %gamma = propagation_const(wall(1,6),wall(1,7));

    for i=1:+1:size(Pr,3)
        
        d = distance_ray(Pr(:,:,i),TX,RX);
        
        if isempty(varargin)
        
            E(i) = R(i)*Tr(i)*sqrt(60*G_TX*P_TX)*exp(-1i*beta*d)/d;
        else
            E(i) = D(i)*Tr(i)*sqrt(60*G_TX*P_TX)*exp(-1i*beta*d)/d;
        end
        
    end
    
    if Pr == 0
        d = distance_ray(0,TX,RX);
        E = Tr*sqrt(60*G_TX*P_TX)*exp(-1i*beta*d)/d;
    else
        
    end

end

