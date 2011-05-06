function d = distance_ray(Pr,TX,RX)
%DISTANCE Summary of this function goes here
%   Detailed explanation goes here
    
    d = 0;
    
    first = 1;
    if Pr == 0
        d = sqrt((TX(1)-RX(1))^2+(TX(2)-RX(2))^2);
    else
        
        for i=size(Pr,1):-1:0

            if i==0 || ~isequal(Pr(i,:),[0 0 0 0])

                if first == 1 
                    P = [TX(1) TX(2) Pr(i,1:2)]; 
                elseif i==0
                    P = [Pr(i+1,1:2) RX(1) RX(2)];
                else
                    P = [Pr(i,1:2) Pr(i+1,1:2)];
                end

                d = d + sqrt((P(1)-P(3))^2+(P(2)-P(4))^2);

                first = 0;
            end

        end
    
    end

end

