
n = 6; % Number of test cases
dt= 2.^-(0:(n-1)); %vector of test cases

b = hsv(n);     %vector with colors to plot
M = {'Step Size = 1','Step Size = 1/2','Step Size = 1/4','Step Size = 1/8','Step Size = 1/16','Step Size = 1/32', 'Exact solution'};
%vector of cells to add labels to the plots

%% Error calculation for the Euler method
figure
hold on
eulerApproxError = nan(1,n); %vector of errors
for i=1:n %for each test case....
    out = Euler(f, y0, dt(i), tend) ;   %calculate the aproximation
    x= 0: dt(i):tend; %grid to plot
    plot(x,out, 'color', b(i,:),'LineWidth',1.5);
    eulerApproxError(i) = calcError(dt(i), out, fexact(x)); %save the error 
end

Part_a; %plot the  analitical solution
xlabel('Time') % add all the labels
ylabel('Value of y ')
title('Plot of the approximate Solution using Eulers Method')
legend(M, 'Location', 'Northeast')

hold off

%% Error calculation for the Heuns method
figure
hold on
heunApproxError = nan(1,n); %vector of errors
for i=1:n   %for each test case....
    out = Heun(f, y0, dt(i), tend) ;    %calculate the aproximation
    x= 0: dt(i):tend;   %grid to plot
    plot(x,out, 'color', b(i,:),'LineWidth',1.5);
    heunApproxError(i) = calcError(dt(i), out, fexact(x));  %we save the error 
end

Part_a; %plot the  analitical solution
xlabel('Time')  % add all the labels
ylabel('Value of y ')
title('Plot of the approximate Solution using Heun''s Method')
legend(M, 'Location', 'Northeast')

hold off


%% Print all the errors
disp('Errors aganist the analitical solution')

errors1 = [eulerApproxError' heunApproxError'];

fprintf('Delta-t \t Euler  \t Heun  \n')
for i = 1:size(errors1)
    fprintf('%4.3f \t \t',dt(i))
    fprintf('%5.4E \t',errors1(i,:))
    fprintf('\n')
end

