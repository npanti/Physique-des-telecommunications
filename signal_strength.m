function P_RX = signal_strength(E_tot,Ra, h_e,P_TX)
%SIGNAL_STRENGTH Summary of this function goes here
%   Detailed explanation goes here
    P_RX = 0;
    
    for i=1:+1:size(E_tot,1)
        P_RX = P_RX + abs(h_e*E_tot(i))^2;
    end
    
    P_RX = P_RX*1/(8*Ra);
    
    %Sortie du la puissance en dbm
    P_RX = 10*log(P_RX/P_TX);

end

