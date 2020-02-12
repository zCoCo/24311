% Prints input and output results for the volume of liquid in the 
% cylindrical tank given in Problem 3.1 from the parameters R and d using
% #tankVol
function printTankResults(R,d)
    fprintf("\tFor R = %0.3g and d = %0.3g, V = %0.4g\n", R,d, tankVol(R,d));
end