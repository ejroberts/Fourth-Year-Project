t(1)=0;                      %Initial time
dt=pi/50;
potential(1)=rand;           %Initial random potential
n=50;                         %Number of steps
i=1;

    for k=2:1:n
        potential(k)=potential(k-1)+(sqrt(dt))*(randn)   %Calculates potential 
        t(k)=t(k-1)+dt;                                 %Time increment
    end
    
 M=0;
 N=0;
    
     for k=1:1:n-i
        M=M+potential(k)
    end
 
    Meana=M/(n-i)
    
    for k=1:1:n-i
        a(k)=(potential(k)-Meana)
    end
   
    
    for k=1+i:1:n
        N=N+potential(k)
    end
    
    Meanb=N/(n-i)
    
    for k=1:1:n-i
        b(k)=(potential(k+i)-Meanb)
    end
    
 A=sum(a.^2)
 B=sum(b.^2)
 
 den=sqrt(A*B)

num=sum(a.*b)
 
 autocorrelation=num/den
 


 



