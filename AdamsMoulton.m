function y = AdamsMoulton (f,fp,y0,dt,tend)

    x= 0:dt:tend;
    y  = zeros(1,length(x));
    y(1) = y0;
    n=length(x);
    
    
    for i = 2:n
        Gp = @(yn1) ( dt*fp(yn1)/2 - 1);
        G = @(yn1) ( y(i-1) + dt * (f(y(i-1)) + f(yn1)) / 2 - yn1);
        try
            y(i) = Newton(G,Gp,y(i-1));
        catch err
            err_type= strfind(err.identifier,'MATLAB:Newton:');
            if (~isempty(err_type))
                error('MATLAB:AdamsMoulton:NewtonNoRoot','Solution of the problem not found by Newton: On step %i',i);
            else
                rethrow(err);
            end
        end
    end
end