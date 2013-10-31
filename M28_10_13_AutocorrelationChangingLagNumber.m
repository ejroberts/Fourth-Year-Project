t(1)=0;                      %Initial time
dt=pi/50;
potential(1)=rand;           %Initial random potential
n=100;                         %Number of steps



    for k=2:1:n
        potential(k)=potential(k-1)+(sqrt(dt))*(randn);   %Calculates potential 
        t(k)=t(k-1)+dt;                                 %Time increment
    end
    
 M=mean(potential);
 
    for k=1:1:n
        a(k)=(potential(k)-M)^2;
    end

den=sum(a);
    
for i=1:1:50
   
    for k=1:1:n-i
        b(k)=(potential(k)-M)*(potential(k+i)-M);
    end
                                                       %Calculates the denominator of the autocorrelation function                                                   
 num(i)=sum(b);                                                %Calculates the numerator of the autocorrelation function
 g(i)=i;
 autocorrelation(i)=num(i)/den;                                    %Calculates the autocorrelation coefficient
end

% f=fit(g,autocorrelation,'exp1')
plot(g,autocorrelation, '-rs')
                             
xlabel('Lag','FontSize', 10)
ylabel('Autocorrelation','FontSize',10)
grid on



