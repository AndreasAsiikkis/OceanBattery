% Butterworth Filter Function
% Fs = the sample frequency   (e.g. 200 Hz)
% Fc = the cuttoff frequency  (e.g. 10 Hz)
% Order filter = the order    (e.g. 1)
% Signal = the signal to be filtered

function output = bf(Fs,Fc,order_filter,signal)

[B,A] = butter(order_filter,Fc/(Fs/2));
output = filtfilt(B,A,signal);

% plot(time,signal,time,output);

end