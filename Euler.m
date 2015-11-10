function y = Euler(f, y0, dt, tend)

x= 0:dt:tend;
y  = zeros(1,length(x));
y(1) = y0;
n=length(x);
for i = 2:n
    y(i) = y(i-1) + f(y(i-1))* dt;
    
end


