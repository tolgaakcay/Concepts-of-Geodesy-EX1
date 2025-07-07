clc
clear 
format long 
% The data is imported into MATLAB through the load function and turned
% into an array
load data
dset = table2array(data);
% The X and Y values from the data set are defined in seperate arrays
Xvalues = dset(:,5);
Yvalues = dset(:,6);
% Then the Fast Fourier Transformation is implemented on the value
% sets through the fft function
X = fft(Xvalues);
Y = fft(Yvalues);
%The length of the signal is found, then the double and signal spectra for
%each of the value sets are created.
L = length(Xvalues);  % Length of Signal
Fs = 365.25;          % Frequency of Sampling
T = 1/Fs;             % Period of Sampling
t = (0:L-1)*T;        % Time vector
% For X 
P2_X = abs(X/L); % Double Sided Spectrum
P1_X = P2_X(1:L/2+1); 
P1_X(2:end-1) = 2*P1_X(2:end-1);
f_X = Fs*(0:(L/2))/L; 
% For Y
P2_Y = abs(Y/L);
P1_Y = P2_Y(1:L/2+1);
P1_Y(2:end-1) = 2*P1_Y(2:end-1);
f_Y = Fs*(0:(L/2))/L;
% Plotting - A loglog function is used to display all the functions and
% single sided spectra created
PlotF = loglog(f_X,P1_X,f_Y,P1_Y); %
title("Single Sided Spectra of X and Y values")
xlabel("Cycles Per Year");
ylabel("Amplitude");
legend("X values", "Y values")
grid on
% Determining Chandler Period and the frequency of Peak 2 - The peaks in
% the plot have been determined from the plot itself
Chandler = (1/0.836463)*365.25;
sprintf('%f', Chandler)
Peak2 = (1/1.00376)*365.25*57.2957795*3600;
sprintf('%f', Peak2)







