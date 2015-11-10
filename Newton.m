function r = Newton (G,Gp,x0)
    r = x0;
    counter = 1;
    
    while true
        r = r - G (r) / Gp(r);
        counter = counter + 1;
        if abs(G(r)) < 10^-4
            break;
        end
        if counter > 1000 
            error('MATLAB:Newton:TooIterations','Solution of the problem not found: Too many iterations (%d): \n Best aproximation G(%d) = %d',counter,r,G(r));
        end
        if  Gp(r) == 0
            error('MATLAB:Newton:NonRealZero','Solution of the problem not found: Critical point (%d) that is not a root',r);
        end
    end
end
            
        