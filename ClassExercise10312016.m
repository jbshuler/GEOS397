%% #1
J0 = @(x) x^3-2*x-5; % Make a function. 

a = 0;
b = 3;
fzerogui( J0, [a,b] );

%% #2
a = 1;
b = 4;
f2 = @(x) sin(x);
z2 = fzerotx( f2, [a,b] );
%% #3

d = @(x) x^3-0.001;
P = [1, 0, 0, -0.001];
roots3 = roots( P )
%% #4

a = 0;
b = 1;
f3 = @(x) log10(x+(2/3));
z4 = fzerotx( f3, [a,b] );

%% #5
a = 1;
b = 4;
f5 = @(x) sign(x-2)*sqrt(abs(x-2));
z5 = fzerotx( f5, [a,b] );

%% #6
a = 0;
b = 5;
f6 = @(x) atan(x)-(pi/3);
z6 = fzerotx( f6, [a,b] );
%% #7
a = 0;
b = 5;
f7 = @(x) 1/(x-pi);
z7 = fzerotx( f7, [a,b] );
 
