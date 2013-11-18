n=100;
dt=pi/5;

for i=1:1:n 
    t(i)=dt*i;
    y(i)=sin(t(i));
    f(i)=1/t(i);
   
end

FFT=fft(y)
a=abs(FFT)
plot(f,a)
xlabel('Frequency')
ylabel('Fourier Transform')

