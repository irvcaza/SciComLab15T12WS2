function y = Heun(f, y0, dt, tend)

x= 0:dt:tend;
y  = zeros(1,length(x));
y(1) = y0;
n=length(x);
for i = 2:n
    ftemp = f(y(i-1));
    f1temp= f(y(i-1)+ dt * ftemp);      
    y(i) = y(i-1) + (ftemp+f1temp)*0.5* dt;
    
end

