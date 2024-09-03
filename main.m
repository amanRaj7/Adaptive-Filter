clc, clearvars, close all;
%% Filter coefficient and Inpulse Respone of Low Pass Filter
samplingFreq = 20;
cutOffFreq = 40;
tap = 20;
coeff = LowPassFilter(samplingFreq, cutOffFreq, tap);
figure(1);
plot(coeff, '-o'); title("Inpulse Frequency Response of Low Pass Filter");
string_cut = sprintf('Cutoff Frequency = %d Hz\nSampling Frequency = %d Hz', cutOffFreq, samplingFreq);
text(25, 70, string_cut, 'HorizontalAlignment', 'left');
%% Wave having freq of 20Hz and 40Hz
samplingFreq = 100;
t = 0:1/samplingFreq:6;
freq1 = 10;
freq2 = 40;
x = sin(2*pi*freq1*t)+sin(2*pi*freq2*t);
x = x(1:41);
figure(2); sgtitle("Waves")
subplot(2, 1, 1); plot(x); title("Wave having Freq of 20Hz and 40Hz");
%% Applying Low Pass Filter on Wave
d_n = conv(coeff, x, 'same');
subplot(2, 1, 2); plot(d_n); title("Wave after applying Low Pass filter");
%% Applying Adaptive Filter
coefficient_i = ones(1, 2*tap+1) * 0;
run = 300;
figure(3); sgtitle("Adaptive Filter");
for i = 1:run
    y_n = conv(coefficient_i, x, 'same');
    figure(3);
    plot(y_n,'DisplayName', sprintf('%d', i));
    hold on;
    figure(4); sgtitle("Impulse Response of Adaptive Filter");
    coefficient_i = AdaptiveFilter(d_n, y_n, coefficient_i, x);
    plot(coefficient_i, 'DisplayName', sprintf('%d', i));
    hold on;
end
figure(3);plot(y_n, 'LineWidth', 2, 'Color', 'b'), hold off;
figure(4);plot(coefficient_i, 'LineWidth', 2, 'Color', 'b');hold off;
