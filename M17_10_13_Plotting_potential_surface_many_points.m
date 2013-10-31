for a=1:1:5
       for b=1:1:5
           A(a,b)=a^2   %potential seed function
       end
end     
l=1
for t=0:pi/50:2*pi  
    l=l+1
   for j=1:1:5
       for k=1:1:5
         x=sin(t)+2;        %particle motion in x-direction
         y=cos(t)+2;        %particle motion in y-direction
         fprintf('%f',t);
         potentialt=(0.9)*A(j,k)+0.1*(rand-0.5);
         A(j,k)=potentialt;  %potential at each grid point
    
                    
 
       end
       
   end
   position(l,1)=x;
   position(l,2)=y;
   position(l,3)=potentialt;
end

scatter3(position(:,1),position(:,2),position(:,3));
sf=fit([position(:,1), position(:,2)], position(:,3), 'poly23');
plot(sf,[position(:,1), position(:,2)], position(:,3)) 
