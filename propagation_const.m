function gamma = propagation_const(eps_r,sigma)
%PROPAGATION_CONST Summary of this function goes here
%   Detailed explanation goes here
    
    global omega mhu0;

    gamma = 1i*omega*sqrt(mhu0*epsilon_tilt(eps_r,sigma));

end

