%% Class Exercise, 10/19
close all;
clear all;
clc;
%% Integration using integral command
f = @(y) sqrt(y+1);     % use an anonymous function
fI = integral( f, 0, 3, 'AbsTol', 1.e-8 );
%%
g = @(r) ((5*r)./((4+r.^2).^2));
gI = integral( g, -1, 1, 'AbsTol', 1.e-8 );
%%
j = @(o) ((cos(2.*o)).^2)*sin(2.*o) ;
jI = integral( j, -1, 1, 'AbsTol', 1.e-8 );
%% 5
k = @(x) 2.*x.*(exp(x.^2)).*(cos(exp(x.^2))) ;
kI = integral( k, 0, sqrt(log(pi)), 'AbsTol', 1.e-8 );
%% 6
m = @(y) 1./(2.*sqrt(y).*(1+sqrt(y)).^2) ;
mI = integral( m, 1, 4, 'AbsTol', 1.e-8 );
%% Part 2
x = linspace(0,5,101);
y = x.*(exp(-x));

h = figure;
plot (x,y);
%% #2
a = @(x) x.*(exp(-x)) ;
aI = integral( a, 0, 5, 'AbsTol', 1.e-8 );

aI2 = 1-(exp(-5))-5*(exp(-5));
%% #4
a = 5;
A = integrateforArea (a);


