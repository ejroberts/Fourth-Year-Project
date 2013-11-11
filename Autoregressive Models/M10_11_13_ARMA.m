dt=pi/50;
t(1)=0;                      %Initial time
potential(1)=rand;           %Initial random potential
n=100;                         %Number of steps
theta=0.3;
phi=0.5;
L(1)=dt;

autocorrelation(1)=((1-theta*phi)*(phi-theta))/(1+(theta^2)-2*theta*phi);

for k=1:1:n
    a(k)=rand;
end

for k=2:1:n
        potential(k)=a(k)-theta*a(k-1)+phi*potential(k-1);   %Calculates potential 
        t(k)=t(k-1)+dt;                                 %Time increment
        autocorrelation(k)=phi*autocorrelation(k-1);     %Calculates the autocorrelation
        L(k)=k*dt;                                          %Lag
end 
 
f=fit(L(:), autocorrelation(:), 'exp1')
plot(L,autocorrelation, '-b')                             
hold on
plot(f)
xlabel('Lag','FontSize', 10)
ylabel('Autocorrelation','FontSize',10)
grid on
figure
plot(t,potential, '-')
b=coeffvalues(f);
CorrT=(-1)/b(2) 



