a=0.2;                         %Sets fraction of random number
t(1)=0;                      %Initial time
potential(1)=rand;           %Initial random potential

for b=0:0.02:0.1              %Fraction of previous potential
    for k=1:1:100
        potential(k+1)=(1-a)*potential(k)+b*(rand-0.5);   %Calculates potential
        t(k+1)=t(k)+pi/50;                              %Time increment
    end
  
 plot(t,potential, '-r')      %Plots time against potential
 xlabel('Time','FontSize', 10)
 ylabel('Potential','FontSize',10)
 grid on
 figure

end

