clear all

load data.mat
e = ecg_data;
N = length(e);
ts = 1/fs;

t = (0:N-1)/fs;
subplot(9,1,1)
plot(t,e); 
title("All Clean Signal"); legend('Clean Signal'); xlabel('Time'); ylabel('Amplitude'); 
grid on

subplot(9,1,2);
noise = -0.5+1*rand(size(e));
%noise2 = randn(size(a))*0.15; 
noise_e = e + noise;

plot(t, noise_e);
grid on 
title("All Noisy Signal"); legend('Noisy Signal'); xlabel('Time'); ylabel('Amplitude')
t_10 = t(1:1000);
e_10 = e(1:1000);
noise_10 = noise_e(1:1000);

subplot(9,1,3);
plot(t_10, e_10);
grid on
title("10sec Clean Signal"); legend('Clean Signal'); xlabel('Time'); ylabel('Amplitude')

subplot(9,1,4);
plot(t_10, noise_10); title("10sec Noisy Signal"); legend('Noisy Signal'); xlabel('Time'); ylabel('Amplitude');

treshold=0.56; %treshold for peak detection
peak=[]; %peaks detection variables
peak_plc=[];

for i=2:(length(e)-1)
    
    if e(i)>e(i-1) && e(i)>e(i+1) && e(i) >treshold
        peak =[peak e(i)];
        peak_plc =[peak_plc i];
    end
    
end



subplot(9,1,5);
plot(e);
hold on
grid on
plot(peak_plc, peak,".");
title("All Signal With Peaks"); legend('Clean Signal', 'Peak Point That We Find'); xlabel('Time'); ylabel('Amplitude')
fprintf("Number of QRS in all signal")
display(length(peak));

treshold=0.56; %treshold for peak detection
peak=[]; %peaks detection variables
peak_plc=[];
e=e(1:1000);
for i=2:(length(e)-1)
    
    if e(i)>e(i-1) && e(i)>e(i+1) && e(i) >treshold
        peak =[peak e(i)];
        peak_plc =[peak_plc i];
    end
    
end



subplot(9,1,6);
plot(e);
hold on
grid on
plot(peak_plc, peak,".");
title("10 Sec Clean With Peaks"); legend('Clean Signal', 'Peak Point That We Find'); xlabel('Time'); ylabel('Amplitude')
fprintf("Number of QRS in 10 sec")
display(length(peak));

e = ecg_data;
t2 = t(270000:300000);
e2= e(270000:300000);

subplot(9,1,7)
plot(t2,e2);
grid on
title("45-50 Min Signal"); legend('Clean Signal'); xlabel('Time'); ylabel('Amplitude')
treshold=0.56; %treshold for peak detection
peak=[]; %peaks detection variables
peak_plc=[];


beat_count = 0;
for i=2:(length(e2)-1)
    
    if e2(i)>e2(i-1) && e2(i)>e2(i+1) && e2(i) >treshold
        peak =[peak e2(i)];
        peak_plc =[peak_plc i];
        beat_count = beat_count + 1;
    end
    
end


subplot(9,1,8);
plot(e2);
hold on
grid on
plot(peak_plc, peak,"x");
title("45-50 Min Signal For 5 Min"); legend('Clean Signal', 'Peak Point That We Find'); xlabel('Time 45-50 min'); ylabel('Amplitude')
%  display(length(peaks))
grid minor

duration_in_seconds = N/fs;
duration_in_minutes = duration_in_seconds / 60;
BPM = beat_count / duration_in_minutes;


noise = 0.5 * rand(size(e2))-0.5;
 %noise2 = randn(size(a))*0.15; 
 noise_e = e2 + noise;
 treshold=0.56; %treshold for peak detection
 peak=[]; %peaks detection variables
 peak_plc=[];
 N =  length(noise_e);
 
 beat_count = 0;
for i=2:(length(e2)-1)
    
    if noise_e(i)>noise_e(i-1) && noise_e(i)>noise_e(i+1) && noise_e(i) >treshold
        peak =[peak e2(i)];
        peak_plc =[peak_plc i];
        beat_count = beat_count + 1;
    end
    
end


subplot(9,1,9);
plot(noise_e);
hold on
grid on
plot(peak_plc, peak,"square"); title("45-50 Min Signal For 5 Min With Noise"); legend('Noisy Signal', 'Peak Point That We Find')
xlabel('Time 45-50 min');ylabel('Amplitude'); axis auto;
fprintf("Number of QRS between 45. and 50. minute")
display(length(peak));

duration_in_seconds = N/fs;
duration_in_minutes = duration_in_seconds / 60;

BPM = beat_count / duration_in_minutes