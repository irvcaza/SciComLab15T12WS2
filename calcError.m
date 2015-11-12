%% Function calcError
%Calculates the error betwen two series of data
%% Imput:
% -dt (number): size of the interval
% -solution1(vector): series of data 1
% -solution2(vector): series of data 2
%% Output:
% -result (number): calculation of the total error
%% Notes
% - This function is used with a specia porpuse so it shoudnt be used as a
% general distance mesure

function result = calcError(dt, solution1, solution2)
    result = sqrt((dt./5)*(sum((solution1 - solution2).^2)));
end