% Computes the volume of liquid in the cylindrical tank given in Problem
% 3.1 from the parameters R and d.
function V = tankVol(R,d)
    if d < R
        V = pi * d^3 / 3;
    elseif d <= 3 * R
        V = pi * R^3 / 3 + 2*pi*R * (d-R);
    else
        V = nan;
        warning("Overtop");
    end
end