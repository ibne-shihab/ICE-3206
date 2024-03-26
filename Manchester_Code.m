clc;
clear ;
close all;
% Number of bits
N = 10;

% Generate random binary data
binary_data = randi([0, 1], 1, N);

% Binary to Manchester Conversion
manchester_data = [];
for m = 1:N
    if binary_data(m) == 1
        manchester_data = [manchester_data 1 -1];
    else
        manchester_data = [manchester_data -1 1];
    end
end

% Manchester Coding Pulse Shaping
i = 1;
l = 0.5;
t = 0:0.01:(2*N-1);

y = zeros(size(t)); % Initialize the output signal

for j = 1:length(t)
    if t(j) <= l % Condition for the first half cycle
        y(j) = manchester_data(i); % Assign values for the first half cycle
    else
        y(j) = manchester_data(i);
        i = i + 1; % Increment index for binary input data
        l = l + 1; % Increment l for the second half cycle
    end
end

% Plotting
plot(t, y, 'lineWidth', 2); % Linewidth 2 for clear visualization
axis([0, 2*N-1, -1.5, 1.5]); % Axis set-up
grid on;
title('Split Phase-Manchester Coding');
xlabel('Time (bits)');
ylabel('Voltage Level');
