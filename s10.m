clear all
clc

data = load("data.mat");

a = data.ecg_data;
fs = data.fs;

N = length(a);
ts = 1/fs;

t = (0:N-1)*ts;
subplot(2,1,1)
plot(t,a);
title("normal");

%% downsampling  
% patladı çünkü çok fazla data kaybı oluyor bundan dolayı bazı yerlrde
% nabız yokmuş gibi oluyor.
%a_downsampling = downsample(a, 3);
%subplot(2,1,2)
%plot(t, a_downsampling(1:1000));
%title("downsample");

%% FFT 
% Burda bu kodu hoca istemiyor çok fazla.
%FFT = fft(a(1:1000));
%abs_FFT = abs(FFT);
%subplot(2,1,2)
%plot(t(1:500),abs_FFT(1:500))
%title("FFT");

%% Add Noise

subplot(2,1,2);
noise = -0.5+1*rand(size(a));
%noise2 = randn(size(a))*0.15; 
noise_a = a + noise;

plot(t, noise_a);


%% 10 saniye deneme1

t_10 = t(1:1000);

a_10 = a(1:1000);

noise_a_10 = noise_a(1:1000);

subplot(2,1,1);
plot(t_10, a_10);

subplot(2,1,2);
plot(t_10, noise_a_10);


