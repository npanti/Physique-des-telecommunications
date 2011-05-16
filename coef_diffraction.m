function D = coef_diffraction( diffract )
%COEF_DIFFRACTION Summary of this function goes here
%   Detailed explanation goes here

    global TX RX beta;

    D = ones(size(diffract,3),1);
    
    for i=1:+1:size(diffract,3)
        
        s1 = sqrt((diffract(1,1,i)-TX(1))^2+(diffract(1,2,i)-TX(2))^2);
        s2 = sqrt((RX(1)-diffract(1,1,i))^2+(RX(2)-diffract(1,2,i))^2);
        
        L = s1*s2/(s1+s2);
        delta = diffract(1,3,i);
        
        if delta ~= 0
            D(i) = -exp(-1i*pi/4)*Ft(2*beta*L*sin(delta/2)^2)/(2*sqrt(2*pi*beta*L)*sin(delta/2));
        else
            D(i) = 1;
        end
            
        
    end

end

