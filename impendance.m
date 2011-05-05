function Z = impendance(eps_r,sigma)
%IMPENDANCE Retourne l'impédance d'un milieu
%   Detailed explanation goes here
    mhu0 = pi*4e-7;
    Z0 = 120*pi;
    
    if eps_r == 0 && sigma == 0
        Z = Z0;
    else
        
        Z = sqrt(mhu0/epsilon_tilt(eps_r,sigma));
    end

end