l=0;
n=5;                                                       %grid size
for a=1:1:n
    for b=1:1:n
           l=l+1;
           A(a,b)=rand;                                    %potential seed function
           position(l,1)=a;
           position(l,2)=b;
    end
end
l=0;
for a=2:1:n-1
    for b=2:1:n-1
           l=l+1;
           A(a,b)=rand;                                                     %potential seed function
           grid(l,1)=a;
           grid(l,2)=b;
    end
end
q=1;
m=1;
particlex=2 ;                                             %initial particle x-position
particley=2 ;                                              %initial particle y-position
for t=0:pi/4:2*pi  
    l=0;
   for j=1:1:n
       for k=1:1:n
         l=l+1;
         fprintf('%f',t);
         potentialt=(0.9)*A(j,k)+0.0001*(rand-0.5);
         A(j,k)=potentialt                                                 %potential at each grid point
         position(l,3)=potentialt
         
         if (2<=k<=n-1)
             B(j,k-1)=potentialt
             grid(l,3)=potentialt
         end
         
       end 
   end
end
%         scatter3(position(:,1),position(:,2),position(:,3));
%         sf=fit([position(:,1), position(:,2)], position(:,3), 'biharmonicinterp');    %fits surface to potential
%         plot(sf,[position(:,1), position(:,2)], position(:,3));
%        if (particlex<=n && particley<=n)
%         [ej, ek] = differentiate(sf, [particlex,particley])                   %Electric field calculated as derivative of potential at particle position
%         fj = q*ej                                                               %Force at particle position in j direction
%         fk = q*ek                                                               %Force at particle position in k direction
%         aj = fj/m
%         ak = fk/m
%         particlex = particlex+aj*(pi/4)^2
%         particley = particley+ak*(pi/4)^2
%        elseif (particlex>n-1 && particley<=n-1)
%         partpot=interp2(A,particlex-(n),particley)
%        elseif (particlex<=n-1 && particley>n-1)
%         partpot=interp2(A,particlex,particley-(n))
%        else
%         
%                
%        end
% 
% end




