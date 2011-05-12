function h = equivalent_height(varargin)
%EQUIVALENT_HEIGHT Summary of this function goes here
%   Detailed explanation goes here

    global beta d_reflect lambda;

    if ~isempty(varargin)
        
        theta_reflect = varargin{1};

        if theta_reflect >= -pi/2 && theta_reflect <= pi/2

            h = -2*1i*lambda/pi*sin(beta*d_reflect*cos(theta_reflect));

        elseif theta_reflect >= pi/2 && theta_reflect <= 3*pi/2
            
            h=0;    
        end
    
    else
        
        h = -lambda/pi;
        
    end
   
end

