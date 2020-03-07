function p1
    syms f(x,y) x y;
    
   % f(x,y)=2*x*y^2 + 2*x-x^2-2*y^2
    
   f(x,y)=x^3/3 + y^2/2 -2*x*y + 4*x
   
    fx = diff(f,x)
    fy = diff(f,y)
    
    fxx = diff(fx,x)
    fyy = diff(fy,y)
    fxy = diff(fx,y)
    
    H = fxx*fyy - fxy^2

    sols = solve([fx==0,fy==0], {x,y})
    disp("xc:");
    sols.x
    disp("yc:");
    sols.y
    
    
    disp("H(xc,yc):");
    H(sols.x,sols.y)
    
    disp("fxx(xc,yc):");
    fxx(sols.x,sols.y)
    
end