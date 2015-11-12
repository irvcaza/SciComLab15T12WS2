

n = 6;  % Number of test cases
dt= 2.^-(0:(n-1));  %vector of test cases

b = hsv(n); %vector with colors to plot
M = {'Step Size = 1','Step Size = 1/2','Step Size = 1/4','Step Size = 1/8','Step Size = 1/16','Step Size = 1/32', 'Exact solution'};
%vector of cells to add labels to the plots

%% Error calculation for the Adams Mullton method (linearization1)
figure
hold on
AdamApproxErrorL1 = nan(1,n);%vector of errors
k = 0;
for i=1:n   %for each test case....
    try
        out = AdamsMoultonL1(f,fp,y0,dt(i),tend);   %calculate the aproximation
    catch err   %In case the function Launches an errror, that test case is stoped, a warning is launched and continue with the next one
        if (strcmp(err.identifier,'MATLAB:AdamsMoulton:NewtonNoRoot'))
            warning('Adams Moluton Method falied for step size %4.3e : Roots not found',dt(i))
            M(i-k) = [];
            k = k+1;
            continue;
        else
            rethrow(err);
        end
    end
    x= 0: dt(i):tend;   %grid to plot
    plot(x,out, 'color', b(i,:),'LineWidth',1.5);
    AdamApproxErrorL1(i) = calcError(dt(i), out, fexact(x));%save the error 
end

Part_a; %plot the  analitical solution
xlabel('Time')  % add all the labels
ylabel('Value of y ')
title('Plot of the approximate Solution using Adams Moulton Method')
legend(M, 'Location', 'Northeast')

hold off


%% Error calculation for the Adams Mullton method (linearization2)

figure
hold on
AdamApproxErrorL2 = nan(1,n);%vector of errors
k = 0;
for i=1:n%for each test case....
    try
        out = AdamsMoultonL2(f,fp,y0,dt(i),tend);%calculate the aproximation
    catch err %In case the function Launches an errror, that test case is stoped, a warning is launched and continue with the next one
        if (strcmp(err.identifier,'MATLAB:AdamsMoulton:NewtonNoRoot'))
            warning('Adams Moluton Method falied for step size %4.3e : Roots not found',dt(i))
            M(i-k) = [];
            k = k+1;
            continue;
        else
            rethrow(err);
        end
    end
    x= 0: dt(i):tend;%grid to plot
    plot(x,out, 'color', b(i,:),'LineWidth',1.5);
    AdamApproxErrorL2(i) = calcError(dt(i), out, fexact(x));%save the error 
end

Part_a; %plot the  analitical solution
xlabel('Time')% add all the labels
ylabel('Value of y ')
title('Plot of the approximate Solution using Adams Moulton Method')
legend(M, 'Location', 'Northeast')

hold off


%% Print the errors
disp('Errors aganist the analitical solution')

errors3 = [ AdamApproxErrorL1'  AdamApproxErrorL2'];

fprintf('Delta-t \t Adams L1  \t Adams L2 \n')
for i = 1:size(errors3)
    fprintf('%4.3f \t \t',dt(i))
    fprintf('%5.4E \t',errors3(i,:))
    fprintf('\n')
end


