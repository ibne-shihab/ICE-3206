clc;
clear;
close all;
% Parameters
N = 20;  % Number of bits
bit_duration = 1;  % Duration of each bit (in seconds)
sampling_rate = 100; % Sampling rate (samples per second)
% Generate random binary data
binary_data = randi([0, 1], 1, N);
% Create time vector
t = 0:1/sampling_rate:N*bit_duration - 1/sampling_rate;
% Generate Unipolar NRZ signal
unipolar_signal = repmat(binary_data, sampling_rate*bit_duration, 1);
unipolar_signal = unipolar_signal(:); % Convert to column vector
% Plotting
plot(t, unipolar_signal, 'linewidth', 2);
axis([0, N*bit_duration, -0.5, 1.5]);  % Set axis limits
grid on;
title("Unipolar NRZ Signaling");
xlabel('Time (s)');
ylabel('Voltage Level');
