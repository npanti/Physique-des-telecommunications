function T = coef_transmission(wall_width,eps_r,sigma,theta_i)
%COEF_TRANSMISSION Retourne le coefficient de transmission

    global beta;

    theta_t = snell_transmission(eps_r,theta_i);
    R2_perp = coef_reflection_perp(eps_r,sigma,theta_i,theta_t)^2;
    s = wall_width/cos(theta_t);
    gamma = propagation_const(eps_r,sigma);
    
    T = (1-R2_perp)*exp(-gamma*s) / (1 - R2_perp*exp(-2*gamma*s+1i*beta*2*s*sin(theta_t)*sin(theta_i)));

end

