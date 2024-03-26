clc;
clear;
close all;
% Number of bits
N = 20;
% Generate random binary data
binary_data = randi([0, 1], 1, N);
% Mapping Function
polar_data = 2 * binary_data - 1;
% Time vector setup
t = 0:0.01:N-0.01;
% Extend binary data for plotting
extended_data = repelem(polar_data, 100);
% Plotting
plot(t, extended_data, 'linewidth', 2);
axis([0, N, -1.5, 1.5]); % Set axis limits
grid on;
title("Polar NRZ Signaling");
xlabel('Time (bits)');
ylabel('Voltage Level');
