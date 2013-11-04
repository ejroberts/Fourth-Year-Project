t(1)=0;                      %Initial time
dt=pi/50;
potential(1)=rand;           %Initial random potential
S(1)=rand;
n=10;                         %Number of steps
a=0.1;
b=0.9;

    for k=2:1:n
        potential(k)=potential(k-1)+(sqrt(dt))*(randn);   %Calculates potential 
        t(k)=t(k-1)+dt;                                 %Time increment
        S(k)=S(1)*exp((a-0.5*(b^2))*t(k)+b*potential(k)); 
    end
    

    
 
 for i=1:1:5
 M=0;
 N=0; 
 a=zeros([1,n])
 b=zeros([1,n])
 
     for k=1:1:n-i
         M=M+S(k)
    end
 
    Meana=M/(n-i)
    
    for k=1:1:n-i
        a(k)=(S(k)-Meana)
    end
    
    
    for k=1+i:1:n
        N=N+S(k)
    end
    
    Meanb=N/(n-i)
    
    for k=1:1:n-i
        b(k)=(S(k+i)-Meanb)
    end
    
 A=sum(a.^2)
 B=sum(b.^2)
 
 den=sqrt(A*B)

num=sum(a.*b)
 
 autocorrelation(i)=num/den
 end
 


 



