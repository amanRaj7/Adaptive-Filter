function [coefficient] = AdaptiveFilter(d, y, coeff, x)
%   Adaptive Filter
%   This is designed to change the coefficient
%   Input: d (Desired Signal), y(Output Signal), coeff (Previous),
%   x (Input Signal)
%   Output: Coefficient
    error = d-y;
    mu = 0.1;
    
    coefficient = coeff;
    for i = 1:length(coeff)
        sign_i = sign(x(i)) * sign(error(i));
        disp(sign_i);
        coefficient(i) = coeff(i) + mu*sign_i;
    end
end