function gamma = propagation_const(eps_r,sigma)
%PROPAGATION_CONST Summary of this function goes here
%   Detailed explanation goes here
    
    f = 2.45e9;
    omega = 2*pi*f;
    mhu0 = pi*4e-7;

    gamma = 1i*omega*sqrt(mhu0*epsilon_tilt(eps_r,sigma));

end

