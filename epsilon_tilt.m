function eps_t = epsilon_tilt(eps_r,sigma)
%EPSILON_TILT Summary of this function goes here
%   Detailed explanation goes here

    global omega eps0;
    
    eps_t = eps_r*eps0 - 1i*sigma/omega;

end

