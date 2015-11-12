%% Function AdamsMoultonL1
% Calculates an aproximation of the solution for a ODE with initial value
% by a linearization the Adams-Moulton method
%% Imput:
% -f (function): main function f 
% -fp (function): f prime, derivative of f (not used, just to for it
%   perrtenence to the AdamsMoulton function
% -y0 (number): initial value of f at time 0
% -dt (number): stepsize
% -tend (number): final time of the calculation
%% Output:
% -y (vector): values of the aproximation solution on the pints i*dt
%% Notes
% - This function depends of the function Newton, witch calculates the
% zeros of a given function, it can be replaced by other procedure
% - This function is hard coded for a special function and it shoudnt be
% used for genera pruposes, for that it shoud be used AdamsMoulton

function y = AdamsMoultonL1 (f,fp,y0,dt,tend)

    x= 0:dt:tend;%Grid for aproximations
    y  = zeros(1,length(x));
    y(1) = y0;  %establish the initial value
    n=length(x);
    
    for i = 2:n
        Gp = @(yn1) ( dt*7*(-1/10)*y(i-1)/2 - 1);   % definiton  of the functions, those are ad hoc for a particular case
        G = @(yn1) ( y(i-1) + dt * (f(y(i-1)) + (7*(1-yn1/10)*y(i-1))) / 2 - yn1);
        try
            y(i) = Newton(G,Gp,y(i-1)); %Call for the newton method who returns the value of the solution
        catch err    %If the function Newton does not find any 0, returns an error, and here is handeled
            err_type= strfind(err.identifier,'MATLAB:Newton:');
            if (~isempty(err_type))
                error('MATLAB:AdamsMoulton:NewtonNoRoot','Solution of the problem not found by Newton: On step %i',i);                
            else
                rethrow(err);
            end
        end
    end
end