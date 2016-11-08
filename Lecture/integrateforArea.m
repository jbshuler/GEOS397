function [A] = integrateforArea (a)
    A = 1-(exp(-a))-a*(exp(-a));
return