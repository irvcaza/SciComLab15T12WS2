%% Function EulerImplicit
% Calculates an aproximation of the solution for a ODE with initial value
%% Imput:
% -f (function): main function f 
% -fp (function): f prime, derivative of f
% -y0 (number): initial value of f at time 0
% -dt (number): stepsize
% -tend (number): final time of the calculation
%% Output:
% -y (vector): values of the aproximation solution on the pints i*dt
%% Notes
% - This function depends of the function Newton, witch calculates the
% zeros of a given function, it can be replaced by any function

function y = EulerImplicit(f,fp,y0,dt,tend)

    x= 0:dt:tend;   %Grid for aproximations
    y  = zeros(1,length(x));
    y(1) = y0;
    n=length(x);
    Gp = @(yn1) (dt * fp(yn1) - 1); %derivate of the function G, has to be defined just once, necesary for the Newton function
    
    for i = 2:n
        G = @(yn1) (dt * f(yn1) + y(i-1) - yn1 );   %derivate of the function G, has to be defined on each timestep
        y(i) = Newton(G,Gp,y(i-1)); % Call to the function newton who returns a zero of the function
    end
end
