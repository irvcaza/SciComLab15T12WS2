%% variable intialization

y0= 20; %initial value
tend=5; %units of time to be considered

f  = @(y) 7*(1-y/10).*y;    %explicit form of the derivative of function y
fp = @(y) 7*(1-y/5);        %explicit form of the derivative of function f
fexact=@(y) (200./(20-10.*exp(-7*y)));  %exact solution
