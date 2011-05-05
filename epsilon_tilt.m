function eps_t = epsilon_tilt(eps_r,sigma)
%EPSILON_TILT Summary of this function goes here
%   Detailed explanation goes here
    
    f=2.45e9;
    omega = 2*pi*f;
    eps0 = 8.854187e-12;
    
    eps_t = eps_r*eps0 - 1i*sigma/omega;

end

