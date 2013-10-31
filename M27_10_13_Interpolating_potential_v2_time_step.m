l=0
n=20

for a=1:1:n
    
       for b=1:1:n
           l=l+1;
           A(a,b)=rand;                                                     %potential seed function
           position(l,1)=a;
           position(l,2)=b;
       end
end

q=1
m=1 
particlex=2 ;                                             %particle motion in x-direction
particley=2 ; 
t(1)=0;                                                     %Initial time
dt=pi/4;                                                    %Time step

for z=2:1:10                                                %No of time steps  
    l=0
    
   for j=1:1:n
       for k=1:1:n
         l=l+1;
         fprintf('%f',t);
         potentialt=(0.9)*A(j,k)+0.0001*(rand-0.5);
         A(j,k)=potentialt;                                                 %potential at each grid point
         position(l,3)=potentialt;
       
       end 
   end
        
%         scatter3(position(:,1),position(:,2),position(:,3))
        sf=fit([position(:,1), position(:,2)], position(:,3), 'biharmonicinterp')    %fits surface to potential
% %         plot(sf,[position(:,1), position(:,2)], position(:,3))
% %         figure
        [gj, gk] = differentiate(sf, particlex,particley)                   %Electric field calculated as derivative of potential at particle position
        ej=-gj
        ek=-gk
        fj = q*ej                                                               %Force at particle position in j direction
        fk = q*ek                                                               %Force at particle position in k direction
        aj = fj/m
        ak = fk/m
        particlex = particlex+aj*dt^2
        particley = particley+ak*dt^2

        t(z)=t(z-1)+dt
       
end
plot3(particlex, particley, t)  
grid on



