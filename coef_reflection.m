function R = coef_reflection(wall,Pr)
%COEF_REFLECTION Fonction qui retourne une matrice avec les coefficients de
%                reflexion total
%   Detailed explanation goes here
    
    R = ones(size(Pr,3),1);
    
    for i=1: +1: size(Pr,3)
        
        for j=1: +1: size(Pr,1)
            
            if Pr(j,:,i) ~= 0
            
            wall_width = wall(Pr(j,3,i),5);
            eps_r = wall(Pr(j,3,i),6);
            sigma = wall(Pr(j,3,i),7);
            theta_i = Pr(j,4,i);
            theta_t = snell_transmission(eps_r,sigma);
            s = wall_width/cos(theta_t);
            gamma = propagation_const(eps_r,sigma);
            
            R_perp = coef_reflection_perp(eps_r,sigma,theta_i,theta_t);
            
            R(i) = R(i) * (R_perp+(1-R_perp^2)*(R_perp*exp(-2*gamma*s+gamma*2*s*sin(theta_t)*sin(theta_i)) / (1-R_perp^2*exp(-2*gamma*s+gamma*2*sin(theta_t)*sin(theta_i)))));
            end
        
        end
        
    end

end

