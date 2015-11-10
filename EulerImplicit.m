function y = EulerImplicit(f,fp,y0,dt,tend)

    x= 0:dt:tend;
    y  = zeros(1,length(x));
    y(1) = y0;
    n=length(x);
    Gp = @(yn1) (dt * fp(yn1) - 1);
    
    for i = 2:n
        G = @(yn1) (dt * f(yn1) + y(i-1) - yn1 );
        y(i) = Newton(G,Gp,y(i-1));
    end
end
