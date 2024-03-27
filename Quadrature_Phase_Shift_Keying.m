%QPSK waveform generation
clc;
clear ;
close all;
x=[0 1 1 0 1 0 0 1];%input bits
%x=randi([0,1],1,10)

%Bits to polar
for i=1:length(x)
    if x(i)==0
        p(i)=-1;
    else
        p(i)=1;
    end
end

%separation of even and odd sequence
even_seq = p(1:2:length(x));
odd_seq = p(2:2:length(x));


t = 0:0.01:length(x);
%Unipolar-NRZ polar line coder signal generation
i = 1;
m= 2:2:length(x);
for j=1:length(t)
    if t(j)<=m(i)
        even_ps(j)=even_seq(i);
    else
        even_ps(j)=even_seq(i);
        i=i+1;
    end
end

i=1;
m=2:2:length(x);
for j=1:length(t)
    if t(j)<=m(i)
        odd_ps(j)=odd_seq(i);
    else
        odd_ps(j)=odd_seq(i);
        i=i+1;
    end
end

%Showing the first figure
figure(1)
subplot(2,1,1);
plot(t,even_ps,'r');
title('Even Sequences');
subplot(212);
plot(t,odd_ps,'r');
title('Odd Sequences');

%carrier signals generation
c1=cos(2*pi*1*t);
c2=sin(2*pi*1*t);


%Showing the Second figure
figure(2)
subplot(2,1,1);
plot(t,c1,'r');
title('The First Carrier Signal');
subplot(2,1,2)
plot(t,c2,'b');
title('The Second Carrier Signal');


%QPSK waveform generation
r1=even_ps.*c1;
r2=odd_ps.*c2;
qpsk_sig=r1-r2;


%Showing the Second figure
figure(3)
subplot(3,1,1)
plot(t,r1,'r');
title('Modulated Even Sequence');
subplot(3,1,2)
plot(t,r2,'b');
title('Modulated Odd Sequence');
subplot(3,1,3);
plot(t,qpsk_sig,'b');
title('QPSK Waveform');