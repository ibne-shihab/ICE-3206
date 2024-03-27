clc;
clear ;
close all;
% Number of bits
N = 8;
% Generate random binary data
binary_data = [0 1 1 0 1 0 0 1];
% RZ Pulse Shaping
i = 1;
a = 0; % Initial value for the first half cycle
b = 0.5; % Initial value for the second half cycle
t = 0:0.01:(N-1); % Time vector
y = zeros(size(t)); % Initialize the output signal
for j = 1:length(t)
    if t(j) >= a && t(j) <= b % Condition for the first half cycle
        y(j) = binary_data(i); % Assign first 50 values
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
title('Unipolar Return-to-Zero (RZ) signaling');
xlabel('Time (bits)');
ylabel('Voltage Level');
