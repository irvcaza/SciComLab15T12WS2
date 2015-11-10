n = 6;
dt= 2.^-(0:(n-1));

b = hsv(n); 
M = {'Step Size = 1','Step Size = 1/2','Step Size = 1/4','Step Size = 1/8','Step Size = 1/16','Step Size = 1/32', 'Exact solution'};



%% Error calculation for the Adams Mullton method (linearization1)

figure
hold on
AdamApproxErrorL1 = nan(1,n);
k = 0;
for i=1:n
    try
        out = AdamsMoultonL1(f,fp,y0,dt(i),tend);
    catch err
        if (strcmp(err.identifier,'MATLAB:AdamsMoulton:NewtonNoRoot'))
            warning('Adams Moluton Method falied for step size %4.3e : Roots not found',dt(i))
            M(i-k) = [];
            k = k+1;
            continue;
        else
            rethrow(err);
        end
    end
    x= 0: dt(i):tend;
    plot(x,out, 'color', b(i,:),'LineWidth',1.5);
    AdamApproxErrorL1(i) = calcError(dt(i), out, fexact(x));
end

Part_a; 
xlabel('Time')
ylabel('Value of y ')
title('Plot of the approximate Solution using Adams Moulton Method')
legend(M, 'Location', 'Northeast')

hold off


%% Error calculation for the Adams Mullton method (linearization1)

figure
hold on
AdamApproxErrorL2 = nan(1,n);
k = 0;
for i=1:n
    try
        out = AdamsMoultonL2(f,fp,y0,dt(i),tend);
    catch err
        if (strcmp(err.identifier,'MATLAB:AdamsMoulton:NewtonNoRoot'))
            warning('Adams Moluton Method falied for step size %4.3e : Roots not found',dt(i))
            M(i-k) = [];
            k = k+1;
            continue;
        else
            rethrow(err);
        end
    end
    x= 0: dt(i):tend;
    plot(x,out, 'color', b(i,:),'LineWidth',1.5);
    AdamApproxErrorL2(i) = calcError(dt(i), out, fexact(x));
end

Part_a; 
xlabel('Time')
ylabel('Value of y ')
title('Plot of the approximate Solution using Adams Moulton Method')
legend(M, 'Location', 'Northeast')

hold off


%%
disp('Errors aganist the analitical solution')

errors2 = [ AdamApproxErrorL1'  AdamApproxErrorL2'];

fprintf('Delta-t \t I-Euler  \t Adams  \n')
for i = 1:size(errors2)
    fprintf('%4.3f \t \t',dt(i))
    fprintf('%5.4E \t',errors2(i,:))
    fprintf('\n')
end


