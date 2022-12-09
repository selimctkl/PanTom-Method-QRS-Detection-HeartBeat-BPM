%% find the heart beath withouth findpeaks function


clear all
clc

data = load("data.mat");

a = data.ecg_data;
fs = data.fs;

T = 1;
a = a(1:1000);
N = length(a);
ts = 1/fs;

t = (0:N-1)*ts;
subplot(2,1,1)
plot(t,a);
title("normal");


treshold=0.56; %treshold for peak detection
peaks=[]; %peaks detection variables
peaks_locs=[];



for i=2:(length(a)-1)
    
    if a(i)>a(i-1) && a(i)>a(i+1) && a(i) >treshold
        peaks =[peaks a(i)];
        peaks_locs =[peaks_locs i];
    end
    
end


subplot(2,1,2);
plot(a);
hold on
plot(peaks_locs, peaks,"r*");

display(length(peaks));
