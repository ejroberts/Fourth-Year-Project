t(1)=0;                      %Initial time
dt=pi/50;
potential(1)=rand;           %Initial random potential

    for k=1:1:5
        potential(k+1)=potential(k)+(sqrt(dt))*(randn)   %Calculates potential 
        t(k+1)=t(k)+dt;                                 %Time increment
    end
 
 plot(t,potential, '-rs')                                %Plots time against potential
 xlabel('Time','FontSize', 10)
 ylabel('Potential','FontSize',10)
 grid on



