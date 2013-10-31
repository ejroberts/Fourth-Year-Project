t(1)=0;                      %Initial time
dt=pi/50;
potential(1)=rand;           %Initial random potential
n=10;                         %Number of steps
i=4;                        %Lag number

    for k=2:1:n
        potential(k)=potential(k-1)+(sqrt(dt))*(randn);   %Calculates potential 
        t(k)=t(k-1)+dt;                                 %Time increment
    end
    
 M=mean(potential)
 
    for k=1:1:n
        a(k)=(potential(k)-M)^2;
    end
 
    for k=1:1:n-i
        b(k)=(potential(k)-M)*(potential(k+i)-M);
    end
        
 den=sum(a);                                                 %Calculates the denominator of the autocorrelation function                                                   
 num=sum(b);                                                %Calculates the numerator of the autocorrelation function
 
 autocorrelation=num/den                                    %Calculates the autocorrelation coefficient
 
 plot(t,potential, '-rs')                                %Plots time against potential
 xlabel('Time','FontSize', 10)
 ylabel('Potential','FontSize',10)
 grid on



