
x = 0:0.1:tend; %Stablish the grid
plot(x,fexact(x), 'k', 'LineWidth',1.5) %plot the function
axis([0 5 0 20])    %arrange the axis so they can fit with the specifications
