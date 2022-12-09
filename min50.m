% 45. dakika 50. dakika 
clear all
clc

data = load("data.mat");

a = data.ecg_data;
fs = data.fs;

T = 1;

N =  length(a);
ts = 1/fs;

t = (0:N-1)*ts;
t2 = t(270000:300000);
a2= a(270000:300000);
subplot(2,1,1)
plot(t2,a2);
title("normal");


treshold=0.56; %treshold for peak detection
peaks=[]; %peaks detection variables
peaks_locs=[];


beat_count = 0;
for i=2:(length(a)-1)
    
    if a(i)>a(i-1) && a(i)>a(i+1) && a(i) >treshold
        peaks =[peaks a(i)];
        peaks_locs =[peaks_locs i];
        beat_count = beat_count + 1;
    end
    
end


subplot(2,1,2);
plot(a);
hold on
plot(peaks_locs, peaks,"r*");

display(length(peaks))


duration_in_seconds = N/fs;
duration_in_minutes = duration_in_seconds / 60;
BPM = beat_count / duration_in_minutes



