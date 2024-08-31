clc, clearvars, close all;
%% Filter coefficient and Inpulse Respone of Low Pass Filter
samplingFreq = 20;
cutOffFreq = 40;
coeff = LowPassFilter(samplingFreq, cutOffFreq, 20);
figure(1);
plot(coeff, '-o'); title("Inpulse Frequency Response of Low Pass Filter");
string_cut = sprintf('Cutoff Frequency = %d Hz\nSampling Frequency = %d Hz', cutOffFreq, samplingFreq);
text(25, 70, string_cut, 'HorizontalAlignment', 'left');
%% Wave having freq of 20Hz and 40Hz
samplingFreq = 100;
t = 0:1/samplingFreq:6;
freq1 = 10;
freq2 = 40;
y = sin(2*pi*freq1*t)+sin(2*pi*freq2*t);
figure(2); sgtitle("Waves")
subplot(2, 1, 1); plot(y); title("Wave having Freq of 20Hz and 40Hz");
%% Applying Low Pass Filter on Wave
res = conv(coeff, y);
subplot(2, 1, 2); plot(res); title("Wave after applying Low Pass filter");