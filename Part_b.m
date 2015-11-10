
n = 6;
dt= 2.^-(0:(n-1));

b = hsv(n); 
M = {'Step Size = 1','Step Size = 1/2','Step Size = 1/4','Step Size = 1/8','Step Size = 1/16','Step Size = 1/32', 'Exact solution'};

%% Error calculation for the Euler method
figure
hold on
eulerApproxError = zeros(1,n);
for i=1:n
    out = Euler(f, y0, dt(i), tend) ;
    x= 0: dt(i):tend;
    plot(x,out, 'color', b(i,:),'LineWidth',1.5);
    eulerApproxError(i) = calcError(dt(i), out, fexact(x));
end

Part_a; 
xlabel('Time')
ylabel('Value of y ')
title('Plot of the approximate Solution using Eulers Method')
legend(M, 'Location', 'Northeast')

hold off

%% Error calculation for the Heuns method
figure
hold on
heunApproxError = zeros(1,n);
for i=1:n
    out = Heun(f, y0, dt(i), tend) ;
    x= 0: dt(i):tend;
    plot(x,out, 'color', b(i,:),'LineWidth',1.5);
    heunApproxError(i) = calcError(dt(i), out, fexact(x));
end

Part_a;
xlabel('Time')
ylabel('Value of y ')
title('Plot of the approximate Solution using Heun''s Method')
legend(M, 'Location', 'Northeast')

hold off


%%
disp('Errors aganist the analitical solution')

errors = [eulerApproxError' heunApproxError'];

fprintf('Delta-t \t Euler  \t Heun  \n')
for i = 1:size(errors)
    fprintf('%4.3f \t \t',dt(i))
    fprintf('%5.4E \t',errors(i,:))
    fprintf('\n')
end

