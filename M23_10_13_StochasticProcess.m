t(1)=0;                      %Initial time
dt=pi/50;
potential(1)=rand;           %Initial random potential
a=0.1;

S(1)=rand;

for b=0:0.1:1;  
    for k=1:1:100
        potential(k+1)=potential(k)+(sqrt(dt))*(randn);   %Calculates potential 
        t(k+1)=t(k)+dt;                                 %Time increment
        S(k+1)=S(1)*exp((a-0.5*(b^2))*t(k+1)+b*potential(k+1));
    end
  
 plot(t,S, '-rs')                                %Plots time against potential
 xlabel('Time','FontSize', 10)
 ylabel('Potential','FontSize',10)
 grid on
 figure
 
end

