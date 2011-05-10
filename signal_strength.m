function P_RX = signal_strength(E_tot)
%SIGNAL_STRENGTH Summary of this function goes here
%   Detailed explanation goes here
    
    global h_e Ra;
    
    P_RX_tmp = 0;
    
    for i=1:+1:size(E_tot,1)
        P_RX_tmp = P_RX_tmp + abs(h_e*E_tot(i))^2;
    end
    
    P_RX_watt = P_RX_tmp*1/(8*Ra);
    
    %Sortie du la puissance en dbm
    P_RX = 10*log10(P_RX_watt/0.001);

end

