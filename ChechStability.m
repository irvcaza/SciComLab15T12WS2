%% Function ChechStability
% Chechs for the stability for a given stepsize, function, method and
% intial value
% Calculates the aproximaction with a perturbed initial value and mesures
% how much changed from the solution given
%% Imput:
% -f (function): main function f 
% -fp (function): f prime, derivative of f (not used, just to for it
%   perrtenence to the AdamsMoulton function
% -y0 (number): initial value of f at time 0
% -dt (number): stepsize
% -tend (number): final time of the calculation
% -method(string): indicates the type of method
% -out(vector): gives the aproximation witout perturbation (to not
% calculate it again)
%% Ouput:
% Prints on the screen if instabilities are presented, if don't, theres not
% output(this can be changed uncomenting line 50
%% Notes:
% This function makes use of the functions:
% Euler, Heun, EulerImplicit, AdamsMoulton, AdamsMoultonL1, AdamsMoultonL2,
% and calcError


function ChechStability (f,fp,y0,dt,tend,method,out)

pert = y0 / 100; %level of perturbation
names = {'Explicit euler''s','Heun''s','Implicit Euler''s','Adams Moulton','Adams Moulton L1','Adams Moulton L2'};
%Vector of the names of the methods to be printed

limit = 2*pert; %limit for choosing, if the output perturbation is above this number, is cataloged as NOT Stable
met = 0; %initialize the variable (also if none method is chosen it wil trow an error)
stable = limit + 1;

switch method   % For each case we sum the error of the aproximation perturbed (up and down) aganist the the aproximation given
                % met indicates wich method was chosen
    case 'E_Eul'        
        stable = calcError(dt,Euler(f,y0+pert,dt,tend),out) + calcError(dt,Euler(f,y0-pert,dt,tend),out);
        met = 1;
    case 'Heun'        
        stable = calcError(dt,Heun(f,y0+pert,dt,tend),out) +  calcError(dt,Heun(f,y0-pert,dt,tend),out);
        met = 2;
    case 'I_Eul'        
        stable = calcError(dt,EulerImplicit(f,fp,y0+pert,dt,tend),out) +  calcError(dt,EulerImplicit(f,fp,y0-pert,dt,tend),out);
        met = 3;
    case 'Ad_Mu'        
        stable = calcError(dt,AdamsMoulton(f,fp,y0+pert,dt,tend),out) +  calcError(dt,AdamsMoulton(f,fp,y0-pert,dt,tend),out);
        met = 4;
    case 'Ad_Mu1'        
        stable = calcError(dt,AdamsMoultonL1(f,fp,y0+pert,dt,tend),out) +  calcError(dt,AdamsMoultonL1(f,fp,y0-pert,dt,tend),out);
        met = 5;
    case 'Ad_Mu2'        
        stable = calcError(dt,AdamsMoultonL2(f,fp,y0+pert,dt,tend),out) +  calcError(dt,AdamsMoultonL2(f,fp,y0-pert,dt,tend),out);
        met = 6;
end    
if stable > limit || isnan(stable) || isinf(stable) %decides if is stable, added the cases when it trows back a NaN, -Inf or Inf
    fprintf('The %s method with stepsize %4.3f is NOT stable (%5.4E) \n',names{met},dt,stable)
else % If you want to see if each case is stable or not, uncoment this option
    %fprintf('The %s method with stepsize %4.3f is stable (%5.4E) \n',names{met},dt,stable)
end
end