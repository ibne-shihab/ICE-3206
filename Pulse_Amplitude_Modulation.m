clc;
clear ;
close all;
fc = 100;
fm = fc / 10;
fs = 100 * fc;
t = 0:1/fs:4/fm;
mt = cos(2*pi*fm*t);
ct = 0.5*square(2*pi*fc*t) + 0.5;
st = mt.*ct;
tt = [];

% Single-sided PAM
for i = 1:length(st)
    if st(i) == 0
        tt = [tt, st(i)];
    else
        tt = [tt, st(i) + 2];
    end
end
subplot(4,1,1);
plot(t, mt);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(4,1,2);
plot(t, ct);
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(4,1,3);
plot(t, st);
title('Modulated Signal (SSB)');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(4,1,4);
plot(t, tt);
title('Single Sideband Pulse Amplitude Modulation (PAM)');
xlabel('Time (s)');
ylabel('Amplitude');
