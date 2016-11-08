function [r] = rCalc (x, y)
    rNum = numel(x)*sum(x.*y)-(sum(x)*sum(y));
    rDem = sqrt((numel(x)*sum(x.^2))-(sum(x)^2))*(sqrt((numel(y)*sum(y.^2))-(sum(y)^2)));
    r = rNum/rDem;
end