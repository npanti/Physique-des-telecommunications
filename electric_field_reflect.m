function E_tot = electric_field_reflect(E, Pr)
%ELECTRIC_FIELD_REFLECT Summary of this function goes here
%   Detailed explanation goes here

    global beta d_reflect reflecteur TX RX;
    
    E_tot = ones(size(E,1),2);
    
    if size(Pr,2) == 1
        E_tot(1) = 2*1i*E*sin(beta*d_reflect*cos(angleBetweenTwoLines(reflecteur,[TX(1) TX(2) RX(1) RX(2)])));
        E_tot(2) = angleBetweenTwoLines(reflecteur,[TX(1) TX(2) RX(1) RX(2)]);
    else
       
        for i=1:+1:size(E,1)
            E_tot(i,1) = 2*1i*E(i)*sin(beta*d_reflect*cos(Pr(1,5,i)));
            E_tot(i,2) = Pr(1,5,i);
        end
        
    end


end

