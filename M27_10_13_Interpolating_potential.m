l=0

for a=1:1:5
    
       for b=1:1:5
           l=l+1;
           A(a,b)=rand;                                                     %potential seed function
           position(l,1)=a;
           position(l,2)=b;
       end
end

q=1

for t=0:pi/4:2*pi  
    l=0
   for j=1:1:5
       for k=1:1:5
         l=l+1;
         fprintf('%f',t);
         potentialt=(0.9)*A(j,k)+0.0001*(rand-0.5);
         A(j,k)=potentialt                                                 %potential at each grid point
         position(l,3)=potentialt;
        [ej, ek] = differentiate(sf, [j, k])                                 %Electric field calculated as derivative of potential
        fj(j,k) = q*ej
        fk(j,k) = q*ek         
       end 
   end
        
        particlex=sin(t)+2                                               %particle motion in x-direction
        particley=cos(t)+2                                                %particle motion in y-direction
        scatter3(position(:,1),position(:,2),position(:,3))
        sf=fit([position(:,1), position(:,2)], position(:,3), 'biharmonicinterp')    %fits surface to potential
        plot(sf,[position(:,1), position(:,2)], position(:,3))
        figure
        partpot=interp2(A,particlex,particley)                                %potential at particle position
        partforcej=interp2(fj,particlex,particley)                              %force in j direction at particle position
        partforcek=interp2(fk,particlex,particley)                              %force in k direction at particle position
        
end




