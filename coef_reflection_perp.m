function R = coef_reflection_perp(eps_r,sigma,theta_i,theta_t)
%COEF_REFLECTION_PERP Renvoie le coefficient de reflexion pour une onde de
%polarisation perpendiculaire au mur
%   Detailed explanation goes here
    
    global Z0;

    Z1 = impendance(eps_r,sigma);
    
    R = (Z1*cos(theta_i) - Z0*cos(theta_t))/(Z1*cos(theta_i) + Z0*cos(theta_t));
    
end

