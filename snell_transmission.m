function theta_t = snell_transmission(eps_r,theta_i)
%SNELL_TRANSMISSION Fonction que retourne l'angle de transmission
%   Detailed explanation goes here
    eps0 = 8.854187e-12;
    eps1 = eps_r*eps0;

    theta_t = asin(sqrt(eps0/eps1)*sin(theta_i));

end

