%% variable intialization

y0= 20;
tend=5;

f  = @(y) 7*(1-y/10).*y;
fp = @(y) 7*(1-y/5);
fexact=@(y) (200./(20-10.*exp(-7*y)));

%G = @(yn,yn1,t,dt) (yn1 - dt * f(t,yn1) - yn);
%Gp = @(yn1,t,dt) ( 1 + dt * fp(t,yn1));