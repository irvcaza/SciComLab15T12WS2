

n = 6;  % Number of test cases
dt= 2.^-(0:(n-1));  %vector of test cases


b = hsv(n); %vector with colors to plot
M = {'Step Size = 1','Step Size = 1/2','Step Size = 1/4','Step Size = 1/8','Step Size = 1/16','Step Size = 1/32', 'Exact solution'};
%vector of cells to add labels to the plots

%% Error calculation for the Implicit Euler method
figure
hold on
IeulerApproxError = nan(1,n);%vector of errors
for i=1:n   %for each test case....
    out = EulerImplicit(f,fp,y0,dt(i),tend);    %calculate the aproximation
    ChechStability (f,fp,y0,dt(i),tend,'I_Eul',out) %calculate the stability 
    x= 0: dt(i):tend;   %grid to plot
    plot(x,out, 'color', b(i,:),'LineWidth',1.5);
    IeulerApproxError(i) = calcError(dt(i), out, fexact(x));    %save the error 
end

Part_a; %plot the  analitical solution
xlabel('Time')   % add all the labels
ylabel('Value of y ')
title('Plot of the approximate Solution using Implicit Eulers Method')
legend(M, 'Location', 'Northeast')

hold off

%% Error calculation for the Adams Mullton method

figure
hold on
AdamApproxError = nan(1,n);%vector of errors
k = 0;  %counter of aborted test cases
for i=1:n    %for each test case....
    try
        out = AdamsMoulton(f,fp,y0,dt(i),tend);%calculate the aproximation
    catch err   %In case the function Launches an errror, that test case is stoped, a warning is launched and continue with the next one
        if (strcmp(err.identifier,'MATLAB:AdamsMoulton:NewtonNoRoot'))
            warning('Adams Moluton Method falied for step size %4.3e : Roots not found',dt(i))
            M(i-k) = [];    %This means that for that test case the solution will no be plotted, so we have to erase the legend
            k = k+1;    
            continue;
        else
            rethrow(err);
        end
    end
    ChechStability (f,fp,y0,dt(i),tend,'Ad_Mu',out) %calculate the stability 
    x= 0: dt(i):tend;
    plot(x,out, 'color', b(i,:),'LineWidth',1.5);
    AdamApproxError(i) = calcError(dt(i), out, fexact(x));%save the error 
end

Part_a; %plot the  analitical solution
xlabel('Time')  % add all the labels
ylabel('Value of y ')
title('Plot of the approximate Solution using Adams Moulton Method')
legend(M, 'Location', 'Northeast')

hold off

%% Print the errors
disp('Errors aganist the analitical solution')

errors2 = [IeulerApproxError' AdamApproxError'];

fprintf('Delta-t \t I-Euler  \t Adams  \n')
for i = 1:size(errors2)
    fprintf('%5.4f \t \t',dt(i))
    fprintf('%5.4E \t',errors2(i,:))
    fprintf('\n')
end


