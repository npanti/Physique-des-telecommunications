function db = totalStrength(db_power1, db_power2, db_power3)
%TOTALSTRENGTH Summary of this function goes here
%   Detailed explanation goes here
    db = ones(size(db_power1,1),size(db_power1,2));
    for i=1:+1:size(db_power1,1)
        for j=1:+1:size(db_power1,2)
            db(i,j) = max(max(db_power1(i,j),db_power2(i,j)),db_power3(i,j));
        end
    end

end

