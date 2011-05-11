function Mb = bitrate(db_power)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    Mb = ones(size(db_power,1),size(db_power,2));
    
    for i=1:+1:size(db_power,1)
        for j=1:+1:size(db_power,2)
          
            if db_power(i,j) >= -60
                
                Mb(i,j) = 100;
                
            elseif db_power(i,j) < -90
                Mb(i,j) = 0;
            else
                %Equation qui donne le debit binaire lorsque les db sont situé entre
                %-60 et -90 db
                Mb(i,j) = 10^((db_power(i,j)+90)/30+1);
                
            end
            
        end
    end

end

