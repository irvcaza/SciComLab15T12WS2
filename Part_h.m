% Get togeder all the errors
% Euler, Heun, Implicit Euler, Adams Moulton, Adams Moulton (linearization
% 1), Adams Moulton (linearization 2)
errors = [errors1 errors2 errors3];

%Calculate the factors
factors = errors (1:end-1,:)./ errors (2:end,:);

%% Printing the factors
disp('Factor of decreasement of the error when we halve the time step')
fprintf('Delta-t \t Euler \t Heun \t I-Euler Adams \tAdams-L1 Adams-L2  \n')
for i = 1:size(factors)
    fprintf('%4.4f \t \t',dt(i))
    fprintf('%5.4f \t',factors(i,:))
    fprintf('\n')
end