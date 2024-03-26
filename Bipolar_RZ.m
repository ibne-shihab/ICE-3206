clc;
clear all;
close all;
% Number of bits
N = 20;
% Generate random binary data
binary_data = randi([0, 1], 1, N);
% Binary to Bipolar Conversion
f = 1;
for m = 1:N
    if binary_data(m) == 1
        if f == 1
            bipolar_data(m) = 1;
            f = -1;
        else
            bipolar_data(m) = -1;
            f = 1;
        end
    else
        bipolar_data(m) = 0;
    end
end
% Bipolar RZ Pulse Shaping
i = 1;
a = 0; % Initial value for the first half cycle
b = 0.5; % Initial value for the second half cycle
t = 0:0.01:(N-1); % Time vector
y = zeros(size(t)); % Initialize the output signal
for j = 1:length(t)
    if t(j) >= a && t(j) <= b % Condition for the first half cycle
        y(j) = bipolar_data(i); % Assign first 50 values
    elseif t(j) > b && t(j) <= i % Condition for the Second half cycle
        y(j) = 0; % Set all values to 0 for the second half cycle
    else
        i = i + 1; % Binary input data index increment
        a = a + 1; % Initial value for the first half cycle increment
        b = b + 1; % Initial value for the second half cycle increment
    end
end
% Plotting
plot(t, y, 'lineWidth', 2); % Linewidth 2 for clear visualization
axis([0, N-1, -1.5, 1.5]); % Axis set-up
grid on;
title('Bipolar Return-to-Zero (BRZ) signaling');
xlabel('Time (bits)');
ylabel('Voltage Level');
