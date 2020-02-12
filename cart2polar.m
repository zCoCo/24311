% Converts cartesian coords to polar as specified in problem 3.6. Must use
% if...else instead of atan2.
function [r,t] = cart2polar(x,y)
    r = sqrt(x^2 + y^2);
    if x > 0
        
        t = atan(y/x);
        
    elseif x < 0
        
        if y >= 0
            t = atan(y/x) + pi;
        else % y < 0
            t = atan(y/x) - pi;
        end
        
    else % x == 0
        
        if y > 0
            t = pi/2;
        elseif y < 0
            t = -pi/2;
        else % y == 0
            t = 0;
        end
        
    end
end