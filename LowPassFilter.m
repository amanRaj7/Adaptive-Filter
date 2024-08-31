function [coefficient] = LowPassFilter(samplingFreq, cutOffFreq, M)
    % Input: Sampling Frequency, Cutoff Frequency, Number of Tap
    % Output: Coefficient of filter
    % Number of Coefficient is 2*M+1
    n = linspace(-M, M, 2*M+1);
    coefficient = zeros(1, 2*M+1);
    nor = cutOffFreq/(2*samplingFreq);
    for i = 1:length(n)
        k = n(i);
        if k==0
            coefficient(i) = 2*cutOffFreq;
        else
            coefficient(i) = 2*cutOffFreq*((sin(nor*k))/(nor*k));
        end
    end
end