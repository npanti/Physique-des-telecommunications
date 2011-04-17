function out = isBetweenTwoPoints(x, y, X1, Y1, X2, Y2)
%ISBETWEENTWOPOINTS Summary of this function goes here
%   Detailed explanation goes here
    
    out = 0;
    if ((X1 <= x && x <= X2) || (X2 <= x && x <= X1)) && ((Y1 <= y && y <= Y2) || (Y2 <= y && y <= Y1)) 
        out = 1;
    end
    

end

