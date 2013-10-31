l=0

for a=1:1:5
    
       for b=1:1:5
           l=l+1
           A(a,b)=a^2   %potential seed function
           position(l,1)=a
           position(l,2)=b
       end
end     


for t=0:pi/4:2*pi  
    l=0
   for j=1:1:5
       for k=1:1:5
         l=l+1
         x=sin(t)+2;        %particle motion in x-direction
         y=cos(t)+2;        %particle motion in y-direction
         fprintf('%f',t);
         potentialt=(0.9)*A(j,k)+0.1*(rand-0.5);
         A(j,k)=potentialt;  %potential at each grid point
        potentialt(l,1)=potentialt;
       end 
   end
  
   

   scatter3(position(:,1),position(:,2),position(:,3))
        sf=fit([position(:,1), position(:,2)], position(:,3), 'poly23');
        plot(sf,[position(:,1), position(:,2)], position(:,3)); 
end

